package com.web.room.model.dao;



import com.core.model.dao.CoreDAO;
import com.web.room.model.entities.Room;


public interface RoomDAO extends CoreDAO<Room, Integer>{
	
	Integer deleteById(Integer roomId);
	
	
}

