package com.web.salonSale.model.services;

import java.sql.Timestamp;
import java.util.List;
import com.web.salonSale.model.dao.SaleDAO;
import com.web.salonSale.model.dao.SaleDetailDAO;
import com.web.salonSale.model.dao.impl.SaleDAOImpl;
import com.web.salonSale.model.dao.impl.SaleDetailDAOImpl;
import com.web.salonSale.model.entities.Sale;

public class SaleService {
	private SaleDAO saleDAO;
	private SaleDetailDAO saleDetailDAO;
	
	public SaleService() {
		saleDAO = new SaleDAOImpl();
		saleDetailDAO = new SaleDetailDAOImpl();
	}
	
	public Sale addSale(String saleName, String salContent, 
			Timestamp startTime, Timestamp endTime) {
		Sale sale = new Sale();
		
		sale.setSaleName(saleName);
		sale.setSalContent(salContent);
		sale.setStartTime(startTime);
		sale.setEndTime(endTime);
		saleDAO.add(sale);
		
		return sale;
	}
	
	public Sale updateSale(Integer saleId, String saleName, String salContent, 
			Timestamp startTime, Timestamp endTime) {
		
		Sale sale = new Sale();
		sale.setSaleId(saleId);
		sale.setSaleName(saleName);
		sale.setSalContent(salContent);
		sale.setStartTime(startTime);
		sale.setEndTime(endTime);
		
		Long now = System.currentTimeMillis();
		Sale oldSale = saleDAO.getById(saleId);
		Timestamp oldEndTime = oldSale.getEndTime();
		Timestamp oldStartTime = oldSale.getStartTime();
		
		//判斷此優惠若已經結束，則不可更改
		if (oldEndTime.getTime() < now) {
			sale.setSuccessful(false);
			sale.setMessage("此優惠已經結束，不可更改！");
			return sale;
		}
		
		//判斷此優惠若已經開始，則不可更改開始時間
		if(oldStartTime.getTime() < now) {
			if (oldStartTime != startTime) {
				sale.setSuccessful(false);
				sale.setMessage("此優惠已經開始，不可更改開始時間！");
				return sale;
			}
		}
		
		//開始更改
		saleDAO.add(sale);
		return sale;
	}
	
	public Sale deleteSale(Integer saleId) {
		Sale sale = saleDAO.getById(saleId);
		
		//判斷此優惠若未開始則可以刪除
		List<Sale> list = saleDAO.findNotYetStartSale();
		for(Sale notYetStartSale : list) {
			if(notYetStartSale.getSaleId() == saleId) {
				//刪除優惠細項
				saleDetailDAO.deleteBySaleId(saleId);
				//刪除優惠
				saleDAO.deleteById(saleId);
				return sale;
			}
		}
		//判斷此優惠若已經開始或結束，則不可刪除
		sale.setSuccessful(false);
		sale.setMessage("優惠已經開始或結束，不可刪除！");
		return sale;
	}
	
	public Sale getOneSale(Integer saleId) {
		return saleDAO.getById(saleId);
	}
	
	public List<Sale> selectAll(){
		return saleDAO.getAll();
	}
	
	public List<Sale> findNotYetStartSale(){
		return saleDAO.findNotYetStartSale();
	}
	
	public List<Sale> findOnSale(){
		return saleDAO.findOnSale();
	}
	
	public List<Sale> findEndedSale(){
		return saleDAO.findEndedSale();
	}
}
