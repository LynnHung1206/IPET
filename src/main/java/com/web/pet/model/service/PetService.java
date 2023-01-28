package com.web.pet.model.service;

import java.util.List;

import com.web.pet.model.dao.PetDAO;
import com.web.pet.model.dao.PetDAOImpl;
import com.web.pet.model.entity.Pet;

public class PetService {

	private PetDAO dao;
	
	public PetService() {
		dao = new PetDAOImpl();
	}

	int petId = 0;

	public int addPet(Pet petVO) {
		petId = dao.add(petVO);
		return petId;
	}
	
	public Pet updatePet(Pet petVO) {
		return dao.update(petVO);
	}
	
	
	public Pet getPet(int petId) {
		Pet petVO = dao.getById(petId);
		return petVO;
	}
	public List<Pet> getPetByMemId(int memId) {
		List<Pet> petList = dao.getByMemId(memId);
		return petList;
	}
	
	public List<Pet> getAll() {
		return dao.getAll();
	}

	

}
