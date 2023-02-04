package com.web.list.model.services;

import java.util.List;

import com.web.list.model.dao.CartDAO;
import com.web.list.model.dao.impl.CartDAOImpl;
import com.web.list.model.entities.CartList;
import com.web.list.model.entities.CartList.CartListPK;

public class CartService {
	private CartDAO dao;

	public CartService() {
		dao = new CartDAOImpl();
	}

//	public Integer add(CartList prodID) {
//		return dao.add(prodID);
//	}
//
//	public void update(CartList cartList) {
//		dao.update(cartList);
//	}
//
//	public void delete(Integer prodID) {
//		dao.delete(prodID);
//	}
//
//	public CartList getByID(Integer id) {
//		return dao.getById(id);
//	}
//
//	public List<CartList> getAll() {
//		return dao.getAll();
//	}
	
	public void addOneProd(Integer memId,Integer prodID,Integer count, Integer total) {
		CartList cartList = new CartList();
		cartList.setCount(count);
		cartList.setTotal(total);
		CartListPK cartListPK = new CartListPK();
		cartListPK.setMemID(memId);
		cartListPK.setProdID(prodID);
		
		
		cartList.setCartListPK(cartListPK);
		dao.insert(cartList, cartListPK);
		
	};
	
	public void addOneProd2(Integer memId,Integer prodID) {
		CartList cartList = new CartList();
		CartListPK cartListPK = new CartListPK();
		cartListPK.setMemID(memId);
		cartListPK.setProdID(prodID);
		
		
		cartList.setCartListPK(cartListPK);
		dao.insert(cartList, cartListPK);
		
	};
	
	public void removeOneProd(Integer memId,Integer prodID) {
//		CartList cartList = new CartList();
		CartListPK cartListPK = new CartListPK();
		cartListPK.setMemID(memId);
		cartListPK.setProdID(prodID);
//		cartList.setCartListPK(cartListPK);
		
		dao.remove(cartListPK);
	};
	
	public CartList selectOne(CartListPK cartListPK) {
		return dao.selectOne(cartListPK);
	};
	
	public List<CartList> getAll(CartList cartList){
		return dao.selectAll(cartList);
	};
}
