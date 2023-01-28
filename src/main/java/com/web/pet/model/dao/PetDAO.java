package com.web.pet.model.dao;

import java.util.*;

import com.core.model.dao.CoreDAO;
import com.web.pet.model.entity.Pet;

public interface PetDAO extends CoreDAO<Pet,Integer> {

	public Pet update(Pet Pet);
	public List<Pet> getAll();
	public List<Pet> getByMemId(int memId);
}
