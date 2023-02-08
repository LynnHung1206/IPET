package com.web.roomType.model.dao.impl;

import java.util.List;

import com.web.roomType.model.dao.RoomTypeDAO;
import com.web.roomType.model.entities.RoomType;
import org.hibernate.Session;
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
		Session session = getSession();
		return session.get(RoomType.class, roomTypeId);	
	}
	
	@Override
	public List<RoomType> getAll(){
		Session session = getSession();
		final String hql = "FROM RoomType";
		return session.createQuery(hql, RoomType.class).list();
	}

	@Override
	public Integer update(RoomType newRoomType) {
		Session session = getSession();
		RoomType oldRoomType = session.get(RoomType.class, newRoomType.getRoomTypeId());
		oldRoomType.setRoomAmount(newRoomType.getRoomAmount());
		oldRoomType.setRoomTypeName(newRoomType.getRoomTypeName());
		oldRoomType.setDogSize(newRoomType.getDogSize());
		oldRoomType.setRoomTypeContent(newRoomType.getRoomTypeContent());
		oldRoomType.setRoomTypePrice(newRoomType.getRoomTypePrice());
		oldRoomType.setRoomTypeStatus(newRoomType.getRoomTypeStatus());
		return newRoomType.getRoomTypeId();
	}
	
	@Override
	public List<RoomType> findRoomTypeByStatus(Integer status){
		Session session = getSession();
		String hql = "FROM RoomType WHERE roomTypeStatus = :status";
		return session.createQuery(hql,RoomType.class).setParameter("status", status).list();
	}
}
