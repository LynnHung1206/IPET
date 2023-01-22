package com.web.product.model.dao.imp;

import java.util.List;

import com.web.product.model.dao.ProductDAO;
import com.web.product.model.entity.Product;
import com.web.product.model.entity.ProductImg;

public class ProductDAOImpFront implements ProductDAO{


	@Override
	public Product getById(Integer id) {
		
		return getSession().get(Product.class, id);
	}

	@Override
	public Integer add(Product t) {
		
		return null;
	}
	
	@Override
	public List<Product> getAll() {
		final String hql = "From Product";
		return getSession().createQuery(hql, Product.class).list();
	}
	
	@Override
	public List<Product> selectByProdType(Integer prodType) {
		final String hql = "From Product Where typeID = :prodType";		
		return getSession().createQuery(hql, Product.class).setParameter("prodType", prodType).list();
	}

	@Override
	public List<Product> selectByKeyword(String keyword) {
		final String hql = "From Product Where prodName like :keyword";
		return getSession().createQuery(hql, Product.class).setParameter("keyword", "%" + keyword + "%").list();
	}

	@Override
	public void updateWithProd_IMG(Product product, ProductImg productImgs) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Product product) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer prodID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertWithProd_IMG(Product product, List<ProductImg> list) {
		// TODO Auto-generated method stub
		
	}
}
