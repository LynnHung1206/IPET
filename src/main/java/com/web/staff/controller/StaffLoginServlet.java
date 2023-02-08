package com.web.staff.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.web.admin.model.entities.Admin;
import com.web.admin.model.service.AdminService;
import com.web.admin.model.service.impl.AdminServiceImpl;
import com.web.staff.model.entity.Staff;
import com.web.staff.model.service.StaffService;
import com.web.staff.model.service.impl.StaffServiceImpl;

@WebServlet("/ipet-back/login")
public class StaffLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		Gson gson = new Gson();
		Staff staff = gson.fromJson(req.getReader(), Staff.class);
		if (staff == null) {
			staff = new Staff();
			staff.setMessage("查無此員工");
			staff.setSuccessful(false);
			turnToJson(resp, staff);
			return;
		}
		StaffService staffSvc = new StaffServiceImpl();
		staff = staffSvc.login(staff);
		Admin admin = new Admin();
		AdminService adminSvc = new AdminServiceImpl();
		admin = adminSvc.getOneAdminByInt(staff.getId());
		if (staff.isSuccessful()) {
			if (req.getSession(false) != null) {
				req.changeSessionId();
			}
			final HttpSession session = req.getSession();
			session.setAttribute("staff", staff);
			session.setAttribute("name", staff.getName());
			session.setAttribute("id", staff.getId());
			session.setAttribute("adminId", admin.getAdminID());
		}

		turnToJson(resp, staff);
	}

	public static void turnToJson(HttpServletResponse res, Staff staff) {
		res.setContentType("application/json");
		Gson gson = new GsonBuilder().create();

		try (PrintWriter pw = res.getWriter()) {
			pw.print(gson.toJson(staff));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
