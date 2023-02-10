package com.web.list.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.list.model.entities.CartList;
import com.web.list.model.entities.CartList.CartListPK;

public interface CartDAO extends CoreDAO<CartList, Integer> {

	public void delete(Integer prodID);

	public List<CartList> getAll();

	public void insert(CartList cartList, CartListPK cartListPK);

	public void remove(CartListPK cartListPK);

	public CartList selectOne(CartListPK cartListPK);

	public List<CartList> selectAll(CartList cartList);

	public void remove(Integer memID);

	public void update(Integer memId, Integer count, Integer oldCount,Integer total,Integer oldTotal);

}
