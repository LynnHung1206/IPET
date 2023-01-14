package com.web.salonSale.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.salonSale.model.entities.Sale;

public interface SaleDAO extends CoreDAO<Sale, Integer>{
	
	Integer deleteById(Integer saleId);
	
	//查詢尚未開始的優惠
	List<Sale> findNotYetStartSale();
	
	//查詢進行中優惠
	List<Sale> findOnSale();
	
	//查詢已結束優惠
	List<Sale> findEndedSale();
}
