package com.web.job.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.job.model.entities.JobSchedule;
import com.web.job.model.services.JobScheduleServices;
import com.web.job.model.services.imp.JobScheduleServicesImp;
import com.web.staff.model.service.StaffService;

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
        StaffService staffService = new StaffService();
        Map<String, Object> map = new HashMap<>();
        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.serializeNulls()
                .setDateFormat("yyyy-MM-dd")
                .create();
        JobSchedule jobByID = jobScheduleServices.findJobByID(schID);

        // 根據傳入的 schID 從資料庫拉出此班表訊息
        map.put("job", jobByID);

        // TODO: 模擬取得所有員工姓名 與 ID
        List<Integer> groomerIds = new ArrayList<>();
        groomerIds.add(1);
        groomerIds.add(2);
        map.put("groomerIds", groomerIds);

        List<String> groomNames = new ArrayList<>();
        groomNames.add("美容師1");
        groomNames.add("美容師2");
        map.put("groomNames", groomNames);

        List<Integer> asstIds = new ArrayList<>();
        asstIds.add(3);
        asstIds.add(4);
        asstIds.add(5);
        asstIds.add(6);
        asstIds.add(7);
        map.put("asstIds", asstIds);

        List<String> asstNames = new ArrayList<>();
        asstNames.add("助理3");
        asstNames.add("助理4");
        asstNames.add("助理5");
        asstNames.add("助理6");
        asstNames.add("助理7");
        map.put("asstNames", asstNames);

        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().print(gson.toJson(map));
    }
}
