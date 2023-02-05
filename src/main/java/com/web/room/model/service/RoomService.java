package com.web.room.model.service;


import java.util.List;

import javax.persistence.criteria.From;

import com.web.room.model.RoomStatus;
import com.web.room.model.dao.RoomDAO;
import com.web.room.model.dao.impl.RoomDAOImpl;
import com.web.room.model.entities.Room;

public class RoomService {
	private RoomDAO dao;
	
	public RoomService() {
		dao = new RoomDAOImpl();
	}
	
	public Room addRoom(Integer roomTypeId, Integer roomCheckStatus, Integer roomSaleStatus) {
		
		Room room = new Room();
		
		room.setRoomTypeId(roomTypeId);
		room.setRoomCheckStatus(RoomStatus.from(roomCheckStatus));
		room.setRoomSaleStatus(roomSaleStatus);
		dao.add(room);
		
		return room;
	}
	
	public Room updateRoom(Integer roomId ,Integer roomTypeId, Integer roomCheckStatus, Integer roomSaleStatus) {
		Room room = new Room();
		
		room.setRoomId(roomId);
		room.setRoomTypeId(roomTypeId);
		room.setRoomCheckStatus(RoomStatus.from(roomCheckStatus));
		room.setRoomSaleStatus(roomSaleStatus);
		dao.add(room);
		
		return dao.getById(roomId);
	}
	
	public void deleteRoom(Integer roomId) {
		dao.deleteById(roomId);
	}
	
	public Room getOneRoom(Integer roomId) {
		return dao.getById(roomId);
	}
	
	public List<Room> selectAll(){
		return dao.getAll();
	}
}
