package com.web.room.model.entities;

import java.io.Serial;
import java.util.Objects;

import javax.persistence.*;
import com.core.model.entities.Core;
import com.web.member.model.entity.Member;
import com.web.member.model.service.*;
import com.web.pet.model.entity.Pet;
import com.web.pet.model.service.*;
import com.web.room.model.RoomStatus;
import com.web.roomType.model.entities.RoomType;
import com.web.roomType.model.service.RoomTypeService;


@Entity
@Table(name = "ROOM" ,catalog = "ipetdb")
public class Room extends Core{
	@Serial
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "ROOM_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer roomId;
	
	@Column(name = "ROOM_TYPE_ID")
	private Integer roomTypeId;
	
	@Transient
	private String roomTypeName;
	
	
	@Column (name = "ROOM_CHECK_STATUS")
	private RoomStatus roomCheckStatus;
	
	@Column (name =  "ROOM_SALE_STATUS")
	private Integer roomSaleStatus;
	
	
	public Room(Integer roomId, Integer roomTypeId, RoomStatus roomCheckStatus, Integer roomSaleStatus) {
		this.roomId=roomId;
		this.roomTypeId=roomTypeId;
		this.roomCheckStatus=roomCheckStatus;
		this.roomSaleStatus=roomSaleStatus;
	}
	
	public Room(Integer roomTypeId, RoomStatus roomCheckStatus, Integer roomSaleStatus) {
		this.roomTypeId=roomTypeId;
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
	
	

	public String getRoomTypeName() {
		return roomTypeName;
	}

	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}

	

	

	public RoomStatus getRoomCheckStatus() {
		return roomCheckStatus;
	}

	public void setRoomCheckStatus(RoomStatus roomCheckStatus) {
		this.roomCheckStatus = roomCheckStatus;
	}
	
	

	public Integer getRoomSaleStatus() {
		return roomSaleStatus;
	}

	public void setRoomSaleStatus(Integer roomSaleStatus) {
		this.roomSaleStatus = roomSaleStatus;
	}
	
	
	
	//for join roomTypeId to RoomTypeVO
	public RoomType getRoomTypeVO() {
		RoomTypeService roomTypeSvc = new RoomTypeService();
		RoomType roomType = roomTypeSvc.getOneRoomType(roomTypeId);
		return roomType;
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
