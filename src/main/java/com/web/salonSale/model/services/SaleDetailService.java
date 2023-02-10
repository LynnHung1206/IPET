package com.web.salonSale.model.services;

import java.util.ArrayList;
import java.util.List;

import com.web.salonSale.model.dao.SaleDAO;
import com.web.salonSale.model.dao.SaleDetailDAO;
import com.web.salonSale.model.dao.impl.SaleDAOImpl;
import com.web.salonSale.model.dao.impl.SaleDetailDAOImpl;
import com.web.salonSale.model.entities.Sale;
import com.web.salonSale.model.entities.SaleDetail;
import com.web.salonService.model.dao.ServiceDAO;
import com.web.salonService.model.dao.impl.ServiceDAOImpl;
import com.web.salonService.model.entities.Service;
import com.web.salonService.model.services.ServiceService;

public class SaleDetailService {
	private SaleDetailDAO dao;
	private ServiceDAO serviceDAO;
	private SaleDAO saleDAO;
	
	public SaleDetailService() {
		dao = new SaleDetailDAOImpl();
		serviceDAO = new ServiceDAOImpl();
		saleDAO = new SaleDAOImpl();
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
	
	public Integer deleteBySaleId(Integer saleId) {
		return dao.deleteBySaleId(saleId);
	}
	
	public SaleDetail getOneSaleDetail(SaleDetail.PK pk) {
		List<SaleDetail> saleDetails = new ArrayList<>();
		saleDetails.add(dao.getById(pk));
		return enterInformations(saleDetails).get(0);
	}
	
	public List<SaleDetail> selectAll(){
		List<SaleDetail> saleDetails = dao.getAll();
		return enterInformations(saleDetails);
	}
	
	public List<SaleDetail> selectSvcsOfSale(Integer saleId){
		List<SaleDetail> saleDetails = dao.findSvcsById(saleId);
		return enterInformations(saleDetails);
	}
	
	private List<SaleDetail> enterInformations(List<SaleDetail> saleDetails){
		for (SaleDetail saleDetail : saleDetails) {
			
			Service service = serviceDAO.getById(saleDetail.getSvcId());
			
			saleDetail.setSvcName(service.getSvcName());
			saleDetail.setCatName(service.getCategoryVO().getCatName());
			saleDetail.setTypeName(service.getPetTypeVO().getTypeName());
			saleDetail.setSvcPrice(service.getSvcPrice());
			saleDetail.setSaleStatus(saleDAO.getById(saleDetail.getSaleId()).getSaleStatus());
		}
		return saleDetails;
	}
	
}
