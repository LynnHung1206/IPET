package com.web.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.order.model.entities.OrderMaster;
import com.web.order.model.services.imp.OrderServiceImp;

@WebServlet("/templates/frontstage/shop/cancel")
public class CancelOrderServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		OrderServiceImp orderServiceImp = new OrderServiceImp();
		OrderMaster orderMaster = orderServiceImp.findOrderMaster(Integer.valueOf(req.getParameter("orderID")));
		orderMaster.setOrderStatus(3);
		orderServiceImp.updateOrderMaster(orderMaster);
		
		resp.sendRedirect(req.getContextPath() + "/templates/frontstage/shop/viewOrder.jsp");
	}
}
