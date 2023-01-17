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

	int id = 0;

	public int addPet(Pet petVO) {
		id = dao.add(petVO);
		return id;
	}
	
	public Pet updatePet(Pet petVO) {
		return dao.update(petVO);
	}
	
	
	public Pet getPet(int petId) {
		Pet petVO = dao.getById(petId);
		return petVO;
	}
	
	public List<Pet> getAll() {
		return dao.getAll();
	}

	

}