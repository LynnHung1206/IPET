package com.web.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.web.product.model.dao.ProductDAO;
import com.web.product.model.dao.ProductImgDAO;
import com.web.product.model.dao.imp.ProductDAOImpBack;
import com.web.product.model.dao.imp.ProductImgDAOImpBack;
import com.web.product.model.entity.Product;
import com.web.product.model.entity.ProductImg;

public class ProductServiceBack {
	private ProductDAO dao;
	private ProductImgDAO dao1;

	public ProductServiceBack() {
		dao = new ProductDAOImpBack();
		dao1 = new ProductImgDAOImpBack();
	}

	public Product getOneProd(Integer prodid) {
		return dao.getById(prodid);
	}
	public ProductImg getOneProdIMG(Integer prodid) {
		return dao1.findByProdID(prodid);
	}

	public List<Product> getAll() {
		return dao.getAll();
	}

	public Product addProd(String prodname, Integer price, String prodDescription, Integer typeID, byte[] imgFile) {

		Product product = new Product();

		product.setProdName(prodname);
		product.setProdPrice(price);
		product.setProdDescription(prodDescription);
		product.setTypeID(typeID);
		dao.add(product);
		
		ProductImg prodIMG = new ProductImg();
		prodIMG.setImgFile(imgFile);
		prodIMG.setProdID(typeID);

		return product;
	}

	public void deleteProd(Integer prodID) {
		dao.delete(prodID);
		
	}

	public Product updateProd(Integer prodID, String prodName, Integer prodPrice, String prodDescription,
			Integer prodStatus, Integer typeID,byte[] imgFile) {

		Product product = new Product();

		product.setProdID(prodID);
		product.setProdName(prodName);
		product.setProdPrice(prodPrice);
		product.setProdDescription(prodDescription);
		product.setProdStatus(prodStatus);
		product.setTypeID(typeID);
		
		ProductImg productImg = new ProductImg();
//		prodIMG.setProdID(product.getProdID());
		productImg.setImgFile(imgFile);
		
//		List<ProductImg> alist = new ArrayList<ProductImg>();
//		alist.add(prodIMG);
		
		dao.updateWithProd_IMG(product, productImg);
		return product;
	}

//	public Prod_IMGVO upload(byte[] imgFile, Integer prodID) {
//		Prod_IMGVO prod_IMGVO = new Prod_IMGVO();
//
//		prod_IMGVO.setImg_file(imgFile);
//		prod_IMGVO.setProd_id(prodID);
//		dao1.insert(prod_IMGVO);
//		return prod_IMGVO;
//	}

	public Product addProdAndFile(String prodname, Integer price, String prodDescription, Integer typeID,
			byte[] imgFile) {

		Product prodVO = new Product();
		prodVO.setProdName(prodname);
		prodVO.setProdPrice(price);
		prodVO.setProdDescription(prodDescription);
		prodVO.setTypeID(typeID);

		
		ProductImg prodIMG = new ProductImg();
		
		prodIMG.setImgFile(imgFile);
		
		List<ProductImg> alist = new ArrayList<ProductImg>();
		alist.add(prodIMG);

		dao.insertWithProd_IMG(prodVO, alist);
		return prodVO;
		
	}
}
