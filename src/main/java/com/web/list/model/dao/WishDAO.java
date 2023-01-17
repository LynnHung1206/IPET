package com.web.list.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.list.model.entities.WishList;

public interface WishDAO extends CoreDAO<WishList, Integer> {

	public void update(WishList wishList);

	public void delete(Integer prodID);

	public List<WishList> getAll();
	
}
