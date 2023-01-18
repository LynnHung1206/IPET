package com.web.product.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.product.model.entity.Product;

public interface ProductDAO extends CoreDAO<Product, Integer>{

	List<Product> selectByProdType(Integer ProdType);
	
	List<Product> selectByKeyword(String Keyword);
	
}
