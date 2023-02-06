package com.web.appoint.controller;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.appoint.model.entities.Appointment;
import com.web.appoint.model.services.AppointServices;
import com.web.appoint.model.services.imp.AppointServicesImp;
import com.web.member.model.entity.Member;

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

@WebServlet({"/ipet-back/appoint/appoints", "/ipet-back/appoint/appoints_cancelled", "/ipet-back/appoint/appoints_payed", "/ipet-back/appoint/appoints_finished", "/ipet-back/appoint/appoints_outdated", "/ipet-front/member/salonAppointment"})
public class AppointShowController extends HttpServlet {

    // forward: 預約瀏覽, 已取消預約, 已付費預約, 已完成預約, 逾時預約
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        AppointServices appointDetailServices = new AppointServicesImp();
        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.serializeNulls()
                .setDateFormat("yyyy-MM-dd")
                .create();
        if ("/ipet-back/appoint/appoints".equals(path)){
            List<Appointment> allServices = appointDetailServices.findAllAppoint();

            req.setAttribute("appoints", gson.toJson(allServices));
            req.getRequestDispatcher("/templates/backstage/salon/salonAppointAll.jsp").forward(req, resp);

        }else if ("/ipet-back/appoint/appoints_cancelled".equals(path)){
            List<Appointment> allServices = appointDetailServices.findAppointBasedOnStatus(2);

            req.setAttribute("appoints", gson.toJson(allServices));
            req.getRequestDispatcher("/templates/backstage/salon/salonAppointCancelled.jsp").forward(req, resp);

        }else if ("/ipet-back/appoint/appoints_payed".equals(path)){
            List<Appointment> allServices = appointDetailServices.findAppointBasedOnStatus(0);
            req.setAttribute("appoints", gson.toJson(allServices));
            req.getRequestDispatcher("/templates/backstage/salon/salonAppointPayed.jsp").forward(req, resp);

        }else if ("/ipet-back/appoint/appoints_finished".equals(path)){
            List<Appointment> allServices = appointDetailServices.findAppointBasedOnStatus(1);
            req.setAttribute("appoints", gson.toJson(allServices));
            req.getRequestDispatcher("/templates/backstage/salon/salonAppointFinished.jsp").forward(req, resp);

        }else if ("/ipet-back/appoint/appoints_outdated".equals(path)){
            List<Appointment> allServices = appointDetailServices.findAppointBasedOnStatus(3);
            req.setAttribute("appoints", gson.toJson(allServices));
            req.getRequestDispatcher("/templates/backstage/salon/salonAppointOutdated.jsp").forward(req, resp);
            
        }else if ("/ipet-front/member/salonAppointment".equals(path)) {
        	Member member = (Member) req.getSession().getAttribute("member");
			List<Appointment> services = appointDetailServices.findAppointByMemId(member.getMemId());
			req.setAttribute("appoints", gson.toJson(services));
			req.getRequestDispatcher("/templates/frontstage/member/salonAppointment.jsp").forward(req, resp);
		}
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
