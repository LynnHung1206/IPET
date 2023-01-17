package com.web.list.model.services;

import java.util.List;

import com.web.list.model.dao.WishDAO;
import com.web.list.model.dao.impl.WishDAOImpl;
import com.web.list.model.entities.WishList;

public class WishService {
	private WishDAO dao;

	public WishService() {
		dao = new WishDAOImpl();
	}

	public Integer add(WishList prodID) {
		return dao.add(prodID);
	}

	public void update(WishList wishList) {
		dao.update(wishList);
	}

	public void delete(Integer prodID) {
		dao.delete(prodID);
	}

	public WishList getByID(Integer id) {
		return dao.getById(id);
	}

	public List<WishList> getAll() {
		return dao.getAll();
	}
}
