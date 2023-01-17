package com.web.product.model.dao.imp;

import java.util.List;

import com.web.product.model.dao.ProductDAO;
import com.web.product.model.entity.Product;

public class ProductDAOImp implements ProductDAO{

	@Override
	public List<Product> getAll() {
		
		final String hql = "From Product";
		return getSession().createQuery(hql, Product.class).list();
	}

	@Override
	public Product getById(Integer id) {
		return getSession().get(Product.class, id);
	}

	@Override
	public Integer add(Product product) {
		getSession().persist(product);
		return 1;
	}

	@Override
	public List<Product> selectByProdType(Integer ProdType) {
		final String hql = "From Product Where typeID = :ProdType";		
		return getSession().createQuery(hql, Product.class).setParameter("ProdType", ProdType).list();
	}

	@Override
	public List<Product> selectByKeyword(String Keyword) {
		final String hql = "From Product Where prodName = :Keyword";
		return getSession().createQuery(hql, Product.class).setParameter("Keyword", "%" + Keyword + "%").list();
	}
}
