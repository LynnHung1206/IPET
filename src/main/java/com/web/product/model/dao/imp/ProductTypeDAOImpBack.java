package com.web.product.model.dao.imp;

import java.util.List;
import java.util.Set;

import org.hibernate.Session;

import com.web.product.model.dao.ProductTypeDAO;
import com.web.product.model.entity.ProductType;

public class ProductTypeDAOImpBack implements ProductTypeDAO {

	@Override
	public List<ProductType> getAll() {
		Session session = getSession();
		String hql = "FROM ProductType";
		return session.createQuery(hql,ProductType.class).list();
	}

	@Override
	public ProductType getById(Integer ID) {
		Session session = getSession();
		return session.get(ProductType.class, ID);
	}

	@Override
	public Integer add(ProductType ProductType) {
		Session session = getSession();
		session.persist(ProductType);
		return ProductType.getTypeID();
	}

}
