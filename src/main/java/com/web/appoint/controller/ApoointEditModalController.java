package com.web.appoint.controller;

import com.web.appoint.model.entities.Appointment;
import com.web.appoint.model.services.imp.AppointServicesImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Yu-Jing
 * @create 2023/1/10 下午 12:07
 */

@WebServlet("")
public class ApoointEditModalController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        AppointServicesImp appointServicesImp = new AppointServicesImp();
        Integer apmID = Integer.parseInt(req.getParameter("apmID"));
        Appointment appointById = appointServicesImp.findAppointById(apmID);

        // 根據傳入的 apmID 載入
        resp.setCharacterEncoding("UTF-8");
    }
}
