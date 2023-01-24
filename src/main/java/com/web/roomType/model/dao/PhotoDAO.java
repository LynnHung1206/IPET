package com.web.roomType.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.roomType.model.entities.Photo;

public interface PhotoDAO extends CoreDAO<Photo, Integer>{
	
	Integer deleteById(Integer roomTypePhotoId);
	
	List<Photo> findRoomTypePhotoId(Integer roomTypePhotoId);
}
