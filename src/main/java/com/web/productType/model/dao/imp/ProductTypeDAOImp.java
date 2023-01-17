package com.web.productType.model.dao.imp;

import java.util.List;

import com.web.productType.model.dao.ProductTypeDAO;
import com.web.productType.model.entity.ProductType;

public class ProductTypeDAOImp implements ProductTypeDAO{

	@Override
	public List<ProductType> getAll() {
		final String hql = "From ProductType";
		return getSession().createQuery(hql, ProductType.class).list();
	}

	@Override
	public ProductType getById(Integer id) {
		return getSession().get(ProductType.class, id);
	}

	@Override
	public Integer add(ProductType productType) {
		getSession().persist(productType);
		return 1;
	}
}
