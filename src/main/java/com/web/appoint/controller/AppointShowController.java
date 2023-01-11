package com.web.appoint.controller;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.appoint.model.entities.Appointment;
import com.web.appoint.model.services.AppointServices;
import com.web.appoint.model.services.imp.AppointServicesImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 * @author Yu-Jing
 * @create 2023/1/3 上午 09:39
 */

@WebServlet({"/ipet-back/appoint/appoints", "/ipet-back/appoint/appoints_cancelled", "/ipet-back/appoint/appoints_payed", "/ipet-back/appoint/appoints_finished", "/ipet-back/appoint/appoints_outdated"})
public class AppointShowController extends HttpServlet {

    // forward: 預約瀏覽, 已取消預約, 已付費預約, 已完成預約, 逾時預約
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if ("/ipet-back/appoint/appoints".equals(path)){
            AppointServices appointDetailServices = new AppointServicesImp();
            GsonBuilder builder = new GsonBuilder();
            Gson gson = builder.serializeNulls()
                    .setDateFormat("yyyy-MM-dd")
                    .create();

            List<Appointment> allServices = appointDetailServices.findAllAppoint();
            String allServicesJSON = gson.toJson(allServices);
            req.setAttribute("appoints", allServicesJSON);
            req.getRequestDispatcher("/templates/backstage/salon/salonAppointAll.jsp").forward(req, resp);

        }else if ("/ipet-back/appoint/appoints_cancelled".equals(path)){
            AppointServices appointDetailServices = new AppointServicesImp();
            List<Appointment> allServices = appointDetailServices.findAppointBasedOnStatus(2);
            req.setAttribute("appoints_cancelled", allServices);
            req.getRequestDispatcher("/templates/backstage/salon/salonAppointCancelled.jsp").forward(req, resp);

        }else if ("/ipet-back/appoint/appoints_payed".equals(path)){
            AppointServices appointDetailServices = new AppointServicesImp();
            List<Appointment> allServices = appointDetailServices.findAppointBasedOnStatus(0);
            req.setAttribute("appoints_payed", allServices);
            req.getRequestDispatcher("/templates/backstage/salon/salonAppointPayed.jsp").forward(req, resp);

        }else if ("/ipet-back/appoint/appoints_finished".equals(path)){
            AppointServices appointDetailServices = new AppointServicesImp();
            List<Appointment> allServices = appointDetailServices.findAppointBasedOnStatus(1);
            req.setAttribute("appoints_payed", allServices);
            req.getRequestDispatcher("/templates/backstage/salon/salonAppointFinished.jsp").forward(req, resp);

        }else if ("/ipet-back/appoint/appoints_outdated".equals(path)){
            AppointServices appointDetailServices = new AppointServicesImp();
            List<Appointment> allServices = appointDetailServices.findAppointBasedOnStatus(3);
            req.setAttribute("appoints_payed", allServices);
            req.getRequestDispatcher("/templates/backstage/salon/salonAppointOutdated.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
