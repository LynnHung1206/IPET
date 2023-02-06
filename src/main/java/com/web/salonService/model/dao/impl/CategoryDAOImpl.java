package com.web.salonService.model.dao.impl;

import java.util.List;

import com.web.salonService.model.dao.CategoryDAO;
import com.web.salonService.model.entities.Category;

public class CategoryDAOImpl implements CategoryDAO {

	@Override
	public Integer add(Category category) {
		getSession().merge(category);
		return category.getCatId();
	}

	@Override
	public Integer deleteById(Integer catId) {
		Category category = new Category();
		category.setCatId(catId);
		
		getSession().remove(category);
		return catId;
	}

	@Override
	public Category getById(Integer catId) {
		return getSession().get(Category.class, catId);
	}

	@Override
	public List<Category> getAll() {
		final String hql = "FROM Category ORDER BY catId";
		return getSession().createQuery(hql, Category.class).list();
	}

}

