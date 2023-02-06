package com.web.job.model.services.imp;

import com.web.appoint.model.dao.AppointmentDAO;
import com.web.appoint.model.dao.imp.AppointmentImp;
import com.web.appoint.model.entities.Appointment;
import com.web.job.model.dao.JobScheduleDAO;
import com.web.job.model.dao.JobScheduleImp;
import com.web.job.model.entities.JobSchedule;
import com.web.job.model.services.JobScheduleServices;
import com.web.staff.model.dao.StaffDAO;
import com.web.staff.model.dao.impl.StaffDAOImpl;
import com.web.staff.model.entity.Staff;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 08:13
 */
public class JobScheduleServicesImp implements JobScheduleServices {
    private final JobScheduleDAO jobScheduleDAO;
    private final AppointmentDAO appointmentDAO;
    private final StaffDAO staffDAO;

    public JobScheduleServicesImp(){
        jobScheduleDAO = new JobScheduleImp();
        appointmentDAO = new AppointmentImp();
        staffDAO = new StaffDAOImpl();
    }

    @Override
    public JobSchedule[] addJobs(JobSchedule[] jobSchedules) {
        for (JobSchedule job : jobSchedules) {
            Date schDate = job.getSchDate();
            String schPeriod = job.getSchPeriod();
            Integer groomerID = job.getGroomerID();
            Integer asstID1 = job.getAsstID1();
            Integer asstID2 = job.getAsstID2();

            List<JobSchedule> schByDatePeriod = jobScheduleDAO.getSchByDatePeriod(schDate, schPeriod);
            Set<Integer> empsByDatePeriod = jobScheduleDAO.getEmpsByDatePeriod(schDate, schPeriod);

            // 1. 判斷員工是否選擇正確
            if (!"美容師".equals(staffDAO.getById(groomerID).getPosi()) ||
                !"美容助理".equals(staffDAO.getById(asstID1).getPosi()) ||
                !"美容助理".equals(staffDAO.getById(asstID2).getPosi())){
                job.setSuccessful(false);
                job.setMessage("新增失敗，員工種類錯誤。");
                return jobSchedules;
            }
            // 2. 同個時段與日期 是否已有別組?
            if (schByDatePeriod.size() == 2){
                job.setSuccessful(false);
                job.setMessage("新增失敗，美容組數量已達上限。");
                return jobSchedules;
            }

            // 3. 判斷是否有出現同個日期時段出現同一位員工
            if (empsByDatePeriod.contains(groomerID) || empsByDatePeriod.contains(asstID1) || empsByDatePeriod.contains(asstID2)){
                job.setSuccessful(false);
                job.setMessage("新增失敗，同時段與日期出現重複的員工。");
                return jobSchedules;
            }
            job.setSuccessful(true);
            job.setMessage("暫時新增。");
        }

        jobScheduleDAO.addBatch(jobSchedules);
        return jobSchedules;
    }

    @Override
    public Boolean deleteJob(Integer id) {
        // 必須沒有預約單才可以刪除
        Appointment appointBySchId = appointmentDAO.findAppointBySchId(id);
        System.out.println(appointBySchId);
        if (appointBySchId == null){
            jobScheduleDAO.delete(id);
            return true;
        }
        return false;
    }

    @Override
    public JobSchedule editJob(JobSchedule newJobSchedule) {
        // 只可以更動 美容師 助理 以及 備註
        Integer schID = newJobSchedule.getSchID();
        Integer groomerID = newJobSchedule.getGroomerID();
        Integer asstID1 = newJobSchedule.getAsstID1();
        Integer asstID2 = newJobSchedule.getAsstID2();
        Date newSchDate = newJobSchedule.getSchDate();
        String newSchPeriod = newJobSchedule.getSchPeriod();
        Set<Integer> empsByDatePeriodExcludedSchID = jobScheduleDAO.getEmpsByDatePeriod(newSchDate, newSchPeriod, schID);


        if (!"美容師".equals(staffDAO.getById(groomerID).getPosi()) ||
            !"美容助理".equals(staffDAO.getById(asstID1).getPosi()) ||
            !"美容助理".equals(staffDAO.getById(asstID2).getPosi())){
            newJobSchedule.setMessage("修改失敗，員工種類錯誤。");
            newJobSchedule.setSuccessful(false);
            return newJobSchedule;
        }


        // 2. 判斷是否有出現
        // 同個日期時段 且為其他班表 出現同一位員工
        if (empsByDatePeriodExcludedSchID.contains(groomerID) || empsByDatePeriodExcludedSchID.contains(asstID1) || empsByDatePeriodExcludedSchID.contains(asstID2)){
            newJobSchedule.setMessage("修改失敗，同時段與日期出現重複的員工。");
            newJobSchedule.setSuccessful(false);
            return newJobSchedule;
        }

        // 更改備註
        jobScheduleDAO.update(newJobSchedule);
        newJobSchedule.setMessage("修改成功");
        newJobSchedule.setSuccessful(true);
        return newJobSchedule;
    }

    @Override
    public List<JobSchedule> findAllJobs() {
        // 完整顯示 schID schDate schPeriod groomerName asstID1Name asstID2Name employeeNote apmID
        List<JobSchedule> all = jobScheduleDAO.getAll();
        return integrateJobSchedules(all);
    }

    @Override
    public JobSchedule findJobByID(Integer id) {
        List<JobSchedule> jobs = new ArrayList<>();
        jobs.add(jobScheduleDAO.getById(id));
        return integrateJobSchedules(jobs).get(0);
    }

    @Override
    public Set <Object> findIllegalDatesToAddJobs(Integer groomerId, Integer asstId1, Integer asstId2, String period) {
        return jobScheduleDAO.findIllegalDatesToAddJobs(groomerId, asstId1, asstId2, period);
    }

    @Override
    public List<JobSchedule> findAvailableJobsToAddAppoint() {
        List<JobSchedule> all = new ArrayList<>();
        Date today = new Date(System.currentTimeMillis());
        for (JobSchedule job : integrateJobSchedules(jobScheduleDAO.getAll())){
            if (job.getApmId() == null && (job.getSchDate().after(today) || job.getSchDate().equals(today))){
                all.add(job);
            }
        }
        return all;
    }

    @Override
    public List<Staff> findSalonStaff(String position) {
        return staffDAO.getStaffByPosi(position);
    }

    private List<JobSchedule> integrateJobSchedules(List<JobSchedule> all) {
        for(JobSchedule job : all){
            Appointment appoint = appointmentDAO.findAppointBySchId(job.getSchID());
            if (appoint != null && appoint.getApmStatus() != 2){
                // 只有狀態不是已取消的才可以附在job上
                job.setApmId(appoint.getApmID());
            }

            job.setGroomerName(staffDAO.getById(job.getGroomerID()).getName());
            job.setAsstID1Name(staffDAO.getById(job.getAsstID1()).getName());
            job.setAsstID2Name(staffDAO.getById(job.getAsstID2()).getName());
        }
        return all;
    }
}
