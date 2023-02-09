package com.web.roomType.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.roomType.model.entities.Photo;

public interface PhotoDAO extends CoreDAO<Photo, Byte>{
	Integer deleteById(Integer roomTypePhotoId);
	List<Photo> getAllPhotosByRoomTypeId(Integer roomTypeId);
}
