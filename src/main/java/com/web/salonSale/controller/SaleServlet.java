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
import javax.servlet.annotation.MultipartConfig;
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
import com.web.salonSale.model.entities.SaleDetail;
import com.web.salonSale.model.services.SaleDetailService;
import com.web.salonSale.model.services.SaleService;
import com.web.salonService.model.entities.Service;
import com.web.salonService.model.services.ServiceService;

@WebServlet({ "/ipet-back/salonSale/addSale", "/ipet-back/salonSale/allSale", "/ipet-back/salonSale/editSale",
		"/ipet-back/salonSale/updateSale", "/ipet-back/salonSale/deleteSale" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class SaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		SaleService saleService = new SaleService();
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.serializeNulls().setDateFormat("yyyy / MM / dd-HH : mm : ss").create();

		if ("/ipet-back/salonSale/allSale".equals(path)) {
			List<Sale> sales = saleService.selectAll();
			req.setAttribute("sales", gson.toJson(sales));
			req.getRequestDispatcher("/templates/backstage/salon/salon_showsale.jsp").forward(req, res);
		} else

		if ("/ipet-back/salonSale/addSale".equals(path)) {
			List<Service> services = new ServiceService().selectAll();
			req.setAttribute("services", gson.toJson(services));
			req.getRequestDispatcher("/templates/backstage/salon/salon_addsale.jsp").forward(req, res);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();

		if ("/ipet-back/salonSale/addSale".equals(path)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/************* 1.接收請求參數 - 輸入格式的錯誤處理 **********/
			// 取得優惠名稱
			String saleName = req.getParameter("saleName");
			if (saleName == null || saleName.trim().length() == 0) {
				errorMsgs.put("saleName", "請填寫優惠名稱");
			}

			// 取得優惠描述
			String saleContent = req.getParameter("saleContent").trim();

			/* =========================== 取得時間 ============================= */
			String saleTime = req.getParameter("saleTime");
			if (saleTime == null || saleTime.trim().length() == 0) {
				errorMsgs.put("saleTime", "請填寫優惠時間");
			}
			// 格式範例：2023/02/05 05:54:43 - 2023/02/05 11:59:59
			int compartIndex = saleTime.indexOf("-");

			// startTime
			String startTimeStr = saleTime.substring(0, compartIndex - 1);
			Date startDate = null;
			try {
				startDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(startTimeStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Timestamp startTime = new Timestamp(startDate.getTime());

			// endTime
			String endTimeStr = saleTime.substring(compartIndex + 2);
			Date endDate = null;
			try {
				endDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(endTimeStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Timestamp endTime = new Timestamp(endDate.getTime());

			/* =========================== /取得時間 ============================= */

			// 處理字串>服務ID與優惠價格
			String svcAndSalePrice = req.getParameter("svcAndSalePrice");
			JsonArray jsonArray = null;

			try {
				Gson gson = new Gson();
				jsonArray = gson.fromJson(svcAndSalePrice, JsonArray.class);
				for (JsonElement element : jsonArray) {
					JsonObject obj = element.getAsJsonObject();
					obj.get("svcId").getAsInt();
					obj.get("salePrice").getAsInt();
				}
			} catch (Exception e) {
				errorMsgs.put("typeAndPrice", "請輸入正確服務與價格");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				res.getWriter().print(new Gson().toJson(errorMsgs));
				return; // 程式中斷
			}

			/********************* 2.開始新增資料 ************************/

			// 新增優惠
			SaleService saleService = new SaleService();
			Sale sale = saleService.addSale(saleName, saleContent, startTime, endTime);
			int saleId = sale.getSaleId();
			System.out.println("新增一筆優惠，優惠ID(saleId)：" + saleId);

			// 新增優惠詳情
			Gson gson = new Gson();
			jsonArray = gson.fromJson(svcAndSalePrice, JsonArray.class);
			SaleDetailService saleDetailService = new SaleDetailService();
			int svcId;
			int salePrice;

			int count = 0;

			for (JsonElement element : jsonArray) {
				JsonObject obj = element.getAsJsonObject();
				svcId = obj.get("svcId").getAsInt();
				salePrice = obj.get("salePrice").getAsInt();
				saleDetailService.addOrUpdateSaleDetail(saleId, svcId, salePrice);

				System.out.println("新增一筆優惠細項，優惠ID(saleId)：" + saleId + "，服務ID(svcId)：" + svcId);
				count++;
			}
			System.out.println("共新增" + count + "筆優惠細項\n==============================");
		}

		// 來自salon_showsale.jsp的修改項目請求
		if ("/ipet-back/salonSale/editSale".equals(path)) {

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer saleId = Integer.valueOf(req.getParameter("saleId"));

			/*************************** 2.開始查詢資料 ****************************************/
			SaleService saleService = new SaleService();
			Sale sale = saleService.getOneSale(saleId);
			
			SaleDetailService saleDetailService = new SaleDetailService();
			List<SaleDetail> saleDetails = saleDetailService.selectSvcsOfSale(saleId);
			req.setAttribute("saleDetails", saleDetails);
			
			List<Service> services = new ServiceService().selectAll();

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/

			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.serializeNulls().create();
			req.setAttribute("services", gson.toJson(services));

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String param = "?saleId=" + sale.getSaleId() + 
							"&saleName=" + sale.getSaleName() + 
							"&saleContent=" + sale.getSalContent() + 
							"&saleStatus=" + sale.getSaleStatus() + 
							"&startTime=" + sdf.format(sale.getStartTime()) + 
							"&endTime=" + sdf.format(sale.getEndTime());

			req.getRequestDispatcher("/templates/backstage/salon/salon_updatesale.jsp" + param).forward(req, res);
		}

		// 來自salon_updatesale.jsp的update請求
		if ("/ipet-back/salonSale/updateSale".equals(path)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/************* 1.接收請求參數 - 輸入格式的錯誤處理 **********/
			//取得優惠ID
			Integer saleId = Integer.valueOf(req.getParameter("saleId"));
			
			// 取得優惠名稱
			String saleName = req.getParameter("saleName");
			if (saleName == null || saleName.trim().length() == 0) {
				errorMsgs.put("saleName", "請填寫優惠名稱");
			}

			// 取得優惠描述
			String saleContent = req.getParameter("saleContent").trim();

			/* =========================== 取得開始時間 ============================= */
			String startTimeStr = req.getParameter("startTime");
			if (startTimeStr == null || startTimeStr.trim().length() == 0) {
				errorMsgs.put("startTime", "請填寫優惠時間");
			}
			Date startDate = null;
			try {
				startDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(startTimeStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Timestamp startTime = new Timestamp(startDate.getTime());

			/* =========================== 取得結束時間 ============================= */
			String endTimeStr = req.getParameter("endTime");
			if (endTimeStr == null || endTimeStr.trim().length() == 0) {
				errorMsgs.put("endTime", "請填寫優惠時間");
			}
			Date endDate = null;
			try {
				endDate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(endTimeStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Timestamp endTime = new Timestamp(endDate.getTime());

			/* =========================== 處理字串 to 服務ID與優惠價格 ============================= */

			String svcAndSalePrice = req.getParameter("svcAndSalePrice");
			JsonArray jsonArray = null;

			try {
				Gson gson = new Gson();
				jsonArray = gson.fromJson(svcAndSalePrice, JsonArray.class);
				for (JsonElement element : jsonArray) {
					JsonObject obj = element.getAsJsonObject();
					obj.get("svcId").getAsInt();
					obj.get("salePrice").getAsInt();
				}
			} catch (Exception e) {
				errorMsgs.put("typeAndPrice", "請輸入正確服務與價格");
			}

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				res.getWriter().print(new Gson().toJson(errorMsgs));
				return; // 程式中斷
			}

			/********************* 2.開始修改資料 ************************/
			
			// 修改優惠詳情
			Gson gson = new Gson();
			jsonArray = gson.fromJson(svcAndSalePrice, JsonArray.class);
			SaleDetailService saleDetailService = new SaleDetailService();
			int svcId;
			int salePrice;

			int count = 0;

			for (JsonElement element : jsonArray) {
				JsonObject obj = element.getAsJsonObject();
				svcId = obj.get("svcId").getAsInt();
				salePrice = obj.get("salePrice").getAsInt();
				saleDetailService.addOrUpdateSaleDetail(saleId, svcId, salePrice);

				System.out.println("修改/新增一筆優惠細項，優惠ID(saleId)：" + saleId + "，服務ID(svcId)：" + svcId);
				count++;
			}
			System.out.println("共修改/新增" + count + "筆優惠細項\n==============================");
			
			// 修改優惠
			SaleService saleService = new SaleService();
			saleService.updateSale(saleId, saleName, saleContent, startTime, endTime);
			System.out.println("修改一筆優惠，優惠ID(saleId)：" + saleId);
			
		}

		if ("/ipet-back/salonSale/deleteSale".equals(path)) {
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.serializeNulls().setDateFormat("yyyy / MM / dd-HH : mm : ss").create();

			/*************************** 1.接收請求參數 ***************************************/
			Integer saleId = Integer.valueOf(req.getParameter("saleId"));

			/*************************** 2.開始刪除資料 ***************************************/

			// 刪除優惠細項
			SaleDetailService saleDetailService = new SaleDetailService();
			saleDetailService.deleteBySaleId(saleId);

			// 刪除優惠
			SaleService saleService = new SaleService();
			saleService.deleteSale(saleId);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/templates/backstage/salon/salon_showsale.jsp";
			List<Sale> sales = saleService.selectAll();
			req.setAttribute("sales", gson.toJson(sales));
			req.getRequestDispatcher(url).forward(req, res);// 刪除成功後,轉交回送出刪除的來源網頁
		}
	}
	// 限制更動的開始時間只能比現在時間晚，否則更新失敗

	// 限制更動的結束時間只能比開始時間晚，否則更新失敗

}
