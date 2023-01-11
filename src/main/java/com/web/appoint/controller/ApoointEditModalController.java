package com.web.appoint.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.appoint.model.entities.Appointment;
import com.web.appoint.model.services.imp.AppointServicesImp;
import com.web.job.model.services.imp.JobScheduleServicesImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Yu-Jing
 * @create 2023/1/10 下午 12:07
 */

@WebServlet("/ipet-back/appoint/editModalInput")
public class ApoointEditModalController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        AppointServicesImp appointServicesImp = new AppointServicesImp();
        JobScheduleServicesImp jobScheduleServicesImp = new JobScheduleServicesImp();
        Integer apmID = Integer.parseInt(req.getParameter("apmID"));
        Appointment appointById = appointServicesImp.findAppointById(apmID);
        Map<String, Object> map = new HashMap<>();
        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.serializeNulls()
                .setDateFormat("yyyy-MM-dd")
                .create();

        // 根據傳入的 apmID 從資料庫拉出此預約單
        map.put("appoint", appointById);
        map.put("availableJob", jobScheduleServicesImp.findAvailableJobsToAddAppoint());
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().print(gson.toJson(map));
    }
}
