package com.web.product.model.service;

import com.web.product.model.dao.ProductImgDAO;
import com.web.product.model.dao.imp.ProductImgDAOImpBack;
import com.web.product.model.entity.ProductImg;

public class ProductImgServiceBack {
	
	private ProductImgDAO dao;
	
	public ProductImgServiceBack() {
		dao = new ProductImgDAOImpBack();
	}
	
	public ProductImg getOneProdID(Integer prodID) {
		return dao.getById(prodID);
	}
	
	public ProductImg insertImg ( Integer prodID , byte[] imgFile) {
		ProductImg productImg = new ProductImg();
		
		productImg.setImgFile(imgFile);
		productImg.setImgID(prodID);
		dao.add(productImg);
		
		return productImg;
	}
}
