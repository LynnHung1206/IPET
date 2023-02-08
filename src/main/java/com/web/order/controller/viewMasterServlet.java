package com.web.order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/ipet-back/prod/orderMange", "/ipet-front/shop/myOrder"})
public class viewMasterServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String url = "";
		
		if(req.getServletPath().indexOf("myOrder") != -1) {
			url = "/templates/frontstage/shop/viewOrder.jsp";
		} else if(req.getServletPath().indexOf("orderMange") != -1) {
			url = "/templates/backstage/prod/orderMange.jsp";
		}
		
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, resp);
	}
}
