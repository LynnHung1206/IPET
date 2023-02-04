package com.web.list.model.services;

import java.util.List;

import com.web.list.model.dao.WishDAO;
import com.web.list.model.dao.impl.WishDAOImpl;
import com.web.list.model.entities.WishList;
import com.web.list.model.entities.WishList.WishListPK;
import com.web.salonService.model.dao.ServiceDAO;

public class WishService {
	private WishDAO dao;

	public WishService() {
		dao = new WishDAOImpl();
	}

//	public Integer add(WishList prodID) {
//		return dao.add(prodID);
//	}
//
//	public void delete(Integer prodID) {
//		dao.delete(prodID);
//	}
//
//	public WishList getByID(Integer id) {
//		return dao.getById(id);
//	}
//
//	public List<WishList> getAll() {
//		return dao.getAll();
//	}
	
	public void addOneProd(Integer memId,Integer prodID) {
		WishList wishList = new WishList();
		WishListPK wishListPK = new WishListPK();
		wishListPK.setMemID(memId);
		wishListPK.setProdID(prodID);
		
		wishList.setWishListPK(wishListPK);
		dao.insert(wishList, wishListPK);
	};
	
	public void removeOneProd(Integer memId,Integer prodID) {
		WishList wishList = new WishList();
		WishListPK wishListPK = new WishListPK();
		wishListPK.setMemID(memId);
		wishListPK.setProdID(prodID);
		wishList.setWishListPK(wishListPK);
		
		dao.remove(wishList, wishListPK);
	};
	
	public WishListPK selectOne(WishList wishList,WishListPK wishListPK) {
		return dao.selectOne(wishList, wishListPK);
	};
	
	public List<WishList> getAll(WishList wishList){
		return dao.selectAll(wishList);
	};
}
