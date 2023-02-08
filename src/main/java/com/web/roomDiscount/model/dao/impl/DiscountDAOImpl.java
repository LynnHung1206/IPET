package com.web.roomDiscount.model.dao.impl;

import java.util.List;
import com.web.roomDiscount.model.dao.DiscountDAO;
import com.web.roomDiscount.model.entity.Discount;

public class DiscountDAOImpl implements DiscountDAO{
	
	@Override
	public Integer add(Discount discount) {
		getSession().merge(discount);
		return discount.getDiscountId();
	}
	
	@Override
	public Integer deleteById(Integer discountId) {
		Discount discount = new Discount();
		discount.setDiscountId(discountId);
		
		getSession().remove(discount);
		return discountId;
	}
	
	@Override
	public List<Discount> getAll(){
		final String hql = "FROM Discount";
		return getSession().createQuery(hql, Discount.class).list();
	}
	
	@Override
	public List<Discount> findNotStartDiscount(){
		final String sql = "select * from ROOM_DISCOUNT where START_TIME > now() order by RoomDiscountId;";
		List<Discount> list = getSession().createNativeQuery(sql, Discount.class).list();
		return list;
	}
	
	@Override
	public List<Discount> findDiscount() {
		final String sql = "select * from ROOM_DISCOUNT where START_TIME <= now() and END_TIME >= now() order by RoomDiscountId;";
		List<Discount> list = getSession().createNativeQuery(sql, Discount.class).list();
		return list;
	}
	
	@Override 
	public List<Discount> findEndedDiscount(){
		final String sql = "select * from ROOM_DISCOUNT where END_TIME < now() order by RoomDiscountId;";
		List<Discount> list = getSession().createNativeQuery(sql, Discount.class).list();
		return list;
	}

	@Override
	public Discount getById(Integer discountId) {
		return getSession().get(Discount.class, discountId);
	}
}
