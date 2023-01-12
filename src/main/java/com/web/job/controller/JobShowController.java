package com.web.job.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.job.model.entities.JobSchedule;
import com.web.job.model.services.JobScheduleServices;
import com.web.job.model.services.imp.JobScheduleServicesImp;
import com.web.staff.model.entity.Staff;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Yu-Jing
 * @create 2023/1/4 上午 10:34
 */

@WebServlet({"/ipet-back/job/jobs_calendar","/ipet-back/job/jobs_list"})
public class JobShowController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();
        JobScheduleServices jobScheduleServices = new JobScheduleServicesImp();

        if ("/ipet-back/job/jobs_calendar".equals(path)) {
            GsonBuilder builder = new GsonBuilder();
            Gson gson = builder.serializeNulls()
                    .setDateFormat("yyyy-MM-dd")
                    .create();


            List<Integer> groomerIds = new ArrayList<>();
            List<String> groomNames = new ArrayList<>();
            for (Staff staff : jobScheduleServices.findSalonStaff("美容師")){
                groomerIds.add(staff.getId());
                groomNames.add(staff.getName());
            }
            req.setAttribute("groomerIds", groomerIds);
            req.setAttribute("groomNames", groomNames);

            List<Integer> asstIds = new ArrayList<>();
            List<String> asstNames = new ArrayList<>();
            for (Staff staff : jobScheduleServices.findSalonStaff("美容助理")){
                asstIds.add(staff.getId());
                asstNames.add(staff.getName());
            }
            req.setAttribute("asstIds", asstIds);
            req.setAttribute("asstNames", asstNames);


            //獲取所有 job
            List<JobSchedule> allJobs = jobScheduleServices.findAllJobs();
            req.setAttribute("allJobs", gson.toJson(allJobs));
            resp.setCharacterEncoding("UTF-8");
            req.getRequestDispatcher("/templates/backstage/salon/salonJobCalendar.jsp").forward(req, resp);

        } else if ("/ipet-back/job/jobs_list".equals(path)){
            List<JobSchedule> allJobs = jobScheduleServices.findAllJobs();
            req.setAttribute("allJob", allJobs);
            req.getRequestDispatcher("/templates/backstage/salon/salonJobList.jsp").forward(req, resp);
            resp.setCharacterEncoding("UTF-8");

        }
    }
}
