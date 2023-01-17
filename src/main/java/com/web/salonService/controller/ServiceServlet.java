package com.web.salonService.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.web.salonService.model.entities.Service;
import com.web.salonService.model.services.ServiceService;

@WebServlet({"/ipet-back/service/addService", "/ipet-back/service/allService", 
	"/ipet-back/service/editService", "/ipet-back/service/updateService", "/ipet-back/service/deleteService"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ServiceServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if("/ipet-back/service/addService".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/salon/salon_addservice.jsp").forward(req, res);
		}
		if("/ipet-back/service/allService".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/salon/salon_showservice.jsp").forward(req, res);
		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		
		/**********************************進入新增頁面，新增資料************************************/
		if("/ipet-back/service/addService".equals(path)) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
				/*************1.接收請求參數 - 輸入格式的錯誤處理**********/
				//取得服務名稱
				String svcName = req.getParameter("svcName");
				if (svcName == null || svcName.trim().length() == 0) {
					errorMsgs.put("svcName","請填寫服務名稱");
				}
				
				//取得服務描述
				String svcContent = req.getParameter("svcContent").trim();
				
				//取得上傳圖片
				Part img = req.getPart("svcImg");
				byte[] svcImg = null;
				if(img != null) {
					try(InputStream in = img.getInputStream()){
						svcImg = new byte[in.available()];
						in.read(svcImg);
					}
				}
				
				//取得服務類別
				Integer catId = null;
				try {
					catId = Integer.valueOf(req.getParameter("catId").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.put("catId","請選擇服務類別");
				}
				
				//取得服務狀態
				Integer svcStatus = null;
				try {
					svcStatus = Integer.valueOf(req.getParameter("svcStatus").trim());
					if(svcStatus != 0 && svcStatus != 1) {
						errorMsgs.put("svcStatus","請填入正確服務狀態");
					}
				} catch (IllegalArgumentException e) {
					errorMsgs.put("svcStatus","請填入正確服務狀態");
				}
				
				//處理字串>品種與價格
				String typeAndPrice = req.getParameter("typeAndPrice");
				JsonArray jsonArray = null;
				if(typeAndPrice == null || typeAndPrice.trim().length() == 0) {
					errorMsgs.put("typeAndPrice","請輸入正確品種與價格");
				}else {
					try {
						Gson gson = new Gson();
						
						jsonArray = gson.fromJson(typeAndPrice, JsonArray.class);
						for (JsonElement element : jsonArray) {
							JsonObject obj = element.getAsJsonObject();
							obj.get("typeId").getAsInt();
							obj.get("svcPrice").getAsInt();
						}
					} catch (Exception e) {
//						errorMsgs.put("typeAndPrice","請輸入正確品種與價格");
//						System.out.println(2);
					}
				}
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/templates/backstage/salon/salon_addservice.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/*********************2.開始新增資料************************/
				Gson gson = new Gson();
				
				jsonArray = gson.fromJson(typeAndPrice, JsonArray.class);
				ServiceService svcSvc = new ServiceService();
				int typeId;
				int svcPrice;
				
				for (JsonElement element : jsonArray) {
					JsonObject obj = element.getAsJsonObject();
					typeId = obj.get("typeId").getAsInt();
					svcPrice = obj.get("svcPrice").getAsInt();
					svcSvc.addService(svcName, svcContent, svcImg, catId, typeId, svcPrice, svcStatus);
				}
				
				/******************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/templates/backstage/salon/salon_showservice.jsp";
				req.getRequestDispatcher(url).forward(req, res);
			
		}
		
		// 來自salon_showservice.jsp 或 salon_selectservice.jsp的複合查詢請求
		if ("/ipet-back/service/allService".equals(path)) { 
			
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				
				/***************************1.將輸入資料轉為Map**********************************/ 
				Map<String, String[]> map = req.getParameterMap();
				
				/***************************2.開始複合查詢***************************************/
				ServiceService svcSvc = new ServiceService();
				List<Service> list  = svcSvc.findIfService(map);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("searchList", list); // 資料庫取出的list物件,存入request
				req.getRequestDispatcher("/templates/backstage/salon/salon_selectservice.jsp").forward(req, res);
		}
		
		// 來自salon_showservice.jsp的修改項目請求
		if ("/ipet-back/service/editService".equals(path)) { 

			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數****************************************/
				Integer svcId = Integer.valueOf(req.getParameter("svcId"));
				
				/***************************2.開始查詢資料****************************************/
				ServiceService svcSvc = new ServiceService();
				Service svcVO = svcSvc.getOneService(svcId);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				String param = "?svcId=" + svcVO.getSvcId() + 
						       "&svcName=" + svcVO.getSvcName() + 
						       "&svcContent=" + svcVO.getSvcContent() + 
						       "&svcImg=" + svcVO.getSvcImg() + 
						       "&catId=" + svcVO.getCatId() + 
						       "&typeId=" + svcVO.getTypeId() + 
						       "&typeNameAndSize=" + svcVO.getPetTypeVO().getTypeName() + " - " + svcVO.getPetTypeVO().getPetSize() +
						       "&svcPrice=" + svcVO.getSvcPrice() + 
						       "&svcStatus=" + svcVO.getSvcStatus();
				String url = "/templates/backstage/salon/salon_updateservice.jsp"+param;
				req.getRequestDispatcher(url).forward(req, res);	// 轉交 updateservice.jsp
		}
		
		if ("/ipet-back/service/updateService".equals(path)) { // 來自salon_updateservice.jsp的請求
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer svcId = Integer.valueOf(req.getParameter("svcId").trim());
				String svcContent = req.getParameter("svcContent").trim();
				
				
				//上傳圖片
				Part img = req.getPart("svcImg");
				byte[] svcImg = null;
				if(img != null) {
					try(InputStream in = img.getInputStream()){
						svcImg = new byte[in.available()];
						in.read(svcImg);
						if(svcImg.length == 0) {
							svcImg = new ServiceService().getOneService(svcId).getSvcImg();
						}
					}
				}
				
				String svcName = req.getParameter("svcName");
				if (svcName == null || svcName.trim().length() == 0) {
					errorMsgs.put("svcName","請填寫服務名稱");
				}
				
				Integer catId = null;
				try {
					catId = Integer.valueOf(req.getParameter("catId").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.put("catId","請選擇服務類別");
				}
				
				Integer typeId = null;
				try {
					typeId = Integer.valueOf(req.getParameter("typeId").trim());
				} catch (IllegalArgumentException e) {
					errorMsgs.put("typeId","請選擇正確寵物品種");
				}
				
				Integer svcPrice = null;
				try {
					svcPrice = Integer.valueOf(req.getParameter("svcPrice").trim());
					if(svcPrice <= 0) {
						errorMsgs.put("svcPrice","服務單價不可小於或等於0");
					}
				} catch (IllegalArgumentException e) {
					errorMsgs.put("svcPrice","請填入服務單價");
				}
				
				Integer svcStatus = null;
				try {
					svcStatus = Integer.valueOf(req.getParameter("svcStatus").trim());
					if(svcStatus != 0 && svcStatus != 1) {
						errorMsgs.put("svcStatus","請填入正確服務狀態");
					}
				} catch (IllegalArgumentException e) {
					errorMsgs.put("svcStatus","請填入正確服務狀態");
				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/templates/backstage/salon/salon_updateservice.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
			
				ServiceService svcSvc = new ServiceService();
				Service service = svcSvc.updateService(svcId, svcName, svcContent, svcImg, catId, typeId, svcPrice, svcStatus);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("serviceVO", service); // 資料庫update成功後,正確的物件,存入req
				String url = "/templates/backstage/salon/salon_showservice.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交salon_showservice.jsp
				successView.forward(req, res);
		}
		
		//刪除請求
		if ("/ipet-back/service/deleteService".equals(path)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數***************************************/
				Integer svcId = Integer.valueOf(req.getParameter("svcId"));

				/***************************2.開始刪除資料***************************************/
				
				ServiceService svcSvc = new ServiceService();
				svcSvc.deleteService(svcId);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/templates/backstage/salon/salon_showservice.jsp";
				req.getRequestDispatcher(url).forward(req, res);// 刪除成功後,轉交回送出刪除的來源網頁
				
		}
	}
}
