package com.web.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.order.model.entities.OrderDetail;
import com.web.order.model.services.imp.OrderServiceImp;

@WebServlet({"/ipet-back/prod/detail", "/templates/frontstage/shop/orderDetail"})
public class viewDetailServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		if(req.getParameter("orderID") != null) {
			
			Integer orderID = Integer.valueOf(req.getParameter("orderID"));
			OrderServiceImp orderServiceImp = new OrderServiceImp();
			List<OrderDetail> detailList = orderServiceImp.findOrderDetails(orderID);
			boolean openDetailModal = true;
			
			req.setAttribute("detailList", detailList);
			req.setAttribute("openDetailModal", openDetailModal);
			
			String url;
			System.out.println(req.getServletPath().indexOf("shop"));
			if(req.getServletPath().indexOf("shop") != -1) {
				url = "/templates/frontstage/shop/viewOrder.jsp";
			} else {
				url = "/templates/backstage/prod/orderMange.jsp";
			}
			
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, resp);
			
		}
	}
}
