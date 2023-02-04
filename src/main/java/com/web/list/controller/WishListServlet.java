package com.web.list.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.list.model.services.CartService;
import com.web.list.model.services.WishService;

@WebServlet("/ipet-front/prod/fromProductDetailWish")
public class WishListServlet extends HttpServlet {
	private static final long serialVersionUID = 3366964523716846594L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		

		if ("add".equals(action)) { //來自productDetail的請求
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			Integer memID = Integer.valueOf(request.getParameter("memID"));
			Integer prodID = Integer.valueOf(request.getParameter("prodID"));
			
			/*************************** 2.開始新增資料 ***************************************/
			WishService wishSvc = new WishService();
			wishSvc.addOneProd(memID, prodID);
		}

		if ("remove".equals(action)) { //來自productDetail的請求
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			Integer memID = Integer.valueOf(request.getParameter("memID"));
			Integer prodID = Integer.valueOf(request.getParameter("prodID"));
			/*************************** 2.開始刪除資料 ***************************************/
			WishService wishSvc = new WishService();
			wishSvc.removeOneProd(memID, prodID);
		}
//
//		if ("selectOneProd".equals(action)) {
//
//		}
//
//		if ("selectAll".equals(action)) {
//
//		}
	}
}
