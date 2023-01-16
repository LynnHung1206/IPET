package com.web.admin.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.web.admin.model.entities.AdminFunc;
import com.web.admin.model.service.AdminFuncService;
import com.web.admin.model.service.AdminService;

@WebServlet({ "/ipet-back/admin/admin","/ipet-back/admin/addNewAdmin", "/ipet-back/admin/adminEdit" })
public class AdminFuncServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		if ("/ipet-back/admin/admin".equals(path)) {
			turnToGson(req,res);
//			AdminFuncService adminSvc = new AdminFuncService();
//			Gson gson = new Gson();
//			List<AdminFunc> allAdmin = adminSvc.getAll();
//			req.setAttribute("allAdmin", gson.toJson(allAdmin));
//			
//			req.getRequestDispatcher("/templates/backstage/admin/adminFunc.jsp").forward(req, res);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		if("/ipet-back/admin/addNewAdmin".equals(path)) {
			
			String name = req.getParameter("admin");
			AdminFunc adminFunc = new AdminFunc();
			adminFunc.setName(name);
			AdminFuncService adminSvc = new AdminFuncService();
			adminSvc.addAdminFunc(adminFunc);
			turnToGson(req,res);
//			req.getRequestDispatcher("/templates/backstage/back-index.jsp").forward(req, res);
			
		}
		
		if ("/ipet-back/admin/adminEdit".equals(path)) {
			Integer id = Integer.valueOf(req.getParameter("id").trim());
			String name = req.getParameter("name");
			AdminFunc adminFunc = new AdminFunc();
			adminFunc.setId(id);
			adminFunc.setName(name);
			AdminFuncService adminFuncSvc = new AdminFuncService();
			adminFuncSvc.editAdminFunc(adminFunc);
			
			turnToGson(req,res);
		}
	}
	
	public void turnToGson(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		AdminFuncService adminSvc = new AdminFuncService();
		Gson gson = new Gson();
		List<AdminFunc> allAdmin = adminSvc.getAll();
		req.setAttribute("allAdmin", gson.toJson(allAdmin));
		req.getRequestDispatcher("/templates/backstage/admin/adminFunc.jsp").forward(req, res);
	}
}
