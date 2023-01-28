package com.web.pet.model.dao;

import java.util.*;

import org.hibernate.Session;
import com.web.pet.model.entity.Pet;


public class PetDAOImpl implements PetDAO {


	@Override
	public Pet update(Pet pet) {
		Session session = getSession();
		Pet oldpetVO = session.get(Pet.class, pet.getPetId());
		oldpetVO.setPetName(pet.getPetName());
		oldpetVO.setPetVarId(pet.getPetVarId());
		oldpetVO.setPetSize(pet.getPetSize());
		oldpetVO.setPetGen(pet.getPetGen());
		oldpetVO.setPetBirth(pet.getPetBirth());
		oldpetVO.setPetStatus(pet.getPetStatus());
		return pet;
	}

	@Override
	public List<Pet> getAll() {
		Session session = getSession();
        String hql = "FROM Pet";
        return session.createQuery(hql, Pet.class).list();
	}
		
	@Override
	public Pet getById(Integer petId) {
		 Session session = getSession();
	        return session.get(Pet.class, petId);
	}
	

	@Override
	public Integer add(Pet pet) {
		Session session = getSession();
		session.persist(pet);
		return pet.getPetId();
	}

	public List<Pet> getPetBySize(String petSize) {
		Session session = getSession();
		String hql = "FROM Pet WHERE petSize = :petSize";
		
		return  session.createQuery(hql,Pet.class)
				.setParameter("petSize",petSize).list();
	}

	@Override
	public List<Pet> getByMemId(int memId) {
		Session session = getSession();
		String hql = "FROM Pet WHERE memId = :memId"; 
		return session.createQuery(hql,Pet.class)
				.setParameter("memId",memId).list();
	}
}
