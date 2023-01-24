package com.web.roomType.model.dao.impl;

import java.util.List;

import com.web.roomType.model.dao.RoomTypeDAO;
import com.web.roomType.model.entities.RoomType;

public class RoomTypeDAOImpl implements RoomTypeDAO{
	
	@Override
	public Integer add(RoomType roomType) {
		getSession().merge(roomType);
		return roomType.getRoomTypeId();
	}
	
	@Override
	public Integer deleteById(Integer roomTypeId) {
		RoomType roomType = new RoomType();
		roomType.setRoomTypeId(roomTypeId);
		
		getSession().remove(roomType);
		return roomTypeId;
	}
	
	@Override
	public RoomType getById(Integer roomTypeId) {
		return getSession().get(RoomType.class, roomTypeId);	
	}
	
	@Override
	public List<RoomType> getAll(){
		final String hql = "FROM ROOMTYPE ORDER BY roomTypeId";
		return getSession().createQuery(hql, RoomType.class).list();
	}
}
