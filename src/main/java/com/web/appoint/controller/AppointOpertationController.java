package com.web.appoint.controller;

import com.web.appoint.model.entities.Appointment;
import com.web.appoint.model.services.AppointServices;
import com.web.appoint.model.services.imp.AppointServicesImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Yu-Jing
 * @create 2023/1/11 下午 06:32
 */
@WebServlet("/ipet-back/appoint/appoint_edit")
public class AppointOpertationController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        AppointServices appointServices = new AppointServicesImp();
        Integer apmID = Integer.parseInt(req.getParameter("apmID"));
        Integer memID = Integer.parseInt(req.getParameter("memID"));
        Integer petID = Integer.parseInt(req.getParameter("petID"));
        Integer totalPrice = Integer.parseInt(req.getParameter("totalPrice"));
        Integer schID = Integer.parseInt(req.getParameter("schID"));
        Integer apmStatus =  Integer.parseInt(req.getParameter("apmStatus"));
        String customerNote = req.getParameter("customerNote");



        Appointment appointment = new Appointment();
        appointment.setApmID(apmID);
        appointment.setApmStatus(apmStatus);
        appointment.setMemID(memID);
        appointment.setPetID(petID);
        appointment.setSchID(schID);
        appointment.setCustomerNote(customerNote);
        appointment.setTotalPrice(totalPrice);
        Appointment appoint = appointServices.editAppoint(appointment);

        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().print(appoint.getMessage());
    }
}
