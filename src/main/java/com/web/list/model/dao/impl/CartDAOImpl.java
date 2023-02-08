package com.web.list.model.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.NativeQuery;

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
		Session session = getSession();
		
		 cartList.setCartListPK(cartListPK);
		 session.save(cartList);

	}

	@Override
	public void remove(CartListPK cartListPK) {
		Session session = getSession();
		session.clear();
		CartList cartList = new CartList();		
		cartList.setCartListPK(cartListPK);
		session.delete(cartList);

	}

	@Override
	public CartList selectOne(CartListPK cartListPK) {
		Session session = getSession();
		CartList oldcartList = session.get(CartList.class, cartListPK);
		return oldcartList;
	}

	@Override
	public List<CartList> selectAll(CartList cartList) {
		Session session = getSession();
		org.hibernate.query.Query<CartList> query = session.createQuery("from CartList where mem_Id = :memId", CartList.class);
		query.setParameter("memId", cartList.getCartListPK().getMemID());
		List<CartList> cartLists = query.list();
		
		return cartLists;
	}

	@Override
	public void remove(Integer memID) {
		String sql = "delete from cart_list where MEM_ID = :memID";
		getSession().createNativeQuery(sql).setParameter("memID", memID).executeUpdate();
	}

}
