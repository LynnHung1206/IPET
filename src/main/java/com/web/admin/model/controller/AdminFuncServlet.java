package com.web.admin.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/ipet-back/admin/admin","/ipet-back/admin/addNewAdmin", "/ipet-back/admin/adminEdit" })
public class AdminFuncServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if ("/ipet-back/admin/admin".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/admin/adminFunc.jsp").forward(req, res);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		String path = req.getServletPath();
		if("/ipet-back/admin/addNewAdmin".equals(path)) {
			
		}
		
		if ("/ipet-back/admin/adminEdit".equals(path)) {
		}
	}
}
