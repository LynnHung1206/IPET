package com.web.roomType.model.dao;




import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.roomType.model.entities.RoomType;

public interface RoomTypeDAO extends CoreDAO<RoomType, Integer>{
	Integer update(RoomType t);
	Integer deleteById(Integer roomTypeId);
	List<RoomType> findRoomTypeByStatus(Integer status);
}
