package com.web.order.model.dao.impl;

import java.util.List;
import org.hibernate.Session;

import com.web.order.model.dao.MasterDAO;
import com.web.order.model.entities.OrderMaster;

public class MasterDAOImpl implements MasterDAO {

	@Override
	public OrderMaster getById(Integer id) {
		Session session = getSession();
		return session.get(OrderMaster.class, id);
	}

	@Override
	public Integer add(OrderMaster orderMaster) {
		Session session = getSession();
		session.persist(orderMaster);
		return orderMaster.getOrderID();
	}

	@Override
	public void update(OrderMaster orderMater) {
		Session session = getSession();
		OrderMaster oldorderMater = session.get(OrderMaster.class, orderMater.getOrderID());
		oldorderMater.setMemID(orderMater.getMemID());
		oldorderMater.setOrderSum(orderMater.getOrderSum());
		oldorderMater.setOrderStatus(orderMater.getOrderStatus());
		oldorderMater.setOrderRecName(orderMater.getOrderRecName());
		oldorderMater.setOrderRecPhone(orderMater.getOrderRecName());
		oldorderMater.setOrderRecAddress(orderMater.getOrderRecAddress());
		
	}

	@Override
	public void delete(Integer orderID) {
		Session session = getSession();
		OrderMaster orderMaster = new OrderMaster();
		orderMaster.setOrderID(orderID);
		session.remove(orderMaster);
		
	}

	@Override
	public List<OrderMaster> getAll() {
		Session session = getSession();
		String hql = "FROM OrderMaster";
		return session.createQuery(hql,OrderMaster.class).list();
	}

	
}
