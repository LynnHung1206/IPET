package com.web.job.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.job.model.entities.JobSchedule;
import com.web.job.model.services.JobScheduleServices;
import com.web.job.model.services.imp.JobScheduleServicesImp;
import com.web.staff.model.entity.Staff;
import com.web.staff.model.service.impl.StaffServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Yu-Jing
 * @create 2023/1/8 上午 10:15
 */

@WebServlet("/ipet-back/job/editModalInput")
public class JobEditModalController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        req.setCharacterEncoding("UTF-8");
        Integer schID = Integer.parseInt(req.getParameter("schID"));
        JobScheduleServices jobScheduleServices = new JobScheduleServicesImp();
        Map<String, Object> map = new HashMap<>();
        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.serializeNulls()
                .setDateFormat("yyyy-MM-dd")
                .create();
        JobSchedule jobByID = jobScheduleServices.findJobByID(schID);

        // 根據傳入的 schID 從資料庫拉出此班表訊息
        map.put("job", jobByID);


        List<Integer> groomerIds = new ArrayList<>();
        List<String> groomNames = new ArrayList<>();
        for (Staff staff : jobScheduleServices.findSalonStaff("美容師")){
            groomerIds.add(staff.getId());
            groomNames.add(staff.getName());
        }
        map.put("groomerIds", groomerIds);
        map.put("groomNames", groomNames);


        List<Integer> asstIds = new ArrayList<>();
        List<String> asstNames = new ArrayList<>();
        for (Staff staff : jobScheduleServices.findSalonStaff("美容助理")){
            asstIds.add(staff.getId());
            asstNames.add(staff.getName());
        }
        map.put("asstIds", asstIds);
        map.put("asstNames", asstNames);

        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().print(gson.toJson(map));
    }
}
