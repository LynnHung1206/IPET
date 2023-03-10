package com.web.product.model.dao.imp;

import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.core.util.HibernateUtil;
import com.web.product.model.dao.ProductDAO;
import com.web.product.model.entity.Product;
import com.web.product.model.entity.ProductImg;

public class ProductDAOImpBack implements ProductDAO {
	@Override
	public List<Product> getAll() {
		Session session = getSession();
		String hql = "from Product p order by prodID";
		return session.createQuery(hql, Product.class).list();

	}

	@Override
	public Product getById(Integer ID) {
		Session session = getSession();
		return session.get(Product.class, ID);
	}

	@Override
	public void insertWithProd_IMG(Product product, List<ProductImg> list) {
		Session session = getSession();
		session.save(product);
		for(ProductImg alist : list) {
			alist.setProdID(product.getProdID());
			session.saveOrUpdate(alist);
		}
		
	}

	@Override
	public Integer add(Product product) {
		Session session = getSession();
		session.saveOrUpdate(product);
		return product.getProdID();
	}

	public void update(Product product) {

		Session session = getSession();

		String sql = "update Product p set p.prod_name = ?, p.prod_price = ?, p.prod_description = ?, "
				+ "p.prod_status = ?, p.type_id = ? where p.prod_id = ?";
		Query query = session.createNativeQuery(sql);
		query.setParameter(1, product.getProdName());
		query.setParameter(2, product.getProdPrice());
		query.setParameter(3, product.getProdDescription());
		query.setParameter(4, product.getProdStatus());
		query.setParameter(5, product.getTypeID());
		query.setParameter(6, product.getProdID());
		query.executeUpdate();

	}
	
	@Override
	public void updateWithProd_IMG(Product product, ProductImg productImgs) {
		Session session = getSession();

		String sql = "update Product p set p.prod_name = ?, p.prod_price = ?, p.prod_description = ?, "
				+ "p.prod_status = ?, p.type_id = ? where p.prod_id = ?";
		Query query = session.createNativeQuery(sql);
		query.setParameter(1, product.getProdName());
		query.setParameter(2, product.getProdPrice());
		query.setParameter(3, product.getProdDescription());
		query.setParameter(4, product.getProdStatus());
		query.setParameter(5, product.getTypeID());
		query.setParameter(6, product.getProdID());
		query.executeUpdate();
		
		String sql2 = "update product_img set img_file= ? where prod_id = ?";
		Query query2 = session.createNativeQuery(sql2);
		query2.setParameter(1, productImgs.getImgFile());
		query2.setParameter(2, product.getProdID());
		query2.executeUpdate();
	}

	public void delete(Integer prodID) {
		Session session = getSession();
		Query query=session.createSQLQuery("delete from product_img where Prod_ID = ?");
		query.setParameter(1, prodID);
		query.executeUpdate();
		
		Query query2=session.createSQLQuery("delete from product where Prod_ID = ?");
		query2.setParameter(1, prodID);
		query2.executeUpdate();


	}

