package com.web.salonService.model.services;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
		Service service = dao.getById(svcId);
		service.setCatName(service.getCategoryVO().getCatName());
		service.setTypeName(service.getPetTypeVO().getTypeName());
		
		Integer svcStatus = service.getSvcStatus();
		String svcStatusName = "";
		if(svcStatus == 0) {
			svcStatusName = "上架中";
		}else if(svcStatus == 1){
			svcStatusName = "未上架";
		}
		service.setSvcStatusName(svcStatusName);
		
		return service;
	}
	
	public List<Service> selectAll() {
		List<Service> list = dao.getAll();
		List<Service> services = new ArrayList<>();
		for(Service service : list) {
			service.setCatName(service.getCategoryVO().getCatName());
			service.setTypeName(service.getPetTypeVO().getTypeName());
			
			Integer svcStatus = service.getSvcStatus();
			String svcStatusName = "";
			if(svcStatus == 0) {
				svcStatusName = "上架中";
			}else if(svcStatus == 1){
				svcStatusName = "未上架";
			}
			service.setSvcStatusName(svcStatusName);
			
			services.add(service);
		}
		return services;
	}
	
	public List<Service> findIfService(Map<String, String[]> map){
		List<Service> list = dao.getAllIf(map);
		List<Service> services = new ArrayList<>();
		for(Service service : list) {
			service.setCatName(service.getCategoryVO().getCatName());
			service.setTypeName(service.getPetTypeVO().getTypeName());
			
			Integer svcStatus = service.getSvcStatus();
			String svcStatusName = "";
			if(svcStatus == 0) {
				svcStatusName = "上架中";
			}else if(svcStatus == 1){
				svcStatusName = "未上架";
			}
			service.setSvcStatusName(svcStatusName);
			
			services.add(service);
		}
		return services;
	}
}
