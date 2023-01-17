package com.web.order.model.services;

import java.util.List;

import com.web.order.model.dao.ReturnDAO;
import com.web.order.model.dao.impl.ReturnDAOImpl;
import com.web.order.model.entities.OrderReturn;

public class ReturnService {
private ReturnDAO dao;
	
	public ReturnService() {
		dao = new ReturnDAOImpl();
	}
	
	public Integer add(OrderReturn orderReturn) {
		return dao.add(orderReturn);
	}

	public void update(OrderReturn orderReturn) {
		dao.update(orderReturn);
	}

	public void delete(Integer orderID) {
		dao.delete(orderID);
	}

	public OrderReturn getByID(Integer id) {
		return dao.getById(id);
	}

	public List<OrderReturn> getAll() {
		return dao.getAll();
	}
}
