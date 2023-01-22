package com.web.product.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.product.model.entity.ProductImg;

public interface ProductImgDAO extends CoreDAO<ProductImg, Integer> {
	public void insert(ProductImg prod_IMGVO);

	public void update(ProductImg prod_IMGVO);

	public ProductImg findByProdID(Integer prodID);

	public List<ProductImg> getAll();

	ProductImg getByProdID(Integer prodID);

	public void insert2(ProductImg prod_IMGVO, java.sql.Connection conn);

public void delete(Integer prodid);
	// 同時新增商品與圖片 (實務上並不常用, 但,可用在訂單主檔與明細檔一次新增成功)

	
}
