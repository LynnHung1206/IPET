package com.web.list.model.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.web.list.model.dao.WishDAO;
import com.web.list.model.entities.WishList;

public class WishDAOImpl implements WishDAO {

	@Override
	public WishList getById(Integer id) {
		Session session = getSession();
		return session.get(WishList.class, id);
	}

	@Override
	public Integer add(WishList wishList) {
		Session session = getSession();
		session.persist(wishList);
		return wishList.getProdID();
	}

	@Override
	public void update(WishList wishList) {
		Session session = getSession();
		WishList oldWishList = session.get(WishList.class, wishList.getMemID());
		oldWishList.setProdID(wishList.getProdID());
		
	}

	@Override
	public void delete(Integer prodID) {
		Session session = getSession();
		WishList wishList = new WishList();
		wishList.setProdID(prodID);
		session.remove(wishList);
		
	}

	@Override
	public List<WishList> getAll() {
		Session session = getSession();
		String hql = "FROM WishList";
		return session.createQuery(hql,WishList.class).list();
	}

}
