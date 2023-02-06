package com.web.salonSale.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.web.salonSale.model.entities.Sale;
import com.web.salonSale.model.services.SaleDetailService;
import com.web.salonSale.model.services.SaleService;
import com.web.salonService.model.entities.Service;
import com.web.salonService.model.services.ServiceService;

@WebServlet({"/ipet-back/salonSale/addSale", "/ipet-back/salonSale/allSale", 
	"/ipet-back/salonSale/editSale", "/ipet-back/salonSale/updateSale", "/ipet-back/salonSale/deleteSale"})
public class SaleServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		SaleService saleService = new SaleService();
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.serializeNulls()
                .setDateFormat("yyyy / MM / dd-HH : mm : ss")
                .create();
		
		if("/ipet-back/salonSale/allSale".equals(path)) {
			List<Sale> sales = saleService.selectAll();
			req.setAttribute("sales", gson.toJson(sales));
			req.getRequestDispatcher("/templates/backstage/salon/salon_showsale.jsp").forward(req, res);
		}
		if("/ipet-back/salonSale/addSale".equals(path)) {
			List<Service> services = new ServiceService().selectAll();
			req.setAttribute("services", gson.toJson(services));
			req.getRequestDispatcher("/templates/backstage/salon/salon_addsale.jsp").forward(req, res);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		
		if("/ipet-back/salonSale/addSale".equals(path)) {
			res.setContentType("text/text;charset=UTF-8");
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
			/*************1.接收請求參數 - 輸入格式的錯誤處理**********/
			//取得優惠名稱
			String saleName = req.getParameter("saleName");
			if (saleName == null || saleName.trim().length() == 0) {
				errorMsgs.put("saleName","請填寫優惠名稱");
			}
			
			//取得優惠描述
			String saleContent = req.getParameter("saleContent").trim();
			
			/*=========================== 取得時間 =============================*/
			String saleTime = req.getParameter("saleTime");
			//2023/02/05 05:54:43 - 2023/02/05 11:59:59
			int compartIndex = saleTime.indexOf("-");
			
			//startTime
			String startTimeStr = saleTime.substring(0, compartIndex - 1);
			Date startDate = null;
			try {
				startDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(startTimeStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Timestamp startTime = new Timestamp(startDate.getTime());

			//endTime
			String endTimeStr = saleTime.substring(compartIndex + 2);
			Date endDate = null;
			try {
				endDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(endTimeStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Timestamp endTime = new Timestamp(endDate.getTime());
			
			/*=========================== /取得時間 =============================*/
			
			//處理字串>服務ID與優惠價格
			String svcAndSalePrice = req.getParameter("svcAndSalePrice");
			JsonArray jsonArray = null;
			if(svcAndSalePrice.equals("[]")) {
				errorMsgs.put("svcAndSalePrice","請選擇服務與價格");
			}else {
				try {
					Gson gson = new Gson();
					jsonArray = gson.fromJson(svcAndSalePrice, JsonArray.class);
					for (JsonElement element : jsonArray) {
						JsonObject obj = element.getAsJsonObject();
						obj.get("svcId").getAsInt();
						obj.get("salePrice").getAsInt();
					}
				} catch (Exception e) {
					errorMsgs.put("typeAndPrice","請輸入正確服務與價格");
				}
			}
			
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				res.getWriter().print(new Gson().toJson(errorMsgs));
				return; //程式中斷
			}
			
			/*********************2.開始新增資料************************/
			
			//新增優惠
			SaleService saleService = new SaleService();
			Sale sale = saleService.addSale(saleName, saleContent, startTime, endTime);
			System.out.println("新增一筆優惠，優惠ID(saleId)：" + sale.getSaleId());
			
			//新增優惠詳情
			Gson gson = new Gson();
			jsonArray = gson.fromJson(svcAndSalePrice, JsonArray.class);
			SaleDetailService saleDetailService = new SaleDetailService();
			int svcId;
			int salePrice;
			
			for (JsonElement element : jsonArray) {
				JsonObject obj = element.getAsJsonObject();
				svcId = obj.get("svcId").getAsInt();
				salePrice = obj.get("salePrice").getAsInt();
				saleDetailService.addOrUpdateSaleDetail(sale.getSaleId(), svcId, salePrice);
			}
		}
		
		// 來自salon_showsale.jsp的修改項目請求
		if("/ipet-back/salonSale/editSale".equals(path)) {
			
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數****************************************/
				Integer saleId = Integer.valueOf(req.getParameter("saleId"));
				
				/***************************2.開始查詢資料****************************************/
				SaleService saleService = new SaleService();
				Sale sale = saleService.getOneSale(saleId);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				String param = "?saleId=" + sale.getSaleId() + 
						       "&saleName=" + sale.getSaleName() + 
						       "&saleContent=" + sale.getSalContent() + 
						       "&startTime=" + sale.getStartTime() + 
						       "&endTime=" + sale.getEndTime();
			
				req.getRequestDispatcher("/templates/backstage/salon/salon_updatesale.jsp"+param).forward(req, res);
		}
	}
	//限制更動的開始時間只能比現在時間晚，否則更新失敗
	
	//限制更動的結束時間只能比開始時間晚，否則更新失敗
}
