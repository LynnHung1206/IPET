package com.web.job.model.dao;

import com.core.model.dao.CoreDAO;
import com.web.job.model.entities.JobSchedule;

import java.sql.Date;
import java.util.List;
import java.util.Set;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 01:51
 */
public interface JobScheduleDAO extends CoreDAO<JobSchedule, Integer> {
    Integer[] addBatch(JobSchedule[] ts);
    Integer update(JobSchedule t);
    Integer delete(Integer id);
    List<JobSchedule> getSchByDatePeriod(Date date, String period);
    Set<Integer> getEmpsByDatePeriod(Date date, String period);
    Set<Integer> getEmpsByDatePeriod(Date date, String period, Integer excludedschID);
    Set<Object> findIllegalDatesToAddJobs(Integer groomerId, Integer asstId1, Integer asstId2, String period);

}
