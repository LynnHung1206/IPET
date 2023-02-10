package com.web.salonService.model.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.web.salonSale.model.entities.Sale;
import com.web.salonSale.model.entities.SaleDetail;
import com.web.salonSale.model.services.SaleDetailService;
import com.web.salonSale.model.services.SaleService;
import com.web.salonService.model.dao.ServiceDAO;
import com.web.salonService.model.dao.impl.ServiceDAOImpl;
import com.web.salonService.model.entities.Service;

public class ServiceService {
	private ServiceDAO dao;
	
	public ServiceService() {
		dao = new ServiceDAOImpl();
	}

	public Service addService(String svcName, String svcContent, 
			byte[] svcImg, Integer catId, Integer typeId, Integer svcPrice, Integer svcStatus) {
		
		Service service = new Service();
		
		service.setSvcName(svcName);
		service.setSvcContent(svcContent);
		service.setSvcImg(svcImg);
		service.setCatId(catId);
		service.setTypeId(typeId);
		service.setSvcPrice(svcPrice);
		service.setSvcStatus(svcStatus);
		dao.add(service);
		
		return service;
	}
	
	public Integer addBatchService(Service[] services) {
		dao.addBatch(services);
		
		return services.length;
	}
	
	public Service updateService(Integer svcId, String svcName, String svcContent, 
			byte[] svcImg, Integer catId, Integer typeId, Integer svcPrice, Integer svcStatus) {
		
		Service service = new Service();
		
		service.setSvcId(svcId);
		service.setSvcName(svcName);
		service.setSvcContent(svcContent);
		service.setSvcImg(svcImg);
		service.setCatId(catId);
		service.setTypeId(typeId);
		service.setSvcPrice(svcPrice);
		service.setSvcStatus(svcStatus);
		dao.add(service);
		
		return dao.getById(svcId);
	}
	
	public Service deleteService(Integer svcId) {
		Service service =  dao.getById(svcId);
		dao.deleteById(svcId);
		return service;
	}
	
	public Service getOneService(Integer svcId) {
		List<Service> services = new ArrayList<Service>();
		services.add(dao.getById(svcId));
		return enterInformation(services).get(0);
	}
	
	public List<Service> finSvcByCatId(Integer catId){
		List<Service> services = dao.findSvcByCatId(catId);
		return enterInformation(services);
	}
	
	public List<Service> selectAll() {
		List<Service> services = dao.getAll();
		return enterInformation(services);
	}
	
	public List<Service> findIfService(Map<String, String[]> map){
		List<Service> services = dao.getAllIf(map);
		return enterInformation(services);
	}
	
	
	private List<Service> enterInformation(List<Service> services) {
		
		a:
		for (Service service : services) {
			Integer svdId = service.getSvcId();
			
			service.setCatName(service.getCategoryVO().getCatName());
			service.setTypeName(service.getPetTypeVO().getTypeName());			service.setPetSize(service.getPetTypeVO().getPetSize());
			
			Integer svcStatus = service.getSvcStatus();
			String svcStatusName = "";
			if(svcStatus == 0) {
				svcStatusName = "上架中";
			}else if(svcStatus == 1){
				svcStatusName = "未上架";
			}
			service.setSvcStatusName(svcStatusName);
			
			//將優惠價格設為服務價格
			service.setSalePrice(service.getSvcPrice());
			service.setSaleName("");
			
			//新增優惠價格
			List<SaleDetail> SvcOnSale =  SvcIsOnSale();
			for(SaleDetail saleDetail : SvcOnSale) {
				//若正在優惠中，儲存優惠價格
				if(saleDetail.getSvcId() == svdId) {
					service.setSalePrice(saleDetail.getSalePrice());
					service.setSaleId(saleDetail.getSaleId());
					service.setSaleName(new SaleService().getOneSale(saleDetail.getSaleId()).getSaleName());
				}
			}
			
			//查詢是否有在優惠細項中
			List<SaleDetail> saleDetails = new SaleDetailService().selectAll();
			for(SaleDetail saleDetail : saleDetails) {
				if(saleDetail.getSvcId() == svdId) {
					service.setHasDetail(true);
					continue a;
				}
			}
			service.setHasDetail(false);
			
		}
		return services;
	}
	
	private List<SaleDetail> SvcIsOnSale(){
		SaleService saleService = new SaleService();
		SaleDetailService saleDetailService = new SaleDetailService();
		//儲存結果的List
		List<SaleDetail> allSaleDetails = new ArrayList<SaleDetail>();
		
		//取得優惠中的優惠List
		List<Sale> salesOnSale = saleService.findOnSale();
		
		//取得每項優惠的細項List
		for(Sale sale : salesOnSale) {
			List<SaleDetail> saleDetails = saleDetailService.selectSvcsOfSale(sale.getSaleId());
			
			//將優惠細項存入"儲存結果的List"
			for(SaleDetail saleDetail : saleDetails) {
				allSaleDetails.add(saleDetail);
			}
		}
		return allSaleDetails;
	}
	
}
