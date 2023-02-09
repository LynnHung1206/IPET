package com.web.order.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.web.member.model.entity.Member;
import com.web.order.model.entities.OrderDetail;
import com.web.order.model.entities.OrderMaster;
import com.web.order.model.services.imp.OrderServiceImp;

@WebServlet("/ipet-front/shop/addOrder")
public class addOrderServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		CartListPK cartListPK = new CartListPK();
		
		Member member = (Member)req.getSession().getAttribute("member");
		cartListPK.setMemID(member.getMemId());
		
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
		orderMaster.setMemID(member.getMemId());
		orderMaster.setOrderSum(orderSum);
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
		Integer orderID = orderServiceImp.addOrder(orderMaster, orderDetails);
		cartService.removeAllProd(member.getMemId());
		
		//send email
		OrderMaster newOrderMaster = orderServiceImp.findOrderMaster(orderID);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		orderServiceImp.sendEmail(member.getMemEmail(),
								  dateFormat.format(new Date()),
								  newOrderMaster.getOrderID().toString(),
								  newOrderMaster.getOrderRecName(),
								  newOrderMaster.getOrderRecPhone(),
								  newOrderMaster.getOrderRecAddress()
								  );
		
		RequestDispatcher successView = req.getRequestDispatcher("/templates/frontstage/shop/orderSuccess.jsp");
		successView.forward(req, resp);
	}
}
