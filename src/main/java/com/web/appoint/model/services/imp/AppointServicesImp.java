package com.web.appoint.model.services.imp;

import com.web.appoint.model.dao.imp.AppointmentDetailImp;
import com.web.appoint.model.dao.imp.AppointmentImp;
import com.web.appoint.model.entities.Appointment;
import com.web.appoint.model.entities.AppointmentDetail;
import com.web.appoint.model.services.AppointServices;
import com.web.job.model.dao.JobScheduleImp;
import com.web.job.model.entities.JobSchedule;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author Yu-Jing
 * @create 2023/1/3 上午 10:56
 */
public class AppointServicesImp implements AppointServices {
    private final AppointmentImp appointmentImp = new AppointmentImp();
    private final AppointmentDetailImp appointmentDetailImp = new AppointmentDetailImp();
    private final JobScheduleImp jobScheduleImp = new JobScheduleImp();

    // TODO: private MemDAOImp memDAOImp
    // TODO: private ServiceCategory

    @Override
    public Appointment makeAppoint(Appointment appointment) {
        // 0. 獲得對應的班表 與 Appointment的服務細項
        JobSchedule job = jobScheduleImp.getById(appointment.getSchID());
        AppointmentDetail[] apps = appointment.getAppointmentDetails();


        // 1. 判斷此預約所預定的班表是否尚未被預約
        if (job.getAmpId() != null){
            appointment.setSuccessful(false);
            appointment.setMessage("新增失敗，該時段已被其他人預約");
            return appointment;
        }

        // 2. 判斷此預約是否只預約一種 Service category
        Set<Integer> serviceCategoryIds = new HashSet<>();
        for (AppointmentDetail appointmentDetail : appointmentDetailImp.getAllServicesByApmId(appointment.getApmID())) {
            // TODO: 串接 serviceCategory
        }
        if (serviceCategoryIds.size() != 1) {
            appointment.setSuccessful(false);
            appointment.setMessage("新增失敗，服務類別數量異常");
            return appointment;
        }

        // 3. 將資料加進 Appointment Table，並獲得 apmId
        appointment.setSuccessful(true);
        appointment.setMessage("新增成功");
        Integer ampId = appointmentImp.add(appointment);

        // 4. 更新 jobschedule: 將 AmpID 加進 job schdule中
        job.setAmpId(ampId);
        jobScheduleImp.update(job);

        // 4. 新增 AppointmentDetail: 將 Appointment 的服務細項新增至 AppointmentDetail Table
        appointmentDetailImp.addBatch(apps);

        return appointment;
    }

    @Override
    public Boolean deleteAppoint(Integer id) {
        Appointment appoint = appointmentImp.getById(id);
        // 1. 更新 jobschedule
        JobSchedule job = jobScheduleImp.getById(appoint.getSchID());
        job.setAmpId(null);
        jobScheduleImp.update(job);

        // 2. 刪除對應的 AppointmentDetail
        appointmentDetailImp.deleteByApmId(id);
        return true;
    }

