package com.web.list.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.list.model.entities.WishList;
import com.web.list.model.entities.WishList.WishListPK;

public interface WishDAO extends CoreDAO<WishList, Integer> {

	public void delete(Integer prodID);

	public List<WishList> getAll();
	
	
	public void insert(WishList wishList,WishListPK wishListPK);
	
	public void remove(WishListPK wishListPK);
	
	public WishList selectOne(WishListPK wishListPK);
	
	public List<WishList> selectAll(WishList wishList);
}
