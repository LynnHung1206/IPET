package com.web.order.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.order.model.entities.OrderDetail;

public interface DetailDAO extends CoreDAO<OrderDetail, Integer> {
	
	void update(OrderDetail orderDetail);
	void delete(Integer orderID, Integer prodID);
	
	List<OrderDetail> getAll();
}
