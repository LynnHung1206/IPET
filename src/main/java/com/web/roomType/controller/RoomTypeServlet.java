package com.web.roomType.controller;

import java.io.IOException;
import java.io.InputStream;
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
import com.web.roomType.model.entities.RoomType;
import com.web.roomType.model.service.RoomTypeService;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
@WebServlet({ "/ipet-back/roomType/showRoomType","/ipet-back/roomType/addRoomType","/ipet-back/roomType/editRoomType","/ipet-back/roomType/updateRoomType","/ipet-back/roomType/deleteRoomType"})
public class RoomTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if ("/ipet-back/roomType/showRoomType".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/roomType/showRoomType.jsp").forward(req, res);
		}
		if ("/ipet-back/roomType/addRoomType".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/roomType/addRoomType.jsp").forward(req, res);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();

		if ("/ipet-back/roomType/addRoomType".equals(path)) {
			res.setContentType("text/text;charset=UTF-8");
			Map<String, String> errorMsgs = new HashMap<>();

			// 新增
			/************* 1.接收請求參數 - 輸入格式的錯誤處理 **********/

			// 取得房型數量

			Integer roomAmount = null;
			try {
				roomAmount = Integer.valueOf(req.getParameter("roomAmount").trim());
			} catch (NumberFormatException e) {
				roomAmount = 0;
				errorMsgs.put("roomTypeAmount", "房型數量請填數字");
			}
			String roomTypeName = req.getParameter("roomTypeName");

			if (roomTypeName == null || roomTypeName.trim().length() == 0) {
				errorMsgs.put("roomTypeName", "房型名稱: 請勿空白");
			}

			String dogSize = req.getParameter("dogSize");

			String roomTypeContent = req.getParameter("roomTypeContent");

			if (roomTypeContent == null || roomTypeContent.trim().length() == 0) {
				errorMsgs.put("roomTypeContent", "房間說明: 請勿空白");
			}

			// 取得上傳圖片
			 // 照片
			   InputStream in = req.getPart("roomTypePhoto").getInputStream(); // 從javax.servlet.http.Part物件取得上傳檔案的InputStream
			   byte[] roomTypePhoto = null;
			   if (in.available() != 0) {
				   roomTypePhoto = new byte[in.available()];
			    in.read(roomTypePhoto);
			    in.close();
			   } else
			    errorMsgs.put("", " 記得上傳照片");
			// 取得房型價格
			Integer roomTypePrice = null;
			try {
				roomTypePrice = Integer.valueOf(req.getParameter("roomTypePrice").trim());
			} catch (NumberFormatException e) {
				roomTypePrice = 0;
				errorMsgs.put("roomTypePrice", "房型價格請填數字");
			}
			if (roomTypePrice > 9000 || roomTypePrice < 500) {
				errorMsgs.put("roomTypePrice", "價格範圍只能是500~9999之間");
			}

			// 取得房型狀態
			Integer roomTypeStatus = null;
			try {
				roomTypeStatus = Integer.valueOf(req.getParameter("roomTypeStatus").trim());
			} catch (NumberFormatException e) {
				roomTypeStatus = 0;
				errorMsgs.put("roomTypeStatus", "房間狀態請填數字");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			/*************************** 2.開始新增資料 ***************************************/
			RoomTypeService roomTypeSvc = new RoomTypeService();
			RoomType roomType = roomTypeSvc.addRoomType(roomAmount, roomTypeName, dogSize, roomTypeContent,
					roomTypePhoto, roomTypePrice, roomTypeStatus);
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("roomTypeVO", roomType); // 資料庫update成功後,正確的物件,存入req
			String url = "/templates/backstage/roomType/showRoomType.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交showRoomType.jsp
			successView.forward(req, res);

		}
		// 來自showsRoomType.jsp的修改項目請求
		if ("/ipet-back/roomType/editRoomType".equals(path)) {

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
			String url = "/templates/backstage/roomType/updateRoomType.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交showRoom.jsp
			successView.forward(req, res);
		}
		// 修改
		if ("/ipet-back/roomType/updateRoomType".equals(path)) {
			res.setContentType("text/text;charset=UTF-8");
			Map<String, String> errorMsgs = new HashMap<>();

			/************* 1.接收請求參數 - 輸入格式的錯誤處理 **********/
			// 取得房間編號
			Integer roomTypeId = Integer.valueOf(req.getParameter("roomTypeId").trim());

			// 取得房型數量

			Integer roomAmount = null;
			try {
				roomAmount = Integer.valueOf(req.getParameter("roomAmount").trim());
			} catch (NumberFormatException e) {
				roomAmount = 0;
				errorMsgs.put("roomTypeAmount", "房型數量請填數字");
			}
			String roomTypeName = req.getParameter("roomTypeName");

			if (roomTypeName == null || roomTypeName.trim().length() == 0) {
				errorMsgs.put("roomTypeName", "房型名稱: 請勿空白");
			}

			String dogSize = req.getParameter("dogSize");

			String roomTypeContent = req.getParameter("roomTypeContent");

			if (roomTypeContent == null || roomTypeContent.trim().length() == 0) {
				errorMsgs.put("roomTypeContent", "房間說明: 請勿空白");
			}

			// 取得上傳圖片
			 InputStream in = req.getPart("roomTypePhoto").getInputStream(); // 從javax.servlet.http.Part物件取得上傳檔案的InputStream
			   byte[] roomTypePhoto = null;
			   if (in.available() != 0) {
				   roomTypePhoto = new byte[in.available()];
			    in.read(roomTypePhoto);
			    in.close();
			   } else {
					RoomTypeService roomTypeSvc = new RoomTypeService();
					roomTypePhoto = roomTypeSvc.getOneRoomType(roomTypeId).getRoomTypePhoto();
				}
			// 取得房型價格
			Integer roomTypePrice = null;
			try {
				roomTypePrice = Integer.valueOf(req.getParameter("roomTypePrice").trim());
			} catch (NumberFormatException e) {
				roomTypePrice = 0;
				errorMsgs.put("roomTypePrice", "房型價格請填數字");
			}
			if (roomTypePrice > 9000 || roomTypePrice < 500) {
				errorMsgs.put("roomTypePrice", "價格範圍只能是500~9999之間");
			}

			// 取得房型狀態
			Integer roomTypeStatus = null;
			try {
				roomTypeStatus = Integer.valueOf(req.getParameter("roomTypeStatus").trim());
			} catch (NumberFormatException e) {
				roomTypeStatus = 0;
				errorMsgs.put("roomTypeStatus", "房間狀態請填數字");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("");
				failureView.forward(req, res);
				return; // 程式中斷
			}
			/*************************** 2.開始新增資料 ***************************************/
			RoomTypeService roomTypeSvc = new RoomTypeService();
			RoomType roomType = roomTypeSvc.updateRoomType(roomTypeId, roomAmount, roomTypeName, dogSize,
					roomTypeContent, roomTypePhoto, roomTypePrice, roomTypeStatus);
			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("roomTypeVO", roomType); // 資料庫update成功後,正確的物件,存入req
			String url = "/templates/backstage/roomType/showRoomType.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交showRoom.jsp
			successView.forward(req, res);

		}
		// 刪除
		if ("/ipet-back/roomType/deleteRoomType".equals(path)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ***************************************/
			Integer roomTypeId = Integer.valueOf(req.getParameter("roomTypeId"));

			/*************************** 2.開始刪除資料 ***************************************/

			RoomTypeService roomSvc = new RoomTypeService();
			roomSvc.deleteRoomType(roomTypeId);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/templates/backstage/roomType/showRoom.jsp";
			req.getRequestDispatcher(url).forward(req, res);// 刪除成功後,轉交回送出刪除的來源網頁

		}

	}
}
