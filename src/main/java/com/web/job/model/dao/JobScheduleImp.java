package com.web.job.model.dao;


import com.web.job.model.entities.JobSchedule;
import org.hibernate.Session;

import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author Yu-Jing
 * @create 2022-12-24-上午 10:17
 */
public class JobScheduleImp implements JobScheduleDAO {

    @Override
    public Integer add(JobSchedule jobSchedule) {
        Session session = getSession();
        session.persist(jobSchedule);
        return jobSchedule.getSchID();
    }

    @Override
    public Integer[] addBatch(JobSchedule[] jobSchedules) {
        Session session = getSession();
        Integer[] ids = new Integer[jobSchedules.length];
        int i = 0;
        for (JobSchedule jobSchedule : jobSchedules){
            session.persist(jobSchedule);
            ids[i] = jobSchedule.getSchID();
            i++;
        }
        return ids;
    }

    @Override
    public Integer update(JobSchedule newJobSchedule) {
        Session session = getSession();
        JobSchedule oldJobSchedule = session.get(JobSchedule.class, newJobSchedule.getSchID());
        oldJobSchedule.setSchDate(newJobSchedule.getSchDate());
        oldJobSchedule.setSchPeriod(newJobSchedule.getSchPeriod());
        oldJobSchedule.setGroomerID(newJobSchedule.getGroomerID());
        oldJobSchedule.setAsstID1(newJobSchedule.getAsstID1());
        oldJobSchedule.setAsstID2(newJobSchedule.getAsstID2());
        oldJobSchedule.setEmployeeNote(newJobSchedule.getEmployeeNote());
        return newJobSchedule.getSchID();
    }


    @Override
    public Integer delete(Integer id) {
        Session session = getSession();
        JobSchedule jobSchedule = new JobSchedule();
        jobSchedule.setSchID(id);
        session.remove(jobSchedule);
        return id;
    }

    @Override
    public List<JobSchedule> getSchByDatePeriod(Date date, String period) {
        Session session = getSession();
        String hql = "FROM JobSchedule WHERE schDate = :date AND schPeriod = :period";
        return session.createQuery(hql, JobSchedule.class)
                .setParameter("date", date)
                .setParameter("period", period)
                .list();
    }

    @Override
    public Set<Integer> getEmpsByDatePeriod(Date date, String period) {
        Session session = getSession();
        Set<Integer> emps = new HashSet<>();
        String hql = "FROM JobSchedule WHERE schDate = :date AND schPeriod = :period";
        List<JobSchedule> list = session.createQuery(hql, JobSchedule.class)
                .setParameter("date", date)
                .setParameter("period", period)
                .list();
        for (JobSchedule job : list){
            emps.add(job.getGroomerID());
            emps.add(job.getAsstID1());
            emps.add(job.getAsstID2());
        }
        return emps;
    }

    @Override
    public Set<Integer> getEmpsByDatePeriod(Date date, String period, Integer excludedschID) {
        Session session = getSession();
        Set<Integer> emps = new HashSet<>();
        String hql = "FROM JobSchedule WHERE schDate = :date AND schPeriod = :period AND schID != :id";
        List<JobSchedule> list = session.createQuery(hql, JobSchedule.class)
                .setParameter("date", date)
                .setParameter("period", period)
                .setParameter("id", excludedschID)
                .list();
        for (JobSchedule job : list){
            emps.add(job.getGroomerID());
            emps.add(job.getAsstID1());
            emps.add(job.getAsstID2());
        }
        return emps;
    }

    @Override
    public Set<Object> findIllegalDatesToAddJobs(Integer groomerID, Integer asstID1, Integer asstID2, String period) {
        // 選定 美容師, 助理1, 助理2 與時段後
        // 回傳以今天後的一個月，哪幾個日期
        // 1. 班表數量 = 2
        // 2. 或 有重複的員工

        Session session = getSession();
        Date nowDate = new Date(System.currentTimeMillis());
        String sql = "SELECT SCH_DATE\n" +
                "from salon_schedule\n" +
                "WHERE SCH_DATE >= :date AND SCH_PERIOD = :period AND \n" +
                "      (GROOMER_ID = :groomerID OR ASST_ID_1 = :asstID1 OR ASST_ID_2 = :asstID2 OR ASST_ID_1 = :asstID2 OR ASST_ID_2 = :asstID1)\n" +
                "UNION\n" +
                "SELECT SCH_DATE\n" +
                "FROM salon_schedule\n" +
                "WHERE SCH_DATE >= :date AND SCH_PERIOD = :period \n" +
                "GROUP BY SCH_DATE\n" +
                "HAVING count(1) = 2;";

        List<Object> list = session.createNativeQuery(sql)
                .setParameter("date", nowDate)
                .setParameter("period", period)
                .setParameter("groomerID", groomerID)
                .setParameter("asstID1", asstID1)
                .setParameter("asstID2", asstID2)
                .list();

        return new HashSet<>(list);
    }


    @Override
    public List<JobSchedule> getAll() {
        Session session = getSession();
        String hql = "FROM JobSchedule";
        return session.createQuery(hql, JobSchedule.class).list();
    }

    @Override
    public JobSchedule getById(Integer id) {
        Session session = getSession();
        return session.get(JobSchedule.class, id);
    }
}
