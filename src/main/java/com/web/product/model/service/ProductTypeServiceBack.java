package com.web.product.model.service;

import java.util.List;

import com.web.product.model.dao.imp.ProductTypeDAOImpBack;
import com.web.product.model.entity.ProductType;

public class ProductTypeServiceBack {
	
	private ProductTypeDAOImpBack dao;
	
	public ProductTypeServiceBack() {
		dao = new ProductTypeDAOImpBack();
	}

	public List<ProductType> getAll() {
		return dao.getAll();
	}

	public ProductType getOneProdType(Integer prodTypeID) {
		return dao.getById(prodTypeID);
	}
	
}
