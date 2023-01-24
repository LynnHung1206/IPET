package com.web.roomType.model.dao;


import com.core.model.dao.CoreDAO;
import com.web.roomType.model.entities.RoomType;

public interface RoomTypeDAO extends CoreDAO<RoomType, Integer>{
	
	Integer deleteById(Integer roomTypeId);
	
}
