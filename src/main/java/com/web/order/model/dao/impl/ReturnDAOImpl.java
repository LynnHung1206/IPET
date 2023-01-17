package com.web.order.model.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.web.order.model.dao.ReturnDAO;
import com.web.order.model.entities.OrderReturn;

public class ReturnDAOImpl implements ReturnDAO {

	@Override
	public List<OrderReturn> getAll() {
		Session session = getSession();
		String hql = "FROM OrderReturn";
		return session.createQuery(hql, OrderReturn.class).list();
	}

	@Override
	public OrderReturn getById(Integer id) {
		Session session = getSession();
		return session.get(OrderReturn.class, id);
	}

	@Override
	public Integer add(OrderReturn returnID) {
		Session session = getSession();
		session.persist(returnID);
		return returnID.getOrderID();
	}

	@Override
	public void update(OrderReturn orderReturn) {
		Session session = getSession();
		OrderReturn oldorderReturn = session.get(OrderReturn.class, orderReturn.getOrderID());
		oldorderReturn.setReturnID(orderReturn.getReturnID());
		oldorderReturn.setReturnStatus(orderReturn.getReturnStatus());
	}

	@Override
	public void delete(Integer returnID) {
		Session session = getSession();
		OrderReturn orderReturn = new OrderReturn();
		orderReturn.setReturnID(returnID);
		session.remove(orderReturn);

	}

	@Override
	public List<OrderReturn> getAll(Integer orderID) {
		Session session = getSession();
		String hql = "FROM OrderReturn";
		return session.createQuery(hql,OrderReturn.class).list();
	}

}
