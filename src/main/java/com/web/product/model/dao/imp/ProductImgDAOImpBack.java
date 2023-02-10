package com.web.product.model.dao.imp;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;

import com.core.util.HibernateUtil;
import com.web.product.model.dao.ProductImgDAO;
import com.web.product.model.entity.ProductImg;
import com.web.product.model.entity.ProductType;

public class ProductImgDAOImpBack implements ProductImgDAO {

	@Override
	public List<ProductImg> getAll() {
		Session session = getSession();
		String hql = "FROM ProductImg";
		return session.createQuery(hql, ProductImg.class).list();
	}

	@Override
	public ProductImg getById(Integer ID) {
		Session session = getSession();
		return session.get(ProductImg.class, ID);
	}

	@Override
	public Integer add(ProductImg productImg) {
		Session session = getSession();
		session.persist(productImg);
		return productImg.getImgID();
	}

	@Override
	public void insert(ProductImg prod_IMGVO) {
		Session session = getSession();
		session.save(prod_IMGVO);

	}

	@Override
	public void update(ProductImg prod_IMGVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public ProductImg findByProdID(Integer prodID) {
		Session session = getSession();

		NativeQuery<ProductImg> query = session.createNativeQuery("select * from product_img where prod_id = :prodID",
				ProductImg.class);
		query.setParameter("prodID", prodID);

		return (ProductImg) query.uniqueResult();

	}

	@Override
	public void insert2(ProductImg prod_IMGVO, Connection conn) {

	}

	@Override
	public void delete(Integer prodid) {
		Session session = getSession();
		ProductImg productImg = new ProductImg();
		productImg.setProdID(prodid);
		session.delete(prodid);
	}

	public static void main(String[] args) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		ProductImg productImg = new ProductImg();
		byte by[] = { 1, 2, 3 };
		productImg.setImgFile(by);
		productImg.setProdID(41);

		session.save(productImg);
	}

	@Override
	public ProductImg getByProdID(Integer prodID) {
		// TODO Auto-generated method stub
		return null;
	}

}
