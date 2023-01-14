package com.web.salonService.model.dao.impl;

import java.util.List;
import com.web.salonService.model.dao.PetTypeDAO;
import com.web.salonService.model.entities.PetType;
import com.web.salonService.model.entities.Service;

public class PetTypeDAOImpl implements PetTypeDAO{
	
	@Override
	public Integer add(PetType petType) {
		getSession().merge(petType);
		return petType.getTypeId();
	}

	@Override
	public Integer deleteById(Integer typeId) {
		PetType petType = new PetType();
		petType.setTypeId(typeId);
		
		getSession().remove(petType);
		return typeId;
	}

	@Override
	public PetType getById(Integer typeId) {
		return getSession().get(PetType.class, typeId);
	}

	@Override
	public List<PetType> getAll() {
		final String hql = "FROM PetType ORDER BY typeId";
		return getSession().createQuery(hql, PetType.class).list();
	}

	@Override
	public List<Service> findSvcByTypeId(Integer typeId) {
		final String hql = "FROM Service WHERE typeId = :typeId ORDER BY svcId";
		return getSession().createQuery(hql, Service.class)
				.setParameter("typeId", typeId)
				.list();
	}

	@Override
	public List<PetType> findByPetSize(String petSize) {
		final String hql = "FROM PetType WHERE petSize = :petSize ORDER BY typeId";
		return getSession().createQuery(hql, PetType.class)
				.setParameter("petSize", petSize)
				.list();
	}

}
