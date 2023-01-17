package com.web.order.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.order.model.entities.OrderMaster;

public interface MasterDAO extends CoreDAO<OrderMaster, Integer>{
	
	void update(OrderMaster orderMater);
	void delete(Integer orderID);
	
	List<OrderMaster> getAll();
}
