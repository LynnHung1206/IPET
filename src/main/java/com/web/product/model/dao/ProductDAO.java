package com.web.product.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.product.model.entity.Product;
import com.web.product.model.entity.ProductImg;

public interface ProductDAO extends CoreDAO<Product, Integer>{
	@Override
	public List<Product> getAll();
	
	@Override
	public Product getById(Integer ID);
	
	@Override
	public Integer add(Product product);
	
	public void update(Product product);
	
	public void delete(Integer prodID);
	
	//同時新增圖片ID與商品 (實務上並不常用, 但,可用在訂單主檔與明細檔一次新增成功)
    public void insertWithProd_IMG(Product product , List<ProductImg> list);
    
    public void updateWithProd_IMG(Product product , ProductImg productImgs);
}
