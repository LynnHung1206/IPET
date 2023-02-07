package com.web.appoint.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
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
import com.web.appoint.model.entities.Appointment;
import com.web.appoint.model.entities.AppointmentDetail;
import com.web.appoint.model.services.AppointServices;
import com.web.appoint.model.services.imp.AppointServicesImp;
import com.web.job.model.entities.JobSchedule;
import com.web.job.model.services.imp.JobScheduleServicesImp;
import com.web.member.model.entity.Member;
import com.web.pet.model.entity.Pet;
import com.web.pet.model.service.PetService;
import com.web.salonService.model.entities.Service;
import com.web.salonService.model.services.ServiceService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@WebServlet({"/ipet-front/salon/addAppointment",
			 "/ECpay"
			})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class AppointAddController extends HttpServlet{
	
	public static AllInOne domain;
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
        AppointServices appointDetailServices = new AppointServicesImp();
        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.serializeNulls()
                .setDateFormat("yyyy-MM-dd")
                .create();
        
        //點選"我要預約"前往處
        if ("/ipet-front/salon/addAppointment".equals(path)) {
        	Member member = (Member) req.getSession().getAttribute("member");
        	List<Pet> pets = new PetService().getPetByMemId(member.getMemId());
        	req.setAttribute("pets", pets);
        	
        	List<JobSchedule> noAppointmentSchs = new JobScheduleServicesImp().findNoAppointmentSch();
        	req.setAttribute("noApmSchs", noAppointmentSchs);
        	
        	List<Service> allservices = new ServiceService().selectAll();
        	req.setAttribute("allservices", gson.toJson(allservices));
        	
        	req.getRequestDispatcher("/templates/frontstage/salon/salon_addAppointment.jsp").forward(req, res);
        }
        
        
        if ("/ECpay".equals(path)) {
			// 檢查後台: 信用卡收單 - 交易明細 - 查詢
        	// 信用卡測試卡號 : 4311-9522-2222-2222 
        	// 安全碼 : 222
	        domain = new AllInOne("");
	        AioCheckOutOneTime obj = new AioCheckOutOneTime();

	        // MerchantTradeNo  : 必填 特店訂單編號 (不可重複，因此需要動態產生)
	        obj.setMerchantTradeNo(new String("salon" + System.currentTimeMillis()));
	        // MerchantTradeDate  : 必填 特店交易時間 yyyy/MM/dd HH:mm:ss
	        obj.setMerchantTradeDate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new java.util.Date()));
	        // TotalAmount  : 必填 交易金額
	        obj.setTotalAmount("1900");
	        // TradeDesc  : 必填 交易描述
	        obj.setTradeDesc("Thank you");
	        // ItemName  : 必填 商品名稱
	        obj.setItemName("Salon Service");
	        // ReturnURL   : 必填  我用不到所以是隨便填一個英文字
	        obj.setReturnURL("a");
	        // OrderResultURL   : 選填 消費者完成付費後。重新導向的位置
	        obj.setOrderResultURL("http://localhost:8081/CGA105G1/ipet-front/member/salonAppointment");
	        obj.setNeedExtraPaidInfo("N");


	        // 回傳form訂單 並自動將使用者導到 綠界
	        String form = domain.aioCheckOut(obj, null);
	        System.out.println(form);
	        res.setCharacterEncoding("UTF-8");
	        res.getWriter().print("<html><body>" + form + "</body></html>");
		}
        
        
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		
		if("/ipet-front/salon/addAppointment".equals(path)) {
			res.setContentType("text/text;charset=UTF-8");
			Map<String,String> errorMsgs = new HashMap<>();
			
			/*************1.接收請求參數 - 輸入格式的錯誤處理**********/
			//取得會員編號
			Member member = (Member) req.getSession().getAttribute("member");
			Integer memID = member.getMemId();
			
			//取得寵物編號
			Integer petID = null;
			try {
				petID = Integer.valueOf(req.getParameter("petID").trim());
			} catch (IllegalArgumentException e) {
				errorMsgs.put("petID","請選擇寵物名稱");
			}
			
			//取得班表編號
			Integer schID = null;
			try {
				schID = Integer.valueOf(req.getParameter("schID").trim());
			} catch (IllegalArgumentException e) {
				errorMsgs.put("schID","請選擇預約日期");
			}
			
			//取得備註
			String customerNote = req.getParameter("customerNote").trim();
			
			//取得服務編號們
			String[] svcIds = req.getParameterValues("svcId");
			if(svcIds == null) {
				errorMsgs.put("svcId","請選擇預約服務");
			}
			
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				res.getWriter().print(new Gson().toJson(errorMsgs));
				return; //程式中斷
			}
			
			/*********************2.計算總金額************************/
			ServiceService serviceService = new ServiceService();
			//準備預約細項資料
			AppointmentDetail[] apps = new AppointmentDetail[svcIds.length];
			
			Integer totalPrice = 0;
			for(int i = 0; i < svcIds.length; i++) {
				Integer svcId = Integer.valueOf(svcIds[i]);
				Service service = serviceService.getOneService(svcId);
				Integer svcPrice = service.getSvcPrice();
				
				//計算總金額
				Integer salePrice = service.getSalePrice();
				totalPrice += salePrice;
				
				if(salePrice == svcPrice) {
					salePrice = null;
				}
				
				//將金額加入預約細項
				AppointmentDetail appointmentDetail = new AppointmentDetail();
				appointmentDetail.setSvcId(svcId);
				appointmentDetail.setSaleId(service.getSaleId());
				
				appointmentDetail.setSvcPrice(svcPrice);
				appointmentDetail.setSalePrice(salePrice);
			}
			
			req.getRequestDispatcher("/ECpay").forward(req, res);
			
