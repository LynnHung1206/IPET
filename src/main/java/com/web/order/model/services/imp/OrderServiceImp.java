package com.web.order.model.services.imp;

import com.web.order.model.entities.OrderDetail;
import com.web.order.model.entities.OrderMaster;
import com.web.order.model.services.OrderService;

import java.util.List;

import com.web.order.model.dao.DetailDAO;
import com.web.order.model.dao.MasterDAO;
import com.web.order.model.dao.ReturnDAO;
import com.web.order.model.dao.impl.DetailDAOIpml;
import com.web.order.model.dao.impl.MasterDAOImpl;
import com.web.order.model.dao.impl.ReturnDAOImpl;

public class OrderServiceImp implements OrderService{

	private MasterDAO masterDAO;
	private DetailDAO detailDAO;
	private ReturnDAO returnDAO;
	
	public OrderServiceImp() {
		masterDAO = new MasterDAOImpl();
		detailDAO = new DetailDAOIpml();
		returnDAO = new ReturnDAOImpl();
	}
	
	public List<OrderMaster> findAllOrderMaster(){
		return masterDAO.getAll();
	}
	
	public OrderMaster findOrderMaster(Integer orderID) {
		return masterDAO.getById(orderID);
	}
	
	public List<OrderDetail> findOrderDetails(Integer orderID){
		List<OrderDetail> list = detailDAO.getByOrderID(orderID);
		for(OrderDetail od : list) {
			System.out.println(od.getOrderID());
			System.out.println(od.getProdID());
			System.out.println(od.getDetailQuantity());
		}
		return detailDAO.getByOrderID(orderID);
	}
	
	public void updateOrderMaster(OrderMaster orderMaster) {
		masterDAO.update(orderMaster);
		System.out.println("go to daoImp");
	}
	
	public void addOrder(OrderMaster orderMaster, List<OrderDetail> orderDetails) {
		masterDAO.addWithOrderDetail(orderMaster, orderDetails);
	}
}
