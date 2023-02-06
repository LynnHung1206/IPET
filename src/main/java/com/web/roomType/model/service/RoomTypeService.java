package com.web.roomType.model.service;

import java.util.List;

import com.web.member.model.entity.Member;
import com.web.roomType.model.dao.RoomTypeDAO;
import com.web.roomType.model.dao.impl.RoomTypeDAOImpl;
import com.web.roomType.model.entities.RoomType;

public class RoomTypeService {
	private RoomTypeDAO dao;
	
	public RoomTypeService() {
		dao = new RoomTypeDAOImpl();
	}
	
	public RoomType addRoomType(Integer roomAmount, String roomTypeName, String dogSize, String roomTypeContent,Byte[] roomTypePhoto, Integer roomTypePrice, Integer roomTypeStatus) {
		
		RoomType roomType = new RoomType();
		
		roomType.setRoomAmount(roomAmount);
		roomType.setRoomTypeName(roomTypeName);
		roomType.setDogSize(dogSize);
		roomType.setRoomTypeContent(roomTypeContent);
		roomType.setRoomTypePhoto(roomTypePhoto);
		roomType.setRoomTypePhoto(roomTypePhoto);
		roomType.setRoomTypePrice(roomTypePrice);
		roomType.setRoomTypeStatus(roomTypeStatus);
		
		dao.add(roomType);
		return roomType;
	}
	
	public RoomType updateRoomType(Integer roomTypeId, Integer roomAmount, String roomTypeName, String dogSize, String roomTypeContent,Byte[] roomTypePhoto, Integer roomTypePrice, Integer roomTypeStatus) {
		
		RoomType roomType = new RoomType();
		
		roomType.setRoomTypeId(roomTypeId);
		roomType.setRoomAmount(roomAmount);
		roomType.setRoomTypeName(roomTypeName);
		roomType.setDogSize(dogSize);
		roomType.setRoomTypeContent(roomTypeContent);
		roomType.setRoomTypePhoto(roomTypePhoto);
		roomType.setRoomTypePrice(roomTypePrice);
		roomType.setRoomTypeStatus(roomTypeStatus);
		
		dao.add(roomType);
		return dao.getById(roomTypeId);
	}
	
	public void deleteRoomType(Integer roomTypeId) {
		dao.deleteById(roomTypeId);
	}
	public RoomType getOneRoomType(Integer roomTypeId) {
		return dao.getById(roomTypeId);
	} 
	public List<RoomType> selectAll(){
		return dao.getAll();
	}
}
