package com.web.list.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/ipet-front/shop/cart","/ipet-front/shop/wishList","/ipet-front/shop/checkout","/ipet-front/cart","/ipet-front/wishList","/ipet-front/checkout"})
public class HeaderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getServletPath();
		
		// check if path is on '/shop'
		Boolean isOnShop = path.contains("shop");
		int action = 0;
		String url = "";
		
		// what is member going to do
		if(path.contains("cart")) {
			action = 1;
		} else if(path.contains("wishList")) {
			action = 2;
		} else if(path.contains("checkout")) {
			action = 3;
		}
		
		// if path is on '/shop', then go to jsp
		// if path is not on '/shop', then redirect to this servlet
		switch (action) {
		case 1:
			if(isOnShop) {
				url = "/templates/frontstage/shop/cart.jsp";
			} else {
				resp.sendRedirect(req.getContextPath() + "/ipet-front/shop/cart");
				return;
			}
			break;
		case 2:
			if(isOnShop) {
				url = "/templates/frontstage/shop/wishList.jsp";
			} else {
				resp.sendRedirect(req.getContextPath() + "/ipet-front/shop/wishList");
				return;
			}
			break;
		case 3:
			if(isOnShop) {
				url = "/templates/frontstage/shop/checkout.jsp";
			} else {
				resp.sendRedirect(req.getContextPath() + "/ipet-front/shop/checkout");
				return;
			}
			break;
		default:
			break;
		}
		
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, resp);
	}
}
