package com.web.order.model.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.web.order.model.dao.DetailDAO;
import com.web.order.model.entities.OrderDetail;

public class DetailDAOIpml implements DetailDAO {

	@Override
	public List<OrderDetail> getAll() {
		Session session = getSession();
		String hql = "FROM OrderDetail";
		return session.createQuery(hql,OrderDetail.class).list();
	}

	@Override
	public OrderDetail getById(Integer id) {
		Session session = getSession();
		return session.get(OrderDetail.class, id);
	}

	@Override
	public Integer add(OrderDetail orderDetail) {
		Session session = getSession();
		session.persist(orderDetail);
		return orderDetail.getProdID();
	}

	@Override
	public void update(OrderDetail orderDetail) {
		Session session = getSession();
		OrderDetail oldOrderDetail = session.get(OrderDetail.class, orderDetail.getOrderID());
		oldOrderDetail.setProdID(orderDetail.getProdID());
		oldOrderDetail.setDetailQuantity(orderDetail.getDetailQuantity());
		oldOrderDetail.setDetailPrice(orderDetail.getDetailPrice());
		
	}

	@Override
	public void delete(Integer orderID, Integer prodID) {
		Session session = getSession();
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setOrderID(orderID);
		orderDetail.setProdID(prodID);
		session.remove(orderDetail);
		
	}
}
