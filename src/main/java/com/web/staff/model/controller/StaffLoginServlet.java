package com.web.staff.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.web.staff.model.entity.Staff;
import com.web.staff.model.service.StaffService;

@WebServlet("/ipet-back/staff/login")
public class StaffLoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	Gson gson = new Gson();
	Staff staff = gson.fromJson(req.getReader(),Staff.class);
	staff.getAc();
	staff.getPw();
	StaffService staffService = new StaffService();
	final boolean result = staffService.login(staff);
	JsonObject jsonObject = new JsonObject();
	jsonObject.addProperty("result", result);
	resp.getWriter().write(jsonObject.toString());
	System.out.println("經過這裡");
	}

	
	
}