//			/*********************3.送至綠界金流付款************************/
//			// 檢查後台: 信用卡收單 - 交易明細 - 查詢
//        	// 信用卡測試卡號 : 4311-9522-2222-2222 
//        	// 安全碼 : 222
//	        domain = new AllInOne("");
//	        AioCheckOutOneTime obj = new AioCheckOutOneTime();
//
//	        // MerchantTradeNo  : 必填 特店訂單編號 (不可重複，因此需要動態產生)
//	        obj.setMerchantTradeNo(new String("salon" + System.currentTimeMillis()));
//	        // MerchantTradeDate  : 必填 特店交易時間 yyyy/MM/dd HH:mm:ss
//	        obj.setMerchantTradeDate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new java.util.Date()));
//	        // TotalAmount  : 必填 交易金額
//	        obj.setTotalAmount("1900");
//	        // TradeDesc  : 必填 交易描述
//	        obj.setTradeDesc("Thank you");
//	        // ItemName  : 必填 商品名稱
//	        obj.setItemName("Salon Service");
//	        // ReturnURL   : 必填  我用不到所以是隨便填一個英文字
//	        obj.setReturnURL("a");
//	        // OrderResultURL   : 選填 消費者完成付費後。重新導向的位置
//	        obj.setOrderResultURL("http://localhost:8081/CGA105G1/ipet-front/news/allNews");
//	        obj.setNeedExtraPaidInfo("N");
//
//
//	        // 回傳form訂單 並自動將使用者導到 綠界
//	        String form = domain.aioCheckOut(obj, null);
//	        System.out.println(form);
//	        res.setCharacterEncoding("UTF-8");
//	        res.getWriter().print("<html><body>" + form + "</body></html>");
			 
//			/*********************4.開始新增資料************************/
//			AppointServicesImp appointServicesImp = new AppointServicesImp();
//			Appointment appointment = new Appointment();
//			appointment.setMemID(memID);
//			appointment.setPetID(petID);
//			appointment.setSchID(schID);
//			appointment.setCustomerNote(customerNote);
//			appointment.setTotalPrice(totalPrice);
//			appointment.setAppointmentDetails(apps);
//			
//			Appointment ifError = appointServicesImp.makeAppoint(appointment);
//			if(ifError.isSuccessful() == false) {
//				errorMsgs.put("unSuccessful",ifError.getMessage());
//				res.getWriter().print(new Gson().toJson(errorMsgs));
//				return; //程式中斷
//			}
			
		}
		
//		if()
		
	}
	
}
