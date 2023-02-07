package com.web.product.model.dao.imp;

import java.sql.Connection;
import java.util.List;

import com.web.product.model.dao.ProductImgDAO;
import com.web.product.model.entity.ProductImg;

public class ProductImgDAOImp implements ProductImgDAO{

	@Override
	public List<ProductImg> getAll() {
		
		return null;
	}

	@Override
	public ProductImg getById(Integer id) {
		
		return null;
	}

	@Override
	public Integer add(ProductImg t) {
		
		return null;
	}
	
	@Override
	public ProductImg getByProdID(Integer prodID) {
		final String hql = "From ProductImg where prodID = :prodID";
		return getSession().createQuery(hql, ProductImg.class).setParameter("prodID", prodID).uniqueResult();
	}

	@Override
	public void insert(ProductImg prod_IMGVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ProductImg prod_IMGVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ProductImg findByProdID(Integer prodID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert2(ProductImg prod_IMGVO, Connection conn) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer prodid) {
		// TODO Auto-generated method stub
		
	}
}
