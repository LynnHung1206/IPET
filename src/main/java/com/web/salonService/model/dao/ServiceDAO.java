package com.web.salonService.model.dao;

import java.util.List;
import java.util.Map;

import com.core.model.dao.CoreDAO;
import com.web.salonService.model.entities.Service;

public interface ServiceDAO extends CoreDAO<Service, Integer>{

	Integer deleteById(Integer svcId);
	
	Integer[] addBatch(Service[] svcIds);

	List<Service> getAllIf(Map<String, String[]> map);
	
	List<Service> findSvcByCatId(Integer catId);
}
