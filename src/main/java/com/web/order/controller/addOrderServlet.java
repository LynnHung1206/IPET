package com.web.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.list.model.entities.CartList;
import com.web.list.model.entities.CartList.CartListPK;
import com.web.list.model.services.CartService;
import com.web.order.model.entities.OrderDetail;
import com.web.order.model.entities.OrderMaster;
import com.web.order.model.services.imp.OrderServiceImp;

@WebServlet("/templates/frontstage/shop/addOrder")
public class addOrderServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		CartListPK cartListPK = new CartListPK();
		cartListPK.setMemID(1);	// 改session.getAttribute
		
		CartList cartList = new CartList();
		cartList.setCartListPK(cartListPK);
		
		CartService cartService = new CartService();
		List<CartList> cartLists = cartService.getAll(cartList);
		
		// calculate OrderMaster orderSum
		Integer orderSum = 0;
		for(CartList cl : cartLists) {
			orderSum += cl.getTotal();
		}
		
		// create orderMaster
		OrderMaster orderMaster = new OrderMaster();
		orderMaster.setMemID(1);	// 改session.getAttribute
		orderMaster.setOrderSum(orderSum);
		
		System.out.println(req.getParameter("orderRecName"));
		
		orderMaster.setOrderRecName(req.getParameter("orderRecName"));
		orderMaster.setOrderRecPhone(req.getParameter("orderRecPhone"));
		orderMaster.setOrderRecAddress(req.getParameter("orderRecAddress"));
		
		// create orderDetails
		List<OrderDetail> orderDetails = new ArrayList();
		
		for(CartList cartlist : cartLists) {
			
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setProdID(cartlist.getCartListPK().getProdID());
			orderDetail.setDetailQuantity(cartlist.getCount());
			orderDetail.setDetailPrice(cartlist.getProduct().getProdPrice());
			
			orderDetails.add(orderDetail);
		}		
		
		OrderServiceImp orderServiceImp = new OrderServiceImp();
		orderServiceImp.addOrder(orderMaster, orderDetails);
		
		resp.sendRedirect(req.getContextPath() + "/templates/frontstage/shop/orderSuccess.jsp");
	}
}
