package com.web.roomDiscount.model.service;

import java.sql.Date;
import java.util.List;
import com.web.roomDiscount.model.dao.DiscountDAO;
import com.web.roomDiscount.model.dao.impl.DiscountDAOImpl;
import com.web.roomDiscount.model.entites.Discount;

public class DiscountService {
	private DiscountDAO dao;
	
	public DiscountService() {
		dao = new DiscountDAOImpl();
	}
	
	public Discount addDiscount(String discountName, String discountContent, Integer roomDis, Date startTime, Date endTime) {
		
		Discount discount = new Discount();
		
		discount.setDiscountName(discountName);
		discount.setDiscountContent(discountContent);
		discount.setRoomDis(roomDis);
		discount.setStartTime(startTime);
		discount.setEndTime(endTime);
		dao.add(discount);
		
		return discount;
	}
	
	public Discount updateDiscount(Integer discountId, String discountName, String discountContent, Integer roomDis, Date startTime, Date endTime) {
		
		Discount discount = new Discount();
		
		discount.setDiscountId(discountId);
		discount.setDiscountName(discountName);
		discount.setDiscountContent(discountContent);
		discount.setRoomDis(roomDis);
		discount.setStartTime(startTime);
		discount.setEndTime(endTime);
		dao.add(discount);
		
		return dao.getById(discountId);
		
	}
	
	public void deleteDiscount(Integer discountId) {
		dao.deleteById(discountId);
	}
	
	public Discount getOneDiscount(Integer discountId) {
		return dao.getById(discountId);
	}
	
	public List<Discount> selectAll(){
		return dao.getAll();
	}
}
