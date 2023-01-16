package com.web.salonSale.model.services;

import java.sql.Timestamp;

import com.web.salonSale.model.dao.SaleDAO;
import com.web.salonSale.model.dao.impl.SaleDAOImpl;
import com.web.salonSale.model.entities.Sale;

public class SaleService {
	private SaleDAO dao;
	
	public SaleService() {
		dao = new SaleDAOImpl();
	}
	
	public Sale addSale(String saleName, String salContent, 
			Timestamp startTime, Timestamp endTime) {
		Sale sale = new Sale();
		
		sale.setSaleName(saleName);
		sale.setSalContent(salContent);
		sale.setStartTime(startTime);
		sale.setEndTime(endTime);
		dao.add(sale);
		
		return sale;
	}
	
	public Sale updateSale(Integer saleId, String saleName, String salContent, 
			Timestamp startTime, Timestamp endTime) {
		Sale sale = new Sale();
		
		sale.setSaleName(saleName);
		sale.setSalContent(salContent);
		sale.setStartTime(startTime);
		sale.setEndTime(endTime);
		dao.add(sale);
		
		return sale;
	}
}
