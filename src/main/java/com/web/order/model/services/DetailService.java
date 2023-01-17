package com.web.order.model.services;

import java.util.List;

import com.web.order.model.dao.DetailDAO;
import com.web.order.model.dao.impl.DetailDAOIpml;
import com.web.order.model.entities.OrderDetail;

public class DetailService {
private DetailDAO dao;
	
	public DetailService() {
		dao = new DetailDAOIpml();
	}
	
	public Integer add(OrderDetail orderDetail) {
		return dao.add(orderDetail);
	}

	public void update(OrderDetail orderDetail) {
		dao.update(orderDetail);
	}

	public void delete(Integer orderID, Integer prodID) {
		dao.delete(orderID,prodID);
	}

	public OrderDetail getByID(Integer id) {
		return dao.getById(id);
	}

	public List<OrderDetail> getAll() {
		return dao.getAll();
	}
}
