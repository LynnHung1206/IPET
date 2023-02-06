package com.web.roomType.model.entities;

import java.io.Serial;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.core.model.entities.Core;




@Entity
@Table(name = "ROOM_TYPE", catalog="ipetdb")
public class RoomType extends Core{
	@Serial
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "ROOM_TYPE_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer roomTypeId;
	
	@Column(name = "ROOM_AMOUNT")
	private Integer roomAmount;
	
	@Column(name = "ROOM_TYPE_NAME")
	private String roomTypeName;
	
	@Column(name ="DOG_SIZE")
	private String dogSize;
	
	@Column(name = "ROOM_TYPE_CONTENT")
	private String roomTypeContent;
	
	@Column(name = "ROOM_TYPE_PHOTO")
	private Byte[] roomTypePhoto;
	
	@Column(name= "ROOM_TYPE_PRICE")
	private Integer roomTypePrice;
	
	@Column(name = "ROOM_TYPE_STATUS")
	private Integer roomTypeStatus;
	
	public RoomType(Integer roomTypeId, Integer roomAmount, String roomTypeName, String dogSize, String roomTypeContent,Byte[] roomTypePhoto, Integer roomTypePrice, Integer roomTypeStatus) {
		this.roomTypeId = roomTypeId;
		this.roomAmount = roomAmount;
		this.roomTypeName = roomTypeName;
		this.dogSize = dogSize;
		this.roomTypeContent = roomTypeContent;
		this.roomTypePhoto= roomTypePhoto;
		this.roomTypePrice = roomTypePrice;
		this.roomTypeStatus = roomTypeStatus;
		
		
	}
	
	public RoomType(Integer roomAmount, String roomTypeName, String dogSize, String roomTypeContent,Byte[] roomTypePhoto, Integer roomTypePrice, Integer roomTypeStatus) {
		this.roomAmount = roomAmount;
		this.roomTypeName = roomTypeName;
		this.dogSize = dogSize;
		this.roomTypeContent = roomTypeContent;
		this.roomTypePhoto= roomTypePhoto;
		this.roomTypePrice = roomTypePrice;
		this.roomTypeStatus = roomTypeStatus;
	}
	
	public RoomType(){}

	

	public Integer getRoomTypeId() {
		return roomTypeId;
	}

	public void setRoomTypeId(Integer roomTypeId) {
		this.roomTypeId = roomTypeId;
	}

	public Integer getRoomAmount() {
		return roomAmount;
	}

	public void setRoomAmount(Integer roomAmount) {
		this.roomAmount = roomAmount;
	}

	public String getRoomTypeName() {
		return roomTypeName;
	}

	public void setRoomTypeName(String roomTypeName) {
		this.roomTypeName = roomTypeName;
	}

	public String getDogSize() {
		return dogSize;
	}

	public void setDogSize(String dogSize) {
		this.dogSize = dogSize;
	}
	
	
	public Byte[] getRoomTypePhoto() {
		return roomTypePhoto;
	}

	public void setRoomTypePhoto(Byte[] roomTypePhoto) {
		this.roomTypePhoto = roomTypePhoto;
	}

	public String getRoomTypeContent() {
		return roomTypeContent;
	}

	public void setRoomTypeContent(String roomTypeContent) {
		this.roomTypeContent = roomTypeContent;
	}

	public Integer getRoomTypePrice() {
		return roomTypePrice;
	}

	public void setRoomTypePrice(Integer roomTypePrice) {
		this.roomTypePrice = roomTypePrice;
	}

	public Integer getRoomTypeStatus() {
		return roomTypeStatus;
	}

	public void setRoomTypeStatus(Integer roomTypeStatus) {
		this.roomTypeStatus = roomTypeStatus;
	}
	
	
	

	@Override
	public int hashCode() {
		return Objects.hash(roomTypeId, roomAmount, roomTypeName, dogSize, roomTypeContent,roomTypePhoto, roomTypePrice, roomTypeStatus);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null || getClass() != obj.getClass())
			return false;

		RoomType that = (RoomType) obj;
		return roomTypeId.equals(that.roomTypeId) && roomAmount.equals(that.roomAmount) && roomTypeName.equals(that.roomTypeName) && dogSize.equals(that.dogSize) && roomTypeContent.equals(that.roomTypeContent) && roomTypePhoto.equals(that.roomTypePhoto)&& roomTypePrice.equals(that.roomTypePrice) && roomTypeStatus.equals(that.roomTypeStatus);
	}
	
	
}
