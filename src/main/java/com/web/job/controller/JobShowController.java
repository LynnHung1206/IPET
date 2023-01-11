package com.web.job.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.job.model.entities.JobSchedule;
import com.web.job.model.services.JobSchduleServices;
import com.web.job.model.services.imp.JobSchduleServicesImp;

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
        String path = req.getServletPath();
        req.setCharacterEncoding("UTF-8");

        if ("/ipet-back/job/jobs_calendar".equals(path)) {
            JobSchduleServices jobSchduleServices = new JobSchduleServicesImp();
            GsonBuilder builder = new GsonBuilder();
            Gson gson = builder.serializeNulls()
                    .setDateFormat("yyyy-MM-dd")
                    .create();

            //TODO: 模擬取得所有員工姓名 與 ID
            List<Integer> groomerIds = new ArrayList<>();
            List<String> groomerColors = new ArrayList<>();
            groomerIds.add(1);
            groomerIds.add(2);
            req.setAttribute("groomerIds", groomerIds);

            List<String> groomNames = new ArrayList<>();
            groomNames.add("美容師1");
            groomNames.add("美容師2");
            req.setAttribute("groomNames", groomNames);

            List<Integer> asstIds = new ArrayList<>();
            List<String> asstColors = new ArrayList<>();
            asstIds.add(3);
            asstIds.add(4);
            asstIds.add(5);
            asstIds.add(6);
            asstIds.add(7);
            req.setAttribute("asstIds", asstIds);


            List<String> asstNames = new ArrayList<>();
            asstNames.add("助理3");
            asstNames.add("助理4");
            asstNames.add("助理5");
            asstNames.add("助理6");
            asstNames.add("助理7");
            req.setAttribute("asstNames", asstNames);

            //獲取所有 job
            List<JobSchedule> allJobs = jobSchduleServices.findAllJobs();
            req.setAttribute("allJobs", gson.toJson(allJobs));


            resp.setCharacterEncoding("UTF-8");

            req.getRequestDispatcher("/templates/backstage/salon/salonJobCalendar.jsp").forward(req, resp);






        } else if ("/ipet-back/job/jobs_list".equals(path)){
            JobSchduleServices jobSchduleServices = new JobSchduleServicesImp();
            List<JobSchedule> allJobs = jobSchduleServices.findAllJobs();
            req.setAttribute("allJob", allJobs);
            req.getRequestDispatcher("/templates/backstage/salon/salonJobList.jsp").forward(req, resp);
            resp.setCharacterEncoding("UTF-8");

        }
    }
}
