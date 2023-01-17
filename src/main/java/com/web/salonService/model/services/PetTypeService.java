package com.web.salonService.model.services;

import java.util.List;
import com.web.salonService.model.dao.PetTypeDAO;
import com.web.salonService.model.dao.impl.PetTypeDAOImpl;
import com.web.salonService.model.entities.PetType;

public class PetTypeService {
	private PetTypeDAO dao;
	
	public PetTypeService() {
		dao = new PetTypeDAOImpl();
	}
	
	public PetType addPetType(String typeName, String petSize) {
		
		PetType petType = new PetType();
		
		petType.setTypeName(typeName);
		petType.setPetSize(petSize);
		dao.add(petType);
		
		return petType;
	}
	
	public PetType updatePetType(Integer typeId, String typeName, String petSize) {
		PetType petType = new PetType();
		
		petType.setTypeId(typeId);
		petType.setTypeName(typeName);
		petType.setPetSize(petSize);
		dao.add(petType);
		
		return dao.getById(typeId);
	}
	
	public PetType deletePetType(Integer typeId) {
		dao.deleteById(typeId);
		return dao.getById(typeId);
	}
	
	public PetType getOnPetType(Integer typeId) {
		return dao.getById(typeId);
	}
	
	public List<PetType> selectAll(){
		return dao.getAll();
	}
}
