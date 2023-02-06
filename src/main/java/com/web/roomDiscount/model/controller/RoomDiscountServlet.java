package com.web.roomDiscount.model.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.roomDiscount.model.entity.Discount;
import com.web.roomDiscount.model.service.DiscountService;


@WebServlet({ "/ipet-back/hotel/addRoomDiscount", "/ipet-back/hotel/showRoomDiscount","/ipet-back/hotel/editRoomDiscount","/ipet-back/hotel/updateRoomDiscount","/ipet-back/hotel/deleteRoomDiscount"})
public class RoomDiscountServlet extends HttpServlet {
	public static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if ("/ipet-back/hotel/addRoomDiscount".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/hotel/addRoomDiscount.jsp").forward(req, res);
		}
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();

		/*********************************** 進入新增頁面，新增資料************************************/
		if ("/ipet-back/hotel/addRoomDiscount".equals(path)) {
			res.setContentType("text/text;charset=UTF-8");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			

			/************* 1.接收請求參數 - 輸入格式的錯誤處理 **********/

			// 取得優惠名稱
			String discountName = req.getParameter("discountName");
			if (discountName == null || discountName.trim().length() == 0) {
				errorMsgs.add("請填寫優惠名稱");
			}

			// 取得優惠內容
			String discountContent = req.getParameter("discountContent").trim();
			if (discountContent == null || discountContent.trim().length() == 0) {
				errorMsgs.add( "請填寫優惠內容");
			}

			// 取得優惠折扣
			Integer roomDis = null;
			try {
				roomDis = Integer.valueOf(req.getParameter("roomDis").trim());
			} catch (NumberFormatException e) {
				roomDis = 0;
				errorMsgs.add("房型價格請填數字");
			}
			if (roomDis > 200 || roomDis < 50) {
				errorMsgs.add( "價格範圍只能是50~200之間");
			}
			// 取得優惠開始時間
			Date startTime = null;
			try {
				startTime = java.sql.Date.valueOf(req.getParameter("startTime").trim());
			}catch (IllegalArgumentException e){
				errorMsgs.add("請填選起始時間");
			}
			
			
			// 取得優惠結束時間
			Date endTime = null;
			try {
				endTime = java.sql.Date.valueOf(req.getParameter("endTime").trim());
			}catch (IllegalArgumentException e){
				errorMsgs.add("請填選結束時間");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/templates/backstage/hotel/addRoomDiscount.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			/*************************** 2.開始新增資料 ***************************************/
			DiscountService discountSvc = new DiscountService();
			Discount discount = discountSvc.addDiscount(discountName, discountContent, roomDis, startTime, endTime);
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("discountVO", discount); // 資料庫update成功後,正確的物件,存入req
			String url = "/templates/backstage/hotel/showRoomDiscount.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交showRoomDiscount.jsp
			successView.forward(req, res);
		}
		// 來自showsRoomDiscount.jsp的修改項目請求
		if ("/ipet-back/hotel/editRoomDiscount".equals(path)) { 

			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
					
			/***************************1.接收請求參數****************************************/
			Integer discountId = Integer.valueOf(req.getParameter("discountId").trim());
						
			/***************************2.開始查詢資料****************************************/
			DiscountService discountSvc = new DiscountService();
			Discount discount = discountSvc.getOneDiscount(discountId);
										
			/***************************3.查詢完成,準備轉交(Send the Success view)************/
//			String param = "?discountId=" + discount.getDiscountId() + 
//						   "&discountName=" + discount.getDiscountName() + 
//						   "&discountContent=" + discount.getDiscountContent() + 
//					       "&roomDis=" + discount.getRoomDis() + 
//					       "&startTime=" + discount.getStartTime() + 
//					       "&endTime=" + discount.getEndTime() ;
//			String url = "/templates/backstage/hotel/updateRoomDiscount.jsp"+param;
//			req.getRequestDispatcher(url).forward(req, res);	// 轉交 updateRoomDiscount.jsp

			req.setAttribute("discountVO", discount); // 資料庫update成功後,正確的物件,存入req
			String url = "/templates/backstage/hotel/updateRoomDiscount.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交showRoomDiscount.jsp
			successView.forward(req, res);
			}
		// 修改
		if ("/ipet-back/hotel/updateRoomDiscount".equals(path)) { // 來自updateRoomDiscount.jsp的請求
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			//取得優惠編號
			Integer discountId = Integer.valueOf(req.getParameter("discountId").trim());
			//取得優惠名稱
			String discountName = req.getParameter("discountName").trim();
			if (discountName == null || discountName.trim().length() == 0) {
				errorMsgs.put("discountName", "請填寫優惠名稱");
			}
			// 取得優惠內容
			String discountContent = req.getParameter("discountContent").trim();
			if (discountContent == null || discountContent.trim().length() == 0) {
				errorMsgs.put("discountContent", "請填寫優惠內容");
			}

			// 取得優惠折扣
			Integer roomDis = null;
			try {
			roomDis = Integer.valueOf(req.getParameter("roomDis").trim());
			} catch (NumberFormatException e) {
				roomDis = 0;
				errorMsgs.put("roomDis", "優惠價格");
			}
			if (roomDis > 200 || roomDis < 50) {
				errorMsgs.put("roomDis", "價格範圍只能是50~200之間");
			}
			// 取得優惠開始時間
			Date startTime = null;
			try {
				startTime = java.sql.Date.valueOf(req.getParameter("startTime").trim());
			}catch (IllegalArgumentException e){
				errorMsgs.put("startTime","請填選起始時間");
			}
			// 取得優惠結束時間
			Date endTime = null;
			try {
				endTime = java.sql.Date.valueOf(req.getParameter("endTime").trim());
			}catch (IllegalArgumentException e){
				errorMsgs.put("endTime","請填選起始時間");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/templates/backstage/hotel/addRoomDiscount.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			/***************************2.開始修改資料*****************************************/
			
			DiscountService discountSvc = new DiscountService();
			Discount disocount = discountSvc.updateDiscount(discountId, discountName, discountContent, roomDis, startTime, endTime);
			
			/***************************3.修改完成,準備轉交(Send the Success view)*************/
			req.setAttribute("disocountVO", disocount); // 資料庫update成功後,正確的物件,存入req
			String url = "/templates/backstage/hotel/showRoomDiscount.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交showRoomDiscount.jsp
			successView.forward(req, res);
		}			
		// 刪除
		if ("/ipet-back/hotel/deleteRoomDiscount".equals(path)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ***************************************/
			Integer discountId = Integer.valueOf(req.getParameter("discountId"));

			/*************************** 2.開始刪除資料 ***************************************/

			DiscountService discountSvc = new DiscountService();
			discountSvc.deleteDiscount(discountId);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/templates/backstage/hotel/showRoomDiscount.jsp";
			req.getRequestDispatcher(url).forward(req, res);// 刪除成功後,轉交回送出刪除的來源網頁

		}
	}

}
