package com.web.roomDiscount.model.dao;


import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.roomDiscount.model.entity.Discount;
public interface DiscountDAO extends CoreDAO<Discount, Integer>{

	Integer deleteById(Integer discountId);
	
	//查詢尚未開始的優惠
	List<Discount> findNotStartDiscount();
	
	//查詢進行中優惠
	List<Discount> findDiscount();
	
	//查詢已結束優惠
	List<Discount> findEndedDiscount();
}
