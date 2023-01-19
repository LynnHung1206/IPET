package com.web.salonSale.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/ipet-back/salonSale/addSale", "/ipet-back/salonSale/allSale", 
	"/ipet-back/salonSale/editSale", "/ipet-back/salonSale/updateSale", "/ipet-back/salonSale/deleteSale"})
public class SaleServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if("/ipet-back/salonSale/addSale".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/salon/salon_addsale.jsp").forward(req, res);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		
		if("/ipet-back/salonSale/addSale".equals(path)) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
				/*************1.接收請求參數 - 輸入格式的錯誤處理**********/
		}
	}
	//限制更動的開始時間只能比現在時間晚，否則更新失敗
	
	//限制更動的結束時間只能比開始時間晚，否則更新失敗
}
