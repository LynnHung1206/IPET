package com.web.appoint.model.services.imp;

import com.web.appoint.model.dao.AppointmentDAO;
import com.web.appoint.model.dao.AppointmentDetailDAO;
import com.web.appoint.model.dao.imp.AppointmentDetailImp;
import com.web.appoint.model.dao.imp.AppointmentImp;
import com.web.appoint.model.entities.Appointment;
import com.web.appoint.model.entities.AppointmentDetail;
import com.web.appoint.model.services.AppointServices;
import com.web.job.model.dao.JobScheduleDAO;
import com.web.job.model.dao.JobScheduleImp;
import com.web.job.model.entities.JobSchedule;
import com.web.member.model.dao.MemberDAO;
import com.web.member.model.dao.MemberDAOImpl;
import com.web.pet.model.dao.PetDAO;
import com.web.pet.model.dao.PetDAOImpl;
import com.web.salonSale.model.dao.SaleDAO;
import com.web.salonSale.model.dao.impl.SaleDAOImpl;
import com.web.salonService.model.dao.ServiceDAO;
import com.web.salonService.model.dao.impl.ServiceDAOImpl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author Yu-Jing
 * @create 2023/1/3 上午 10:56
 */
public class AppointServicesImp implements AppointServices {
    private final AppointmentDAO appointmentDAO;
    private final AppointmentDetailDAO appointmentDetailDAO;
    private final JobScheduleDAO jobScheduleDAO;
    private final ServiceDAO serviceDAO;
    private final SaleDAO saleDAO;
    private final MemberDAO memberDAO;
    private final PetDAO petDAO;


    public AppointServicesImp(){
        appointmentDAO = new AppointmentImp();
        appointmentDetailDAO = new AppointmentDetailImp();
        jobScheduleDAO = new JobScheduleImp();
        saleDAO = new SaleDAOImpl();
        serviceDAO = new ServiceDAOImpl();
        memberDAO = new MemberDAOImpl();
        petDAO = new PetDAOImpl();
    }

    @Override
    public Appointment makeAppoint(Appointment appointment) {
        // 0. 獲得對應的班表 與 Appointment的服務細項
        JobSchedule job = jobScheduleDAO.getById(appointment.getSchID());
        AppointmentDetail[] apps = appointment.getAppointmentDetails();


        // 1. 判斷此預約所預定的班表是否尚未被預約
        if (job.getApmId() != null){
            appointment.setSuccessful(false);
            appointment.setMessage("新增失敗，該時段已被其他人預約");
            return appointment;
        }

        // 2. 判斷此預約是否只預約一種 Service category
        Set<Integer> serviceCategoryIds = new HashSet<>();
        for (AppointmentDetail appointmentDetail : appointmentDetailDAO.getAllServicesByApmId(appointment.getApmID())) {
            Integer svcID = appointmentDetail.getSvcId();
            serviceCategoryIds.add(serviceDAO.getById(svcID).getCatId());
        }

        if (serviceCategoryIds.size() != 1) {
            appointment.setSuccessful(false);
            appointment.setMessage("新增失敗，服務類別數量異常");
            return appointment;
        }

        // 3. 將資料加進 Appointment Table，並獲得 apmId
        appointment.setSuccessful(true);
        appointment.setMessage("新增成功");
        Integer ampId = appointmentDAO.add(appointment);

        // 4. 更新 jobschedule: 將 ApmID 加進 job schedule中
        job.setApmId(ampId);
        jobScheduleDAO.update(job);

        // 4. 新增 AppointmentDetail: 將 Appointment 的服務細項新增至 AppointmentDetail Table
        appointmentDetailDAO.addBatch(apps);

        return appointment;
    }

    @Override
    public Boolean deleteAppoint(Integer id) {
        Appointment appoint = appointmentDAO.getById(id);
        // 1. 更新 jobschedule
        JobSchedule job = jobScheduleDAO.getById(appoint.getSchID());
        job.setApmId(null);
        jobScheduleDAO.update(job);

        // 2. 刪除對應的 AppointmentDetail
        appointmentDetailDAO.deleteByApmId(id);
        return true;
    }