    @Override
    public Appointment editAppoint(Appointment newAppointment) {
        Appointment oldAppointment = appointmentImp.getById(newAppointment.getApmID());
        JobSchedule originalJob = jobScheduleImp.getById(oldAppointment.getSchID());
        JobSchedule newSelectJob = jobScheduleImp.getById(newAppointment.getSchID());

        // 1.  僅允許使用者修改 班表  預約狀態 note，不可更動其他欄位!
        // 確認其他欄位與之前相同，以避開資料被 null覆蓋
        if (!newAppointment.getSchID().equals(oldAppointment.getSchID()) ||
        !newAppointment.getMemID().equals(oldAppointment.getMemID()) ||
        !newAppointment.getPetID().equals(oldAppointment.getPetID()) ||
        !newAppointment.getApmBuildTime().equals(oldAppointment.getApmBuildTime()) ||
        !newAppointment.getTotalPrice().equals(oldAppointment.getTotalPrice())){
            newAppointment.setSuccessful(false);
            newAppointment.setMessage("修改失敗，只可修改班表、狀態與備註。");
            return newAppointment;
        }


        // 2. 狀況 1: 班表更動 + 狀態沒動
        if (!newSelectJob.equals(originalJob) && newAppointment.getApmStatus().equals(oldAppointment.getApmStatus())) {
            //  "新班表" 是否已被預約
            if (newSelectJob.getAmpId() != null) {
                newAppointment.setSuccessful(false);
                newAppointment.setMessage("修改失敗，此時段與日期已被預約。");
                return newAppointment;
            }

            // 新班表未被預約 --> 新增預約單至新班表，移除預約單從舊班表
            newSelectJob.setAmpId(newAppointment.getApmID());
            originalJob.setAmpId(null);
            jobScheduleImp.update(originalJob);
            jobScheduleImp.update(newSelectJob);

            newAppointment.setSuccessful(true);
            newAppointment.setMessage("修改班表成功。");
            appointmentImp.update(newAppointment);
            return newAppointment;

            // 2. 狀況 2: 班表沒動 + 狀態更動
        } else if (newSelectJob.equals(originalJob) && !newAppointment.getApmStatus().equals(oldAppointment.getApmStatus())) {
            //  預約單狀況更改為 已取消 (其餘狀態不用更新班表)，--> 移除預約單從舊班表
            if (newAppointment.getApmStatus().equals(2)){
                originalJob.setAmpId(null);
                jobScheduleImp.update(originalJob);

                newAppointment.setSuccessful(true);
                newAppointment.setMessage("修改狀態成功。");
                appointmentImp.update(newAppointment);
                return newAppointment;
            }

            // 2. 狀況 3: 班表更動 + 狀態更動
        }else if (!newSelectJob.equals(originalJob) && !newAppointment.getApmStatus().equals(oldAppointment.getApmStatus())){
            //  "新班表" 是否已被預約
            if (newSelectJob.getAmpId() != null) {
                newAppointment.setSuccessful(false);
                newAppointment.setMessage("修改失敗，此時段與日期已被預約。");
                return newAppointment;
            }

            if (newAppointment.getApmStatus().equals(2)){
                originalJob.setAmpId(null);
                newSelectJob.setAmpId(null);
                jobScheduleImp.update(originalJob);
                jobScheduleImp.update(newSelectJob);

                newAppointment.setSuccessful(true);
                newAppointment.setMessage("修改狀態成功。");
                appointmentImp.update(newAppointment);
                return newAppointment;
            }
        }
        return newAppointment;
    }

    @Override
    public List<Appointment> findAllAppoint() {
         // 完整顯示 APM_ID memName petName schDate schPeriod TotalPrice APM_STATUS schId appointmentdetail
        // TODO: 需串接會員資料
        List<Appointment> all = appointmentImp.getAll();
        return integrateAppointments(all);
    }

    @Override
    public Appointment findAppointById(Integer id) {
        // 完整顯示 APM_ID memName petName schDate schPeriod TotalPrice APM_STATUS schId appointmentdetail
        // TODO: 需串接會員資料
        return appointmentImp.getById(id);
    }

    @Override
    public List<Appointment> findAppointBasedOnStatus(Integer status) {
         // 完整顯示 APM_ID memName petName schDate schPeriod TotalPrice APM_STATUS schId appointmentdetail
        // TODO: 需串接會員資料
        List<Appointment> all = appointmentImp.findAppointByStatus(status);
        return integrateAppointments(all);
    }
    
    private List<Appointment> integrateAppointments(List<Appointment> all) {
        for (Appointment appoint : all) {
            JobSchedule job = jobScheduleImp.getById(appoint.getSchID());
            List<AppointmentDetail> allServicesByAmpId = appointmentDetailImp.getAllServicesByApmId(appoint.getApmID());
            Integer price = appointmentDetailImp.getTotalPriceByApmId(appoint.getApmID());

            appoint.setMemName(appoint.getMemID() + "-會員名字");
            appoint.setPetName(appoint.getPetID() + "-寵物名字");
            appoint.setSchDate(job.getSchDate());
            appoint.setSchPeriod(job.getSchPeriod());
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
