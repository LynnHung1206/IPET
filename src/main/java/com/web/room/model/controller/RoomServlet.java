package com.web.room.model.controller;

import java.io.IOException;
import java.net.Authenticator.RequestorType;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.room.model.RoomStatus;
import com.web.room.model.entities.*;
import com.web.room.model.service.*;

@WebServlet({ "/ipet-back/hotel/showRoom" ,"/ipet-back/hotel/addRoom", "/ipet-back/hotel/editRoom","/ipet-back/hotel/updateRoom","/ipet-back/hotel/deleteRoom"})
public class RoomServlet extends HttpServlet {
	public static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if ("/ipet-back/hotel/showRoom".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/hotel/showRoom.jsp").forward(req, res);
		}
		if ("/ipet-back/hotel/addRoom".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/hotel/addRoom.jsp").forward(req, res);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();

		/*************************************
		 * 進入新增頁面，新增資料
		 ************************************/
		// 新增
		if ("/ipet-back/hotel/addRoom".equals(path)) {
			res.setContentType("text/text;charset=UTF-8");
			Map<String, String> errorMsgs = new HashMap<>();
			

			/************* 1.接收請求參數 - 輸入格式的錯誤處理 **********/
			
			// 取得房型編號

			Integer roomTypeId = Integer.valueOf(req.getParameter("roomTypeId").trim());
			// 取得房間狀態
			
			Integer roomCheckStatus = null;
			try {
				roomCheckStatus = Integer.valueOf(req.getParameter("roomCheckStatus").trim());
				if (roomCheckStatus != 0 && roomCheckStatus != 1 && roomCheckStatus != 2) {
					errorMsgs.put("svcStatus", "請填入正確狀態");
				}
			} catch (IllegalArgumentException e) {
				errorMsgs.put("roomCheckStatus", "請選擇狀態");
			}
			System.out.println(1);
			// 取得上下架狀態
			Integer roomSaleStatus = null;
			try {
				roomSaleStatus = Integer.valueOf(req.getParameter("roomSaleStatus").trim());
				if (roomSaleStatus != 0 && roomSaleStatus != 1) {
					errorMsgs.put("roomSaleStatus", "請填入正確上下架狀態");
				}
			} catch (IllegalArgumentException e) {
				errorMsgs.put("roomSaleStatus", "請選擇狀態");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			/*************************** 2.開始新增資料 ***************************************/
			RoomService roomSvc = new RoomService();
			Room room = roomSvc.addRoom(roomTypeId, roomCheckStatus, roomSaleStatus);
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("roomVO", room); // 資料庫update成功後,正確的物件,存入req
			String url = "/templates/backstage/hotel/showRoom.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交showRoom.jsp
			successView.forward(req, res);

		}
		// 來自showsRoomDiscount.jsp的修改項目請求
		if ("/ipet-back/hotel/editRoom".equals(path)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer roomId = Integer.valueOf(req.getParameter("roomId").trim());

			/*************************** 2.開始查詢資料 ****************************************/
			RoomService roomSvc = new RoomService();
			Room room = roomSvc.getOneRoom(roomId);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
//					

			req.setAttribute("roomVO", room); // 資料庫update成功後,正確的物件,存入req
			String url = "/templates/backstage/hotel/updateRoom.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交showRoom.jsp
			successView.forward(req, res);
		}
		// 修改
		if ("/ipet-back/hotel/updateRoom".equals(path)) {
			res.setContentType("text/text;charset=UTF-8");
			Map<String, String> errorMsgs = new HashMap<>();

			/************* 1.接收請求參數 - 輸入格式的錯誤處理 **********/
			// 取得房間編號
			Integer roomId = Integer.valueOf(req.getParameter("roomId").trim());
			// 取得房型編號
			Integer roomTypeId = Integer.valueOf(req.getParameter("roomTypeId").trim());
			
			// 取得房間狀態
			Integer roomCheckStatus = null;
			try {
				roomCheckStatus = Integer.valueOf(req.getParameter("roomCheckStatus").trim());
				if (roomCheckStatus != 0 && roomCheckStatus != 1 && roomCheckStatus != 2) {
					errorMsgs.put("svcStatus", "請填入正確狀態");
				}
			} catch (IllegalArgumentException e) {
				errorMsgs.put("roomCheckStatus", "請選擇狀態");
			}

			// 取得上下架狀態
			Integer roomSaleStatus = null;
			try {
				roomSaleStatus = Integer.valueOf(req.getParameter("roomSaleStatus").trim());
				if (roomSaleStatus != 0 && roomSaleStatus != 1) {
					errorMsgs.put("roomSaleStatus", "請填入正確上下架狀態");
				}
			} catch (IllegalArgumentException e) {
				errorMsgs.put("roomSaleStatus", "請選擇狀態");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			/*************************** 2.開始新增資料 ***************************************/
			RoomService roomSvc = new RoomService();
			Room room = roomSvc.updateRoom(roomId, roomTypeId, roomCheckStatus, roomSaleStatus);
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("roomVO", room); // 資料庫update成功後,正確的物件,存入req
			String url = "/templates/backstage/hotel/showRoom.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交showRoom.jsp
			successView.forward(req, res);

		}
		// 刪除
		if ("/ipet-back/hotel/deleteRoom".equals(path)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ***************************************/
			Integer roomId = Integer.valueOf(req.getParameter("roomId"));

			/*************************** 2.開始刪除資料 ***************************************/

			RoomService roomSvc = new RoomService();
			roomSvc.deleteRoom(roomId);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/templates/backstage/hotel/showRoom.jsp";
			req.getRequestDispatcher(url).forward(req, res);// 刪除成功後,轉交回送出刪除的來源網頁

		}
	}
}