    @Override
    public Appointment editAppoint(Appointment newAppointment) {
        Appointment oldAppointment = appointmentDAO.getById(newAppointment.getApmID());
        JobSchedule originalJob = jobScheduleDAO.getById(oldAppointment.getSchID());
        JobSchedule newSelectJob = jobScheduleDAO.getById(newAppointment.getSchID());

        // 1. 僅允許使用者修改 schID  預約狀態 與 note (訂單建立時間會轉變成 修改時間，因此允許不同)，
        // 不可更動其他欄位: apmID, MemID, PetID, TotalPrice
        // 確認其他欄位與之前相同，以避開資料被 null覆蓋
        if (!newAppointment.getApmID().equals(oldAppointment.getApmID()) ||
            !newAppointment.getMemID().equals(oldAppointment.getMemID()) ||
            !newAppointment.getPetID().equals(oldAppointment.getPetID()) ||
            !newAppointment.getTotalPrice().equals(oldAppointment.getTotalPrice())){
                newAppointment.setSuccessful(false);
                newAppointment.setMessage("修改失敗，只可修改班表、預約狀態與備註。");
                return newAppointment;
        }

        // 2. 當原狀態為 "已支付訂金" 才可以修改班表與狀態
        if (oldAppointment.getApmStatus() != 0){
            if (!oldAppointment.getApmStatus().equals(newAppointment.getApmStatus()) ||
                !oldAppointment.getSchID().equals(newAppointment.getSchID())) {
                    newAppointment.setSuccessful(false);
                    newAppointment.setMessage("修改失敗，預約狀態不是 已支付訂金，故不可修改狀與班表。");
                    return newAppointment;
            }
        }


        // 3. 通過上面的檢查，開始進行資料update

        // 3.1 更改班表 (狀態必須為 已支付訂金)
        if (!oldAppointment.getSchID().equals(newAppointment.getSchID())){
            //  "新班表" 是否已被預約
            if (newSelectJob.getApmId() != null) {
                newAppointment.setSuccessful(false);
                newAppointment.setMessage("修改失敗，此時段與日期已被預約。");
            }else {
                originalJob.setApmId(null);
                newSelectJob.setApmId(newAppointment.getApmID());
                jobScheduleDAO.update(originalJob);
                jobScheduleDAO.update(newSelectJob);

                newAppointment.setSuccessful(true);
                newAppointment.setMessage("修改成功");
                appointmentDAO.update(newAppointment);
            }
            return newAppointment;
        }

        // 3.2 更改狀態
        // 3.2.1 改為已完成 或 逾時未到 (不用更新班表)
        if (newAppointment.getApmStatus().equals(1) || newAppointment.getApmStatus().equals(3)){
            newAppointment.setSuccessful(true);
            newAppointment.setMessage("修改成功");
            appointmentDAO.update(newAppointment);
            return newAppointment;
        }

        // 3.2.2 改為已取消 (需要更新班表)
        if (newAppointment.getApmStatus().equals(2)){
            originalJob.setApmId(null);
            jobScheduleDAO.update(originalJob);
            newAppointment.setSuccessful(true);
            newAppointment.setMessage("修改成功");
            appointmentDAO.update(newAppointment);
            return newAppointment;
        }

        // 3.3 狀態與班表都未更新
        if (oldAppointment.getSchID().equals(newAppointment.getSchID()) &&
            oldAppointment.getApmStatus().equals(newAppointment.getApmStatus())){
            newAppointment.setSuccessful(true);
            newAppointment.setMessage("修改成功");
            appointmentDAO.update(newAppointment);
            return newAppointment;
        }
        return null;
    }

    @Override
    public List<Appointment> findAllAppoint() {
         // 完整顯示 APM_ID memName petName schDate schPeriod TotalPrice APM_STATUS schId appointmentdetail
        List<Appointment> all = appointmentDAO.getAll();
        return integrateAppointments(all);
    }

    @Override
    public Appointment findAppointById(Integer id) {
        // 完整顯示 APM_ID memName petName schDate schPeriod TotalPrice APM_STATUS schId appointmentdetail
        List<Appointment> appoint = new ArrayList<>();
        appoint.add(appointmentDAO.getById(id));
        return integrateAppointments(appoint).get(0);
    }
    
    @Override
    public List<Appointment> findAppointByMemId(Integer memID){
    	List<Appointment> appoints = appointmentDAO.findAppointByMemId(memID);
    	return integrateAppointments(appoints);
    }

    @Override
    public List<Appointment> findAppointBasedOnStatus(Integer status) {
         // 完整顯示 APM_ID memName petName schDate schPeriod TotalPrice APM_STATUS schId appointmentdetail
        List<Appointment> all = appointmentDAO.findAppointByStatus(status);
        return integrateAppointments(all);
    }
    
    private List<Appointment> integrateAppointments(List<Appointment> all) {
        for (Appointment appoint : all) {
            JobSchedule job = jobScheduleDAO.getById(appoint.getSchID());
            Integer memID = appoint.getMemID();
            Integer petID = appoint.getPetID();

            List<AppointmentDetail> allServicesByAmpId = appointmentDetailDAO.getAllServicesByApmId(appoint.getApmID());
            Integer price = appointmentDetailDAO.getTotalPriceByApmId(appoint.getApmID());

            // 加入會員的資料:  MemName, PetName
            appoint.setMemName(memberDAO.getById(memID).getMemName());
            appoint.setPetName(petDAO.getById(petID).getPetName());

            //加入工作的資料: SchDate, SchPeriod
            appoint.setSchDate(job.getSchDate());
            appoint.setSchPeriod(job.getSchPeriod());


            // 將 AppointmentDetail service 的資料填齊
            for (AppointmentDetail detail : allServicesByAmpId){
                Integer svcID = detail.getSvcId();
                Integer saleID = detail.getSaleId();
                detail.setSvcName(serviceDAO.getById(svcID).getSvcName());
                detail.setSvcContent(serviceDAO.getById(svcID).getSvcContent());
                detail.setSaleName(saleDAO.getById(saleID).getSaleName());
            }


            appoint.setAppointmentDetails(allServicesByAmpId.toArray(AppointmentDetail[]::new));
            appoint.setTotalPrice(price);
            switch (appoint.getApmStatus()) {
                case 0 -> appoint.setApmStatusDesc("已支付訂金");
                case 1 -> appoint.setApmStatusDesc("已完成預約");
                case 2 -> appoint.setApmStatusDesc("預約取消");
                case 3 -> appoint.setApmStatusDesc("逾時未到");
            }
        }
        return all;
    }

}
