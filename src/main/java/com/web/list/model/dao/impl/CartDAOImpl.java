package com.web.list.model.dao.impl;

import java.util.List;
import org.hibernate.Session;
import com.web.list.model.dao.CartDAO;
import com.web.list.model.entities.CartList;
import com.web.list.model.entities.CartList.CartListPK;


public class CartDAOImpl implements CartDAO {

	@Override
	public CartList getById(Integer id) {
		Session session = getSession();

		return session.get(CartList.class, id);
	}

	@Override
	public Integer add(CartList cartList) {
		Session session = getSession();

		CartListPK cartListPK = new CartListPK();
		cartListPK.setMemID(cartList.getCartListPK().getMemID());
		cartListPK.setProdID(cartList.getCartListPK().getProdID());
		 
		cartList.setCartListPK(cartListPK);
		 session.save(cartList);


		return cartList.getCartListPK().getMemID();
	}

	@Override
	public void delete(Integer prodID) {
		Session session = getSession();
		CartList cartList = new CartList();
//		wishList.setProdID(prodID);
		session.remove(cartList);


	}

	@Override
	public List<CartList> getAll() {
		Session session = getSession();
		String hql = "FROM WishList";
		return session.createQuery(hql, CartList.class).list();
	}

	@Override
	public void insert(CartList cartList, CartListPK cartListPK) {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(CartList cartList, CartListPK cartListPK) {
		Session session = getSession();
		 cartList.setCartListPK(cartListPK);
		 session.save(cartList);

	}

	@Override
	public CartListPK selectOne(CartList cartList, CartListPK cartListPK) {
		Session session = getSession();
		CartList oldwishList = session.get(CartList.class, cartListPK);
		return oldwishList.getCartListPK();
	}

	@Override
	public List<CartList> selectAll(CartList cartList) {
		Session session = getSession();
		org.hibernate.query.Query<CartList> query = session.createQuery("from CartList where mem_Id = :memId", CartList.class);
		query.setParameter("memId", cartList.getCartListPK().getMemID());
		List<CartList> cartLists = query.list();
		
		return cartLists;
	}

}
