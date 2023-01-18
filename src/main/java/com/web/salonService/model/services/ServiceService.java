package com.web.salonService.model.services;

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
		return dao.getById(svcId);
	}
	
	public List<Service> selectAll() {
		return dao.getAll();
	}
	
	public List<Service> findIfService(Map<String, String[]> map){
		return dao.getAllIf(map);
	}
}