	public static void main(String[] args) {

		Session session = HibernateUtil.getSessionFactory().openSession();

		// ????????????
//		Product product = session.get(Product.class, 1);
//		System.out.println(product.getProdID());
//		System.out.println(product.getProdName());
//		System.out.println(product.getProdDescription());
//		System.out.println(product.getProdPrice());
//		System.out.println(product.getAddedTime());
//		System.out.println(product.getProdStatus());
//		session.close(); 

//		ProductDAOImpBack p = new ProductDAOImpBack();

		// ??????????????????
//		List<Product> list = null;
//		Query query = session.createQuery("from Product p order by prodID",Product.class);
//		list = query.getResultList();
//		
//		for(Product alist : list) {
//			System.out.println(alist.getProdName());
//		}

		// ????????????
//		Product product1 = new Product();
//		product1.setProdName("123");
//		product1.setProdPrice(100);
//		product1.setProdDescription("?????????");
//		product1.setTypeID(1);
//
//		session.saveOrUpdate(product1);
//		session.close(); 

		// ????????????

//		session.beginTransaction();
//		String sql = "update Product p set p.prod_name = ?, p.prod_price = ?, p.prod_description = ?, "
//				+ "p.prod_status = ?, p.type_id = ? where p.prod_id = ?";
//		Query query = session.createNativeQuery(sql);
//		query.setParameter(1, "???");
//		query.setParameter(2, 999); 
//		query.setParameter(3, "????????????");
//		query.setParameter(4, 1);
//		query.setParameter(5, 3);
//		query.setParameter(6, 13);
//		query.executeUpdate();
//		session.getTransaction().commit();

		// ????????????
//		session.beginTransaction();
//		Query query=session.createQuery("delete Product p where prodID  = 9");
//		query.executeUpdate();
//		session.getTransaction().commit();

		// ??????????????????
//		ProductDAOImpBack impBack = new ProductDAOImpBack();
//		impBack.getById(1);
//		
//		Product product2 = impBack.getById(1);;
//		product2.getProductType().getTypeName();

//		Product product = session.get(Product.class, 1);
//		
//		ProductType productType = product.getProductType();
//		productType.getTypeName().toString();
//		
//		System.out.println(product.getProdID());
//		System.out.println(product.getProdName());
//		System.out.println(productType.getTypeName().toString());

		// ???????????????????????? ????????????????????????(??????)
		// start a transaction
//        session.beginTransaction();
		
		//??????????????????
//		Product product1 = new Product();
//		product1.setProdName("??????!!");
//		product1.setProdPrice(332);
//		product1.setProdDescription("??????!!");
//		product1.setTypeID(3);
		
		//??????????????????
//		List<ProductImg> list = new ArrayList<ProductImg>();
		
		//???????????????????????????
//		byte by[] = {1,2,3};
//		ProductImg productImg = new ProductImg();
//		productImg.setImgFile(by);
//		productImg.setProduct(product1);//???????????????...???????????????????????????????????? ???????????????
//		list.add(productImg);
		
		//???????????????????????????
//		byte by2[] = {2,33,44};
//		ProductImg productImg2 = new ProductImg();
//		productImg2.setImgFile(by2);
//		productImg2.setProduct(product1);//???????????????...???????????????????????????????????? ???????????????
//		list.add(productImg2);
//		
		
		// add the list of photos to the product ????????????list????????????
//		product1.setProductImgs(list);
//
//		session.save(product1);
//		productImg.setProdID(product1.getProdID());
//		productImg2.setProdID(product1.getProdID());
		
//		for(ProductImg p : list) {
//			session.save(p);
//			
//		}
//		 session.getTransaction().commit();
//		
		//????????????
//		session.saveOrUpdate(product1);
//		session.close();
			

		// ??????????????????

//		Product product = session.get(Product.class, 10);
//		List<ProductImg> productImgs = product.getProductImgs();
//
//		for (ProductImg aimg : productImgs) {
//			System.err.println(product.getProdID());
//			System.out.println(aimg.getImgID());
//			System.out.println(aimg.getImgFile().toString());
//			System.out.println(aimg.getProdID());
//
//		}
		
		//???????????????????????? ??? ?????????
		
//		session.beginTransaction();
//		
//		Product product = new Product();
//		
//		product.setProdName("????????????!!");
//		product.setProdPrice(332);
//		product.setProdDescription("??????!!");
//		product.setTypeID(3);
//	
//		ProductImg productImg = new ProductImg();
//		byte[]by = {3,21,5};
//		productImg.setImgFile(by);
//		
//		session.save(product);
//		
//		productImg.setProdID(product.getProdID());
//		
//		session.save(productImg);
//		
//		session.getTransaction().commit();
		
		//???????????????????????????
//		session.beginTransaction();
//		
//		Query query=session.createSQLQuery("delete from product_img where Prod_ID = ?");
//		query.setParameter(1, 4);
//		query.executeUpdate();
//		
//		Query query2=session.createSQLQuery("delete from product where Prod_ID = ?");
//		query2.setParameter(1, 4);
//		query2.executeUpdate();
//		
//		session.close();
//		
		
		
	
	}

	@Override
	public List<Product> selectByProdType(Integer prodType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> selectByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
