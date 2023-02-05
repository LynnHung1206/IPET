package com.web.salonSale.model.services;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.web.salonSale.model.dao.SaleDAO;
import com.web.salonSale.model.dao.SaleDetailDAO;
import com.web.salonSale.model.dao.impl.SaleDAOImpl;
import com.web.salonSale.model.dao.impl.SaleDetailDAOImpl;
import com.web.salonSale.model.entities.Sale;
import com.web.salonSale.model.entities.SaleDetail;

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
		List<Sale> sales = new ArrayList<Sale>();
		sales.add(saleDAO.getById(saleId));
		return enterInformations(sales).get(0);
	}
	
	public List<Sale> selectAll(){
		List<Sale> sales = saleDAO.getAll();
		return enterInformations(sales);
	}
	
	public List<Sale> findNotYetStartSale(){
		List<Sale> sales = saleDAO.findNotYetStartSale();
		return enterInformations(sales);
	}
	
	public List<Sale> findOnSale(){
		List<Sale> sales = saleDAO.findOnSale();
		return enterInformations(sales);
	}
	
	public List<Sale> findEndedSale(){
		List<Sale> sales = saleDAO.findEndedSale();
		return enterInformations(sales);
	}
	
	private List<Sale> enterInformations(List<Sale> sales){
		for (Sale sale : sales) {
			
			//優惠狀態
			long now = System.currentTimeMillis();
			long startTime = sale.getStartTime().getTime();
			long endTime = sale.getEndTime().getTime();
			if(endTime < now) {
				sale.setSaleStatus("已結束");
			}else if (startTime <= now && endTime >= now) {
				sale.setSaleStatus("優惠中");
			}else if (startTime > now) {
				sale.setSaleStatus("未開始");
			}
			
			//優惠詳情
			List<SaleDetail> saleDetails = saleDetailDAO.findSvcsById(sale.getSaleId());
			sale.setSaleDetails(saleDetails.toArray(SaleDetail[]::new));
		}
		return sales;
	}
}
