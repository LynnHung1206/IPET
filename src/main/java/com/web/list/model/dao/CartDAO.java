package com.web.list.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.list.model.entities.CartList;

public interface CartDAO extends CoreDAO<CartList, Integer> {

	public void update(CartList cartList);

	public void delete(Integer prodID);

	public List<CartList> getAll();
}
