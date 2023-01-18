package com.web.productImg.model.dao.imp;

import java.util.List;

import com.web.productImg.model.dao.ProductImgDAO;
import com.web.productImg.model.entity.ProductImg;

public class ProductImgDAOImp implements ProductImgDAO{

	@Override
	public List<ProductImg> getAll() {
		String hql = "From ProductImg";
		return getSession().createQuery(hql, ProductImg.class).list();
	}

	@Override
	public ProductImg getById(Integer id) {
		return getSession().get(ProductImg.class, id);
	}

	@Override
	public Integer add(ProductImg productImg) {
		getSession().persist(productImg);
		return 1;
	}
}
