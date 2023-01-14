package com.web.salonSale.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.salonSale.model.entities.SaleDetail;

public interface SaleDetailDAO extends CoreDAO<SaleDetail, SaleDetail.PK>{
	
	//大量新增
	SaleDetail.PK[] addBatch(SaleDetail[] saleDetails);
	
	//刪除整筆優惠用
	Integer deleteBySaleId(Integer saleId);
	
	//刪除某優惠的某服務
	SaleDetail.PK deleteOneSvc(SaleDetail.PK pk);
	
	//查詢某優惠的所有服務
	List<SaleDetail> findSvcsById(Integer saleId);
	
}
