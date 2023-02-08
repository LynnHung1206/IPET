package com.web.list.model.dao.impl;

import java.util.List;
import org.hibernate.Session;

import com.core.util.HibernateUtil;
import com.web.list.model.dao.WishDAO;
import com.web.list.model.entities.WishList;
import com.web.list.model.entities.WishList.WishListPK;

public class WishDAOImpl implements WishDAO {

	@Override
	public WishList getById(Integer id) {
		Session session = getSession();
		
		return session.get(WishList.class, id);
	}

	@Override
	public Integer add(WishList wishList) {
		Session session = getSession();

		WishListPK wishListPK = new WishListPK();
		wishListPK.setMemID(wishList.getWishListPK().getMemID());
		wishListPK.setProdID(wishList.getWishListPK().getProdID());
		 wishList.setWishListPK(wishListPK);
		 session.save(wishList);


		return wishList.getWishListPK().getMemID();
	}

	@Override
	public void delete(Integer prodID) {
		Session session = getSession();
		WishList wishList = new WishList();
//		wishList.setProdID(prodID);
		session.remove(wishList);

	}

	@Override
	public List<WishList> getAll() {
		Session session = getSession();
		String hql = "FROM WishList";
		return session.createQuery(hql, WishList.class).list();
	}
	
	@Override
	public void insert(WishList wishList, WishListPK wishListPK) {
		Session session = getSession();
		wishList.setCount(1); //這裡先暫時這樣設
		 wishList.setWishListPK(wishListPK);
		 session.save(wishList);
		 
		 
		
	}
	@Override
	public void remove(WishListPK wishListPK) {
		Session session = getSession();
		session.clear();
		WishList wishList = new WishList();
		 wishList.setWishListPK(wishListPK);
		 session.delete(wishList);
		
	}
	
	@Override
	public WishList selectOne(WishListPK wishListPK) {
		Session session = getSession();
		WishList oldwishList = session.get(WishList.class, wishListPK);
		return oldwishList;
	}
	
	@Override
	public List<WishList> selectAll(WishList wishList) {
		Session session = getSession();
		org.hibernate.query.Query<WishList> query = session.createQuery("from WishList where mem_Id = :memId", WishList.class);
		query.setParameter("memId", wishList.getWishListPK().getMemID());
		List<WishList> wishLists = query.list();
		
		return wishLists;
	}

	public static void main(String[] args) {
		// 測試用opensession
		Session session = HibernateUtil.getSessionFactory().openSession();

		// 查詢單一收藏測試
//		WishListPK wishListPK = new WishListPK();//使用複合式別建立物件 並傳入要查詢的參數 
//		wishListPK.setMemID(1);
//		wishListPK.setProdID(1);
//		
//		WishList wishList = session.get(WishList.class, wishListPK); //將複合式別建立的物件傳給實體類別//使用get一定會要兩個參數 這裡等於get 某會員的某商品
//		
//		System.out.println(wishList.getWishListPK().toString());
//		==============================================================
		// 查詢全部收藏測試
//		session.beginTransaction();
//		org.hibernate.query.Query<WishList> query = session.createQuery("from WishList where mem_Id = :memId", WishList.class);
//		query.setParameter("memId", 1);
//		List<WishList> wishLists = query.list();
//		for (WishList wishList : wishLists) {
//			System.out.println(wishList.getWishListPK());
//		}
//		session.getTransaction().commit();
//		session.close();
//		==============================================================
		// 新增單筆商品
		session.beginTransaction();
		WishList wishList = new WishList();
		WishListPK pk = new WishListPK();
		 pk.setMemID(1);
		 pk.setProdID(6);
		 wishList.setCount(1);
		 
		 wishList.setWishListPK(pk);
		 session.save(wishList);
		 session.getTransaction().commit();
		 session.close();
//		==============================================================
		//刪除單筆商品
//		session.beginTransaction();
//		WishList wishList = new WishList();
//		WishListPK pk = new WishListPK();
//		 pk.setMemID(1);
//		 pk.setProdID(9);
//		
//		wishList.setWishListPK(pk);
//		session.delete(wishList);
//		session.getTransaction().commit();
//		session.close();
		
		
		//測適用DAO
		WishDAOImpl dao = new WishDAOImpl();
		
		//DAO測試新增
//		WishList wishList = new WishList();
//		WishListPK wishListPK = new WishListPK();
//		wishListPK.setMemID(1);
//		wishListPK.setProdID(10);
//		
//		wishList.setWishListPK(wishListPK);
//		dao.insert(wishList, wishListPK);
		
		//DAO測試刪除
//		WishList wishList = new WishList();
//		WishListPK wishListPK = new WishListPK();
//		wishListPK.setMemID(1);
//		wishListPK.setProdID(10);
//		wishList.setWishListPK(wishListPK);
//		dao.remove(wishList, wishListPK);
		
		//DAO測試查詢memID=1 prodID=1
//		WishList wishList = new WishList();
//		WishListPK wishListPK = new WishListPK();
//		wishListPK.setMemID(1);
//		wishListPK.setProdID(1);
//		wishList.setWishListPK(wishListPK);
//		dao.selectOne(wishListPK);
		
		//DAO查詢測試全部
//		WishList wishList = new WishList();
//		WishListPK wishListPK = new WishListPK();
//		wishListPK.setMemID(1);
//		wishList.setWishListPK(wishListPK);
//		
//		List<WishList> alist =dao.selectAll(wishList);
//		
//		for (WishList aa : alist) {
//			System.out.println(aa.getWishListPK());
//		}
	}

	

	

	

	
}
