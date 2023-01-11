package com.web.job.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.job.model.services.JobSchduleServices;
import com.web.job.model.services.imp.JobSchduleServicesImp;

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
        Map<String, Object> map = new HashMap<>();

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
            JobSchduleServices jobSchduleServices = new JobSchduleServicesImp();
            Set<Object> illegalDates = new HashSet<>();
            for (String str : periods){
                illegalDates.addAll(jobSchduleServices.findIllegalDatesToAddJobs(groomerID, asstID1, asstID2, str));
            }
            map.put("illegalDate", illegalDates);
        }else{
            map.put("illegalDate", null);
        }


        //TODO: 模擬取得所有員工姓名 與 ID
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
        GsonBuilder builder =  new GsonBuilder();
        builder.serializeNulls()
                .setDateFormat("yyyy-MM-dd");
        Gson gson = builder.create();
        resp.getWriter().print(gson.toJson(map));

    }
}
