package com.web.salonService.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.salonService.model.entities.PetType;
import com.web.salonService.model.entities.Service;

public interface PetTypeDAO extends CoreDAO<PetType, Integer>{

	Integer deleteById(Integer typeId);

	//以寵物品種查詢服務
	List<Service> findSvcByTypeId(Integer typeId);
	
	//以寵物體型查詢
	List<PetType> findByPetSize(String petSize);
	
}
