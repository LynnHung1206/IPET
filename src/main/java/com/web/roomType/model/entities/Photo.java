package com.web.roomType.model.entities;

import java.io.Serial;
import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import com.core.model.entities.Core;
import com.web.appoint.model.entities.AppointmentDetail.PK;
import com.web.roomType.model.service.RoomTypeService;
import com.web.salonService.model.entities.PetType;
import com.web.salonService.model.services.PetTypeService;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Entity
@Table(name = "ROOM_TYPE_PHOTO", catalog = "ipetdb")
public class Photo extends Core{
	@Serial
	private static final long serialVersionUID = 2L;
	public static class PK implements Serializable{
		@Serial
		private static final long serialVersionUID = 22L;
		@Column(name ="ROOM_TYPE_PHOTO_ID")
		@Id
		public Integer roomTypePhotoId;
		@Column(name ="ROOM_TYPE_ID")
		@Id
		public Integer roomTypeId;
		
		@Override
		public boolean equals(Object o) {
			if (this == o) return true;
			if (o == null || getClass() != o.getClass()) return false;
			PK pk = (PK) o;
			return roomTypePhotoId.equals(pk.roomTypePhotoId) && roomTypeId.equals(pk.roomTypeId);
		}
		
		@Override 
		public int hashCode() {
			return Objects.hash(roomTypePhotoId,roomTypeId);
		} 
	}
	
	@Id
	@Column(name = "ROOM_TYPE_PHOTO_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer roomTypePhotoId;
	
	@Column(name = "ROOM_TYPE_ID")
	private Integer roomTypeId;
	
	@Column(name = "ROOM_TYPE_PHOTO")
	private byte[] roomTypePhoto;
	
	public Photo(Integer roomTypePhotoId, Integer roomTypeId, byte[] roomTypePhoto) {
		this.roomTypePhotoId=roomTypePhotoId;
		this.roomTypeId=roomTypeId;
		this.roomTypePhoto=roomTypePhoto;
	}
	
	public Photo(Integer roomTypeId, byte[] roomTypePhoto) {
		this.roomTypeId=roomTypeId;
		this.roomTypePhoto=roomTypePhoto;
	}
	public Photo() {}

	public Integer getRoomTypePhotoId() {
		return roomTypePhotoId;
	}

	public void setRoomTypePhotoId(Integer roomTypePhotoId) {
		this.roomTypePhotoId = roomTypePhotoId;
	}

	public Integer getRoomTypeId() {
		return roomTypeId;
	}

	public void setRoomTypeId(Integer roomTypeId) {
		this.roomTypeId = roomTypeId;
	}

	public byte[] getRoomTypePhoto() {
		return roomTypePhoto;
	}

	public void setRoomTypePhoto(byte[] roomTypePhoto) {
		this.roomTypePhoto = roomTypePhoto;
	} 
	
	//for join roomTypeId to roomTypeVO
		public RoomType getRoomTypeVO() {
			RoomTypeService roomTypeService = new RoomTypeService();
			RoomType roomType = roomTypeService.getOneRoomType(roomTypeId);
			return roomType;
		}
	
	@Override
	public int hashCode() {
		return Objects.hash(roomTypePhotoId);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Photo other = (Photo) obj;
		return Objects.equals(roomTypePhotoId, other.roomTypePhotoId);
	}
}
