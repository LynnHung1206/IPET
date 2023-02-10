package com.web.list.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/ipet-front/shop/cart","/ipet-front/shop/wishList","/ipet-front/shop/checkout"})
public class HeaderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String url = "";
		
		if(req.getServletPath().contains("cart")) {
			url = "/templates/frontstage/shop/cart.jsp";
		} else if (req.getServletPath().contains("wishList")) {
			url = "/templates/frontstage/shop/wishList.jsp";
		} else if (req.getServletPath().contains("checkout")) {
			url = "/templates/frontstage/shop/checkout.jsp";
		}
		
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, resp);
	}
}
