package com.web.order.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.order.model.entities.OrderReturn;

public interface ReturnDAO extends CoreDAO<OrderReturn, Integer> {
	void update(OrderReturn orderReturn);
	void delete(Integer returnID);
	
	List<OrderReturn> getAll(Integer orderID);
}
