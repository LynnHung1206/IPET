package com.web.room.model.dao.impl;

import java.util.List;

import com.web.room.model.dao.RoomDAO;
import com.web.room.model.entities.Room;


public class RoomDAOImpl implements RoomDAO{
	
	@Override
	public Integer add(Room room) {
		getSession().merge(room);
		return room.getRoomId();
	}
	
	@Override
	public Integer deleteById(Integer roomId) {
		Room room = new Room();
		room.setRoomId(roomId);
		
		getSession().remove(room);
		return roomId;
	}
	
	@Override
	public List<Room> getAll(){
		final String hql = "FROM ROOM ORDER BY roomId" ;
		return getSession().createQuery(hql, Room.class).list();
	}

	@Override
	public Room getById(Integer roomId) {
		return getSession().get(Room.class, roomId);
	}
}
