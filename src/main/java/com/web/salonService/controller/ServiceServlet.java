package com.web.salonService.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.web.salonService.model.entities.Service;
import com.web.salonService.model.services.ServiceService;

@WebServlet({"/ipet-back/service/addService",
			 "/ipet-back/service/allService", 
			 "/ipet-back/service/editService",
			 "/ipet-back/service/updateService",
			 "/ipet-back/service/deleteService",
			 "/ipet-back/service/showOldSvcImg", 
			 
			 "/ipet-front/service/showSvcImg", 
			 "/ipet-front/salon/salonCategory",
			 "/ipet-front/salon/service"
			 })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class ServiceServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		ServiceService serviceService = new ServiceService();
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.serializeNulls()
                .setDateFormat("yyyy-MM-dd")
                .create();
		
		//後台 - 新增服務
		if("/ipet-back/service/addService".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/salon/salon_addservice.jsp").forward(req, res);
		}
		
		//後台 - 顯示所有服務
		if("/ipet-back/service/allService".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/salon/salon_showservice.jsp").forward(req, res);
		}
		
		//後台 - 顯示圖片(若無圖片顯示沒有圖片)
		if("/ipet-back/service/showOldSvcImg".equals(path)) {
			showImg(req, res, "/static/frontstage/img/noImage.jpg");
		}
		
		//前台 - 顯示服務類別
		if("/ipet-front/salon/salonCategory".equals(path)) {
			req.getRequestDispatcher("/templates/frontstage/salon/salon_category.jsp").forward(req, res);
		}
		
		//前台 - 顯示類別服務
		if("/ipet-front/salon/service".equals(path)) {
			String catId = req.getParameter("catId");
			
			List<Service> services = serviceService.finSvcByCatId(Integer.parseInt(catId));
			req.setAttribute("services", gson.toJson(services));
			req.getRequestDispatcher("/templates/frontstage/salon/salon_category_list.jsp").forward(req, res);
		}
		
		//前台 - 顯示圖片(若無圖片顯示預設圖片)
		if("/ipet-front/service/showSvcImg".equals(path)) {
			showImg(req, res, "/static/frontstage/img/product/product-1.jpg");
		}
		
	}
	
	private void showImg(HttpServletRequest req, HttpServletResponse res, String url) throws ServletException, IOException {
		OutputStream out = res.getOutputStream();
		String svcId = req.getParameter("svcId");
		ServiceService svcsvc = new ServiceService();
		Service service = svcsvc.getOneService(Integer.parseInt(svcId));
		res.setContentType("image/jpg");
		byte[] svcImg = service.getSvcImg();
		if(svcImg == null) {
			InputStream in = getServletContext().getResourceAsStream(url);
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		}else {
			out.write(svcImg);
		}
		out.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		
		/**********************************進入新增頁面，新增資料************************************/
		if("/ipet-back/service/addService".equals(path)) {
			res.setContentType("text/text;charset=UTF-8");
			Map<String,String> errorMsgs = new HashMap<>();
		
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
					errorMsgs.put("svcStatus","請選擇服務狀態");
				}
				
				//處理字串>品種與價格
				String typeAndPrice = req.getParameter("typeAndPrice");
				JsonArray jsonArray = null;
				if(typeAndPrice.equals("[]")) {
					errorMsgs.put("typeAndPrice","請選擇品種與價格");
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
						errorMsgs.put("typeAndPrice","請輸入正確品種與價格");
					}
				}
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					res.getWriter().print(new Gson().toJson(errorMsgs));
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
				
		}
		
		// 來自salon_showservice.jsp 或 salon_selectservice.jsp的複合查詢請求
		if ("/ipet-back/service/allService".equals(path)) { 
				res.setContentType("application/json;charset=UTF-8");
				/***************************1.將輸入資料轉為Map**********************************/ 
				Map<String, String[]> map = req.getParameterMap();
				
				/***************************2.開始複合查詢***************************************/
				ServiceService svcSvc = new ServiceService();
				List<Service> list  = svcSvc.findIfService(map);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				Gson gson = new GsonBuilder().serializeNulls()
						.setDateFormat("yyyy-MM-dd")
						.create();
				res.getWriter().print(gson.toJson(list));
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
