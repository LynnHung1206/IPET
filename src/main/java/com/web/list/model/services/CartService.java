package com.web.list.model.services;

import java.util.List;

import com.web.list.model.dao.CartDAO;
import com.web.list.model.dao.impl.CartDAOImpl;
import com.web.list.model.entities.CartList;

public class CartService {
	private CartDAO dao;

	public CartService() {
		dao = new CartDAOImpl();
	}

	public Integer add(CartList prodID) {
		return dao.add(prodID);
	}

	public void update(CartList cartList) {
		dao.update(cartList);
	}

	public void delete(Integer prodID) {
		dao.delete(prodID);
	}

	public CartList getByID(Integer id) {
		return dao.getById(id);
	}

	public List<CartList> getAll() {
		return dao.getAll();
	}
}
