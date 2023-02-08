package com.web.order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.order.model.entities.OrderMaster;
import com.web.order.model.services.imp.OrderServiceImp;

@WebServlet("/ipet-back/prod/edit")
public class EditOrderServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		if(req.getParameter("orderID") != null) {
			
			Integer orderID = Integer.valueOf(req.getParameter("orderID"));
			OrderServiceImp orderServiceImp = new OrderServiceImp();
			OrderMaster orderMaster = orderServiceImp.findOrderMaster(orderID);
			boolean openEditModal = true;
			
			req.setAttribute("orderMaster", orderMaster);
			req.setAttribute("openEditModal", openEditModal);
			
			RequestDispatcher successView = req.getRequestDispatcher("/templates/backstage/prod/orderMange.jsp");
			successView.forward(req, resp);
		}
		
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		Integer orderID = Integer.valueOf(req.getParameter("orderID"));
		Integer memID = Integer.valueOf(req.getParameter("memID"));
		Integer orderSum = Integer.valueOf(req.getParameter("orderSum"));
		Integer orderStatus = Integer.valueOf(req.getParameter("orderStatus"));
		String orderRecName = req.getParameter("orderRecName");
		String orderRecPhone = req.getParameter("orderRecPhone");
		String orderRecAddress = req.getParameter("orderRecAddress");
		
		OrderMaster orderMaster = new OrderMaster();
		orderMaster.setOrderID(orderID);
		orderMaster.setMemID(memID);
		orderMaster.setOrderSum(orderSum);
		orderMaster.setOrderStatus(orderStatus);
		orderMaster.setOrderRecName(orderRecName);
		orderMaster.setOrderRecPhone(orderRecPhone);
		orderMaster.setOrderRecAddress(orderRecAddress);
		
		OrderServiceImp orderServiceImp = new OrderServiceImp();
		orderServiceImp.updateOrderMaster(orderMaster);
		System.out.println("go to serviceImp");
		resp.sendRedirect(req.getContextPath() + "/ipet-back/prod/orderMange");
	}
}
