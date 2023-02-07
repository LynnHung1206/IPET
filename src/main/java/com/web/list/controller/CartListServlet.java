package com.web.list.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.list.model.entities.CartList;
import com.web.list.model.entities.CartList.CartListPK;
import com.web.list.model.services.CartService;
import com.web.list.model.services.WishService;

@WebServlet({ "/ipet-front/prod/fromProductDetailCart", "/ipet-front/prod/addToCart", "/ipet-front/prod/header" })
public class CartListServlet extends HttpServlet {

	private static final long serialVersionUID = 1189778329405162714L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		if ("add2".equals(action)) { // 來自productDetail的請求
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			Integer memID = Integer.valueOf(request.getParameter("memID"));
			Integer prodID = Integer.valueOf(request.getParameter("prodID"));

			/**************************** 2.開始新增資料 ****************************/
			CartService cartSvc = new CartService();
			CartList cartList = new CartList();

			CartListPK cartListPK = new CartListPK(memID, prodID);
			cartList = cartSvc.selectOne(cartListPK);

			if (cartList == null) {
				cartSvc.addOneProd2(memID, prodID);
			} else {
				cartSvc.removeOneProd(memID, prodID);
			}

		}

		if ("add".equals(action)) { // 來自productDetail的請求
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			Integer memID = Integer.valueOf(request.getParameter("memID"));
			Integer prodID = Integer.valueOf(request.getParameter("prodID"));
			Integer count = Integer.valueOf(request.getParameter("count"));
			Integer total = Integer.valueOf(request.getParameter("total"));
			

			/**************************** 2.先查詢是否有新增過購物車 ****************************/
			CartService cartSvc = new CartService();
			CartList cartList = new CartList();

			CartListPK cartListPK = new CartListPK(memID, prodID);
			cartList = cartSvc.selectOne(cartListPK);
			// 如果沒有就新增 有就移除
			if (cartList == null) {
				cartSvc.addOneProd(memID, prodID, count, total);
			} else {
				cartSvc.removeOneProd(memID, prodID);
			}
		}

		if ("remove".equals(action)) { // 來自productDetail的請求
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			Integer memID = Integer.valueOf(request.getParameter("memID"));
			Integer prodID = Integer.valueOf(request.getParameter("prodID"));
			/*************************** 2.開始刪除資料 ***************************************/
			CartService cartSvc = new CartService();
			cartSvc.removeOneProd(memID, prodID);
		}

		if ("addFromWish".equals(action)) {
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			Integer memID = Integer.valueOf(request.getParameter("memID"));
			Integer prodID = Integer.valueOf(request.getParameter("prodID"));
			Integer count = Integer.valueOf(request.getParameter("count"));
			Integer total = Integer.valueOf(request.getParameter("total"));
			/*************************** 2.開始新增資料 ***************************************/
			CartService cartSvc = new CartService();
			cartSvc.addOneProd(memID, prodID, count, total);
		}
		if ("head".equals(action)) {
			CartListPK cartListPK = new CartListPK();
			cartListPK.setMemID(1);

			CartList cartList = new CartList();
			cartList.setCartListPK(cartListPK);

			CartService cartSvc = new CartService();

			response.setContentType("text/html; charset=utf-8");
			response.getWriter().print(cartSvc.getAll(cartList).size());
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
