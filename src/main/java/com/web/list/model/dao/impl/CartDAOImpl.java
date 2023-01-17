package com.web.list.model.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.web.list.model.dao.CartDAO;
import com.web.list.model.entities.CartList;


public class CartDAOImpl implements CartDAO {

	@Override
	public CartList getById(Integer id) {
		Session session = getSession();
		return session.get(CartList.class, id);

	}

	@Override
	public Integer add(CartList cartList) {
		Session session = getSession();
		session.persist(cartList);
		return cartList.getProdID();
	}

	@Override
	public void update(CartList cartList) {
		Session session = getSession();
		CartList oldCartList = session.get(CartList.class, cartList.getMemID());
		oldCartList.setProdID(cartList.getProdID());
		
	}


	@Override
	public List<CartList> getAll() {
		Session session = getSession();
		String hql = "FROM CartList";
		return session.createQuery(hql,CartList.class).list();
	}

	@Override
	public void delete(Integer prodID) {
		Session session = getSession();
		CartList cartList = new CartList();
		cartList.setProdID(prodID);
		session.remove(cartList);
		
	}

}
