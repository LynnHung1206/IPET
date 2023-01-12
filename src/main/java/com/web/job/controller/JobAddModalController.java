package com.web.job.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.job.model.services.JobScheduleServices;
import com.web.job.model.services.imp.JobScheduleServicesImp;
import com.web.staff.model.entity.Staff;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * @author Yu-Jing
 * @create 2023/1/7 下午 10:45
 */
@WebServlet({"/ipet-back/job/addModalInput"})
public class JobAddModalController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        Integer groomerID = null;
        Integer asstID1 = null;
        Integer asstID2 = null;
        String[] periods = null;
        JobScheduleServices jobScheduleServices = new JobScheduleServicesImp();
        Map<String, Object> map = new HashMap<>();
        GsonBuilder builder =  new GsonBuilder();
        Gson gson = builder.serializeNulls()
                .setDateFormat("yyyy-MM-dd")
                .create();

        if (req.getParameter("groomerID") != null && !req.getParameter("groomerID").trim().equals("")){
            groomerID =  Integer.parseInt(req.getParameter("groomerID"));
        }
        if (req.getParameter("asstID1") != null && !req.getParameter("asstID1").trim().equals("")){
            asstID1 = Integer.parseInt(req.getParameter("asstID1"));
        }
        if (req.getParameter("asstID2") != null && !req.getParameter("asstID2").trim().equals("")){
            asstID2 = Integer.parseInt(req.getParameter("asstID2"));
        }
        if (req.getParameterValues("period[]") != null && req.getParameterValues("period[]").length != 0 ) {
            periods = req.getParameterValues("period[]");
        }

        // 挑出不可選擇的日期
        if (groomerID != null && asstID1 != null && asstID2 != null && periods != null){
            Set<Object> illegalDates = new HashSet<>();
            for (String str : periods){
                illegalDates.addAll(jobScheduleServices.findIllegalDatesToAddJobs(groomerID, asstID1, asstID2, str));
            }
            map.put("illegalDate", illegalDates);
        }else{
            map.put("illegalDate", null);
        }



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
