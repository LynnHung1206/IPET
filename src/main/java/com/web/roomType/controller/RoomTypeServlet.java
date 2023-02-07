package com.web.roomType.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.web.room.model.entities.Room;
import com.web.room.model.service.RoomService;
import com.web.roomType.model.entities.RoomType;
import com.web.roomType.model.service.RoomTypeService;


@WebServlet({"/ipet-back/roomType/allRoomType","/ipet-back/hotel/editRoomType"})
//@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class RoomTypeServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if("/ipet-back/roomType/allRoomType".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/hotel/showRoomType.jsp").forward(req, res);
		}
		if("/ipet-back/roomType/addRoomType".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/roomType/addRoomType.jsp").forward(req, res);
		}
	
		
	}
	private void roomTypePhoto(HttpServletRequest req, HttpServletResponse res, String url) throws ServletException, IOException {
		OutputStream out = res.getOutputStream();
		String roomTypeId = req.getParameter("roomTypeId");
		RoomTypeService roomTypeSvc = new RoomTypeService();
		RoomType roomType = roomTypeSvc.getOneRoomType(Integer.parseInt(roomTypeId));
		res.setContentType("image/jpg");
		byte[] roomTypePhoto = roomType.getRoomTypePhoto();
		if(roomTypePhoto == null) {
			InputStream in = getServletContext().getResourceAsStream(url);
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		}else {
			out.write(roomTypePhoto);
		}
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		
		
		if ("/ipet-back/hotel/addRoomType".equals(path)) {
			res.setContentType("text/text;charset=UTF-8");
			Map<String, String> errorMsgs = new HashMap<>();
			
			// 新增
			/************* 1.接收請求參數 - 輸入格式的錯誤處理 **********/
			
			// 取得房型編號

			Integer roomAmount = null;
			try {
				roomAmount = Integer.valueOf(req.getParameter("roomAmount").trim());
			} catch (NumberFormatException e) {
				roomAmount = 0;
				errorMsgs.put("roomTypeAmount", "房型數量請填數字");
			}
			String roomTypeName = req.getParameter("roomTypeName");

			if (roomTypeName == null || roomTypeName.trim().length() == 0) {
				errorMsgs.put("roomTypeName","房型名稱: 請勿空白");
			}
			
			String dogSize = req.getParameter("dogSize");
			
			String roomTypeContent = req.getParameter("roomTypeContent");

			if (roomTypeContent == null || roomTypeContent.trim().length() == 0) {
				errorMsgs.put("roomTypeContent","房間說明: 請勿空白");
			}
			
			//取得上傳圖片
			Part img = req.getPart("roomTypePhoto");
			byte[] roomTypePhoto = null;
			if(img != null) {
				try(InputStream in = img.getInputStream()){
					roomTypePhoto = new byte[in.available()];
					in.read(roomTypePhoto);
				}
			}
			
			Integer roomTypePrice = null;
			try {
				roomTypePrice = Integer.valueOf(req.getParameter("roomTypePrice").trim());
			} catch (NumberFormatException e) {
				roomTypePrice = 0;
				errorMsgs.put("roomTypePrice","房型價格請填數字");
			}
			if (roomTypePrice > 9000 || roomTypePrice < 500) {
				errorMsgs.put("roomTypePrice","價格範圍只能是500~9999之間");
			}

			Integer roomTypeStatus = null;
			try {
				roomTypeStatus = Integer.valueOf(req.getParameter("roomTypeStatus").trim());
			} catch (NumberFormatException e) {
				roomTypeStatus = 0;
				errorMsgs.put("roomTypeStatus","房間狀態請填數字");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			/*************************** 2.開始新增資料 ***************************************/
//			RoomTypeService roomTypeSvc = new RoomTypeService();
//			RoomType roomType = roomTypeSvc.addRoomType(roomAmount, roomTypeName, dogSize, roomTypeContent, roomTypePhoto, roomTypePrice, roomTypeStatus);
//			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
//			req.setAttribute("roomTypeVO", roomType); // 資料庫update成功後,正確的物件,存入req
//			String url = "/templates/backstage/roomType/showRoomTyoe.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交showRoomType.jsp
//			successView.forward(req, res);

		}
		// 來自showsRoomType.jsp的修改項目請求
		if ("/ipet-back/hotel/editRoomType".equals(path)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer roomTypeId = Integer.valueOf(req.getParameter("roomTypeId").trim());

			/*************************** 2.開始查詢資料 ****************************************/
			RoomTypeService roomTypeSvc = new RoomTypeService();
			RoomType roomType = roomTypeSvc.getOneRoomType(roomTypeId);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
//					

			req.setAttribute("roomTypeVO", roomType); // 資料庫update成功後,正確的物件,存入req
			String url = "/templates/backstage/hotel/updateRoomType.jsp";
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
