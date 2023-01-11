package com.web.job.model.services.imp;

import com.web.appoint.model.dao.imp.AppointmentImp;
import com.web.appoint.model.entities.Appointment;
import com.web.job.model.dao.JobScheduleImp;
import com.web.job.model.entities.JobSchedule;
import com.web.job.model.services.JobSchduleServices;

import java.sql.Date;
import java.util.*;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 08:13
 */
public class JobSchduleServicesImp implements JobSchduleServices {
    private final JobScheduleImp jobScheduleImp = new JobScheduleImp();
    private final AppointmentImp appointmentImp = new AppointmentImp();

    // TODO: private StaffImp staffImp

    @Override
    public JobSchedule[] addJobs(JobSchedule[] jobSchedules) {
        for (JobSchedule job : jobSchedules) {
            Date schDate = job.getSchDate();
            String schPeriod = job.getSchPeriod();
            Integer groomerID = job.getGroomerID();
            Integer asstID1 = job.getAsstID1();
            Integer asstID2 = job.getAsstID2();

            List<JobSchedule> schByDatePeriod = jobScheduleImp.getSchByDatePeriod(schDate, schPeriod);
            Set<Integer> empsByDatePeriod = jobScheduleImp.getEmpsByDatePeriod(schDate, schPeriod);

            // 1. 判斷員工是否選擇正確
            //TODO: 需串接 staff, StaffDAO.getPOSI(id) == "美容師" ...
            if (false){
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

        jobScheduleImp.addBatch(jobSchedules);
        return jobSchedules;
    }

    @Override
    public Boolean deleteJob(Integer id) {
        // 必須沒有預約單才可以刪除
        Appointment appointBySchId = appointmentImp.findAppointBySchId(id);
        System.out.println(appointBySchId);
        if (appointBySchId == null){
            jobScheduleImp.delete(id);
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
        Set<Integer> empsByDatePeriodExcludedSchID = jobScheduleImp.getEmpsByDatePeriod(newSchDate, newSchPeriod, schID);


        // 1. TODO:判斷員工是否選擇正確
        if (false){
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
        jobScheduleImp.update(newJobSchedule);
        newJobSchedule.setMessage("修改成功");
        newJobSchedule.setSuccessful(true);
        return newJobSchedule;
    }

    @Override
    public List<JobSchedule> findAllJobs() {
        // 完整顯示 schID schDate schPeriod groomerName asstID1Name asstID2Name employeeNote apmID
        // 必須與員工資料串接 (先暫不接)
        List<JobSchedule> all = jobScheduleImp.getAll();
        return integrateJobSchedules(all);
    }

    @Override
    public JobSchedule findJobByID(Integer id) {
        return jobScheduleImp.getById(id);
    }

    @Override
    public Set <Object> findIllegalDatesToAddJobs(Integer groomerId, Integer asstId1, Integer asstId2, String period) {
        return jobScheduleImp.findIllegalDatesToAddJobs(groomerId, asstId1, asstId2, period);
    }


    private List<JobSchedule> integrateJobSchedules(List<JobSchedule> all) {
        for(JobSchedule job : all){
            Appointment appoint = appointmentImp.findAppointBySchId(job.getSchID());
            if (appoint != null){
                job.setAmpId(appoint.getApmID());
            }
            // TODO: 模擬從 staff 串接員工姓名, StaffDAO.getName(id)
            job.setGroomerName(job.getGroomerID() + "-美容師名字");
            job.setAsstID1Name(job.getAsstID1() + "-助理1號名字");
            job.setAsstID2Name(job.getAsstID2() + "-助理2號名字");
        }
        return all;
    }
}
