package com.web.order.model.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.core.util.HibernateUtil;
import com.web.order.model.dao.MasterDAO;
import com.web.order.model.entities.OrderDetail;
import com.web.order.model.entities.OrderMaster;

public class MasterDAOImpl implements MasterDAO {

	@Override
	public List<OrderMaster> getBymemID(Integer memID) {
		String hql = "FROM OrderMaster Where memID = :memID";
		return getSession().createQuery(hql, OrderMaster.class).setParameter("memID", memID).list();
	}
	
	@Override
	public OrderMaster getById(Integer orderID) {
		return getSession().get(OrderMaster.class, orderID);
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
		OrderMaster oldOrderMaster = session.get(OrderMaster.class, orderMater.getOrderID());
		oldOrderMaster.setOrderSum(orderMater.getOrderSum());
		oldOrderMaster.setOrderStatus(orderMater.getOrderStatus());
		oldOrderMaster.setOrderRecAddress(orderMater.getOrderRecAddress());
		oldOrderMaster.setOrderRecName(orderMater.getOrderRecName());
		oldOrderMaster.setOrderRecPhone(orderMater.getOrderRecPhone());
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
		String hql = "FROM OrderMaster";
		return getSession().createQuery(hql,OrderMaster.class).list();
	}

	@Override
	public Integer addWithOrderDetail(OrderMaster orderMaster, List<OrderDetail> orderDetails) {
		
		Session session = getSession();
		
		session.persist(orderMaster);
			
		for(OrderDetail od : orderDetails) {
			od.setOrderID(orderMaster.getOrderID());
			session.persist(od);
		}
		
		return orderMaster.getOrderID();
	}
}
