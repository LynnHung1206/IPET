package com.web.order.model.services;

import java.util.List;

import com.web.order.model.dao.MasterDAO;
import com.web.order.model.dao.impl.MasterDAOImpl;
import com.web.order.model.entities.OrderMaster;

public class MasterService {
	private MasterDAO dao;
	
	public MasterService() {
		dao = new MasterDAOImpl();
	}
	
	public Integer add(OrderMaster orderMaster) {
		return dao.add(orderMaster);
	}

	public void update(OrderMaster orderMaster) {
		dao.update(orderMaster);
	}

	public void delete(Integer orderID) {
		dao.delete(orderID);
	}

	public OrderMaster getByID(Integer id) {
		return dao.getById(id);
	}

	public List<OrderMaster> getAll() {
		return dao.getAll();
	}
}
