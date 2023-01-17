package com.web.salonSale.model.services;

import java.util.List;

import com.web.salonSale.model.dao.SaleDetailDAO;
import com.web.salonSale.model.dao.impl.SaleDetailDAOImpl;
import com.web.salonSale.model.entities.SaleDetail;

public class SaleDetailService {
	private SaleDetailDAO dao;
	
	public SaleDetailService() {
		dao = new SaleDetailDAOImpl();
	}
	
	public SaleDetail addOrUpdateSaleDetail(Integer saleId, Integer svcId, Integer salePrice) {
		SaleDetail saleDetail = new SaleDetail();
		
		saleDetail.setSaleId(saleId);
		saleDetail.setSvcId(svcId);
		saleDetail.setSalePrice(salePrice);
		dao.add(saleDetail);

		return saleDetail;
	}
	
	public Integer addBatchSaleDetail(SaleDetail[] saleDetails) {
		dao.addBatch(saleDetails);
		return saleDetails.length;
	}
	
	public SaleDetail.PK deleteSaleDetail(SaleDetail.PK pk) {
		return dao.deleteOneSvc(pk);
	}
	
	public SaleDetail getOneSaleDetail(SaleDetail.PK pk) {
		return dao.getById(pk);
	}
	
	public List<SaleDetail> selectAll(){
		return dao.getAll();
	}
	
	public List<SaleDetail> selectSvcsOfSale(Integer saleId){
		return dao.findSvcsById(saleId);
	}
}
