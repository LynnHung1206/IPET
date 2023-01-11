package com.web.job.controller;

import com.web.job.model.entities.JobSchedule;
import com.web.job.model.services.JobScheduleServices;
import com.web.job.model.services.imp.JobScheduleServicesImp;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

/**
 * @author Yu-Jing
 * @create 2023/1/5 下午 08:08
 */
@WebServlet({"/ipet-back/job/job_delete","/ipet-back/job/job_add","/ipet-back/job/job_edit"})
public class JobOperationController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();
        JobScheduleServices jobScheduleServices = new JobScheduleServicesImp();
        if ("/ipet-back/job/job_delete".equals(path)) {
            Integer schID = Integer.parseInt(req.getParameter("schID")) ;
            Boolean deleteJob = jobScheduleServices.deleteJob(schID);
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().print(deleteJob);

        } else if ("/ipet-back/job/job_add".equals(path)){
            req.setCharacterEncoding("UTF-8");
            Integer groomerID =  Integer.parseInt(req.getParameter("groomerID"));
            Integer asstID1 = Integer.parseInt(req.getParameter("asstID1"));
            Integer asstID2 = Integer.parseInt(req.getParameter("asstID2"));
            String[] periods = req.getParameterValues("period[]");
            String[] dates = req.getParameterValues("dates[]");
            String notes = req.getParameter("notes");
            JobSchedule[] jobs = new JobSchedule[dates.length * periods.length];
            int index = 0;
            StringBuilder message = new StringBuilder();
            for (String date : dates) {
                for (String period : periods) {
                    jobs[index] = new JobSchedule();
                    jobs[index].setSchDate(Date.valueOf(date));
                    jobs[index].setGroomerID(groomerID);
                    jobs[index].setAsstID1(asstID1);
                    jobs[index].setAsstID2(asstID2);
                    jobs[index].setSchPeriod(period);
                    jobs[index].setEmployeeNote(notes);
                    index++;
                }
            }

            jobScheduleServices.addJobs(jobs);
            for (JobSchedule job : jobs) {
                if (!job.isSuccessful()){
                    message.append("無法新增此班表: ")
                            .append(job.getSchDate())
                            .append(" (")
                            .append(job.getSchPeriod())
                            .append(")")
                            .append("; <br> 錯誤: ")
                            .append(job.getMessage());
                    break;
                }
            }
            if (message.isEmpty()) {
                message.append("新增成功");
            }

            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().print(message);

        } else if ("/ipet-back/job/job_edit".equals(path)){
            req.setCharacterEncoding("UTF-8");
            Integer schID = Integer.parseInt(req.getParameter("schID"));
            Date schDate = Date.valueOf(req.getParameter("schDate"));
            String schPeriod = req.getParameter("schPeriod");
            Integer groomerID =  Integer.parseInt(req.getParameter("groomerID"));
            Integer asstID1 =  Integer.parseInt(req.getParameter("asstID1"));
            System.out.println(req.getParameter("asstID2"));
            Integer asstID2 =  Integer.parseInt(req.getParameter("asstID2"));
            String employeeNote = req.getParameter("employeeNote");
            JobSchedule job = new JobSchedule();

            job.setSchID(schID);
            job.setSchDate(schDate);
            job.setSchPeriod(schPeriod);
            job.setGroomerID(groomerID);
            job.setAsstID1(asstID1);
            job.setAsstID2(asstID2);
            job.setEmployeeNote(employeeNote);

            JobSchedule editJob = jobScheduleServices.editJob(job);

            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().print(editJob.getMessage());

        }
    }
}
