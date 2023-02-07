package com.web.product.model.service.imp;

import java.util.List;

import com.web.product.model.dao.ProductDAO;
import com.web.product.model.dao.ProductImgDAO;
import com.web.product.model.dao.ProductTypeDAO;
import com.web.product.model.dao.imp.ProductDAOImpFront;
import com.web.product.model.dao.imp.ProductImgDAOImp;
import com.web.product.model.dao.imp.ProductTypeDAOImp;
import com.web.product.model.entity.Product;
import com.web.product.model.entity.ProductImg;
import com.web.product.model.entity.ProductType;
import com.web.product.model.service.ProductServiceFront;

public class ProductServiceFrontImp implements ProductServiceFront{

	private ProductDAO daoProduct;
	private ProductImgDAO daoProductImg;
	private ProductTypeDAO daoProductType;
	
	public ProductServiceFrontImp () {
		daoProduct = new ProductDAOImpFront();
		daoProductImg = new ProductImgDAOImp();
		daoProductType = new ProductTypeDAOImp();
	}
	
	public Product getSpecifiedProduct(Integer prodID) {
		return daoProduct.getById(prodID);
	}
	
	public List<Product> findAllProduct(){
		return daoProduct.getAll();
	}
	
	public List<Product> findSameCategoryProduct(Integer prodType){
		return daoProduct.selectByProdType(prodType);
	}
	
	public List<Product> findSpecifiedProduct(String keyword){
		return daoProduct.selectByKeyword(keyword);
	}
	
	public byte[] findProductImg(Integer prodID) {
		return daoProductImg.getByProdID(prodID).getImgFile();
	}
}
