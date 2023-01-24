package com.web.room.model.entities;

import java.io.Serial;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Room" ,catalog = "ipetdb")
public class Room {
	@Serial
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "ROOM_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer roomId;
	
	@Column(name = "ROOM_TYPE_ID")
	private Integer roomTypeId;
	
	@Column(name = "PET_ID")
	private Integer petId;
	
	@Column(name = "MEM_ID")
	private Integer memId;
	
	@Column (name = "ROOM_CHECK_STATUS")
	private Integer roomCheckStatus;
	
	@Column (name =  "ROOM_SALE_STATUS")
	private Integer roomSaleStatus;
	
	public Room(Integer roomId, Integer roomTypeId, Integer petId,Integer memId, Integer roomCheckStatus, Integer roomSaleStatus) {
		this.roomId=roomId;
		this.roomTypeId=roomTypeId;
		this.petId=petId;
		this.memId=memId;
		this.roomCheckStatus=roomCheckStatus;
		this.roomSaleStatus=roomSaleStatus;
	}
	
	public Room(Integer roomTypeId, Integer petId,Integer memId, Integer roomCheckStatus, Integer roomSaleStatus) {
		this.roomTypeId=roomTypeId;
		this.petId=petId;
		this.memId=memId;
		this.roomCheckStatus=roomCheckStatus;
		this.roomSaleStatus=roomSaleStatus;
	}
	
	public Room () {}

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public Integer getRoomTypeId() {
		return roomTypeId;
	}

	public void setRoomTypeId(Integer roomTypeId) {
		this.roomTypeId = roomTypeId;
	}

	public Integer getPetId() {
		return petId;
	}

	public void setPetId(Integer petId) {
		this.petId = petId;
	}

	public Integer getMemId() {
		return memId;
	}

	public void setMemId(Integer memId) {
		this.memId = memId;
	}

	public Integer getRoomCheckStatus() {
		return roomCheckStatus;
	}

	public void setRoomCheckStatus(Integer roomCheckStatus) {
		this.roomCheckStatus = roomCheckStatus;
	}

	public Integer getRoomSaleStatus() {
		return roomSaleStatus;
	}

	public void setRoomSaleStatus(Integer roomSaleStatus) {
		this.roomSaleStatus = roomSaleStatus;
	}
	
	
	@Override
	public int hashCode() {
		return Objects.hash(roomId);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Room other = (Room) obj;
		return Objects.equals(roomId, other.roomId);
	}
}
