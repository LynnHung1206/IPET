package com.web.list.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.list.model.entities.WishList;
import com.web.list.model.entities.WishList.WishListPK;
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
		System.out.println(action);

		if ("add".equals(action)) { // 來自productDetail的請求
			
			String memIDStr = request.getParameter("memID");

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			Integer memID = Integer.valueOf(memIDStr);
			Integer prodID = Integer.valueOf(request.getParameter("prodID"));
			

			/**************************** 2.先查詢是否有新增過收藏****************************/
			WishService wishSvc = new WishService();
			WishList wishList = new WishList();

			WishListPK wishListPK = new WishListPK(memID, prodID);
			wishList = wishSvc.selectOne(wishListPK);

			/*************************** 3.開始新增資料 ***************************************/
			if (wishList == null) { //如果沒有查詢到資料，就新增，反之刪除
				wishSvc.addOneProd(memID, prodID);

			} else {
			 	wishSvc.removeOneProd(memID, prodID);
			}
		}
		if ("remove".equals(action)) {
			Integer memID = Integer.valueOf(request.getParameter("memID"));
			Integer prodID = Integer.valueOf(request.getParameter("prodID"));
			
			WishService wishSvc = new WishService();
			wishSvc.removeOneProd(memID, prodID);
			
		}
	}
}
