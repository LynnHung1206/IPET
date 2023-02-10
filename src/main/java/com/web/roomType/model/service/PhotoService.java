package com.web.roomType.model.service;

import java.util.List;
import com.web.roomType.model.dao.PhotoDAO;
import com.web.roomType.model.dao.impl.PhotoDAOImpl;
import com.web.roomType.model.entities.Photo;

public class PhotoService {
	private PhotoDAO dao;

	public PhotoService() {
		dao = new PhotoDAOImpl();
	}

	public Photo addPhoto(Integer roomTypeId, byte[] roomTypePhoto) {

		Photo photo = new Photo();

		photo.setRoomTypeId(roomTypeId);
		photo.setRoomTypePhoto(roomTypePhoto);
		dao.add(photo);

		return photo;

	}

//	public Photo updatePhoto(Integer roomTypePhotoId, Integer roomTypeId, byte[] roomTypePhoto) {
//
//		Photo photo = new Photo();
//
//		photo.setRoomTypePhotoId(roomTypePhotoId);
//		photo.setRoomTypeId(roomTypeId);
//		photo.setRoomTypePhoto(roomTypePhoto);
//		dao.add(photo);
//
//		return dao.getOneByRoomTypeId(roomTypeId);
//	}
//
//	public void deletePhoto(Integer roomTypePhotoId) {
//		dao.deleteByRoomTypeId(roomTypePhotoId);
//	}
//
//	public Photo getonePhoto(Integer roomTypePhotoId) {
//		return dao.getById(roomTypePhotoId);
//
//	}

	public List<Photo> selectAll() {
		return dao.getAll();
	}
}
