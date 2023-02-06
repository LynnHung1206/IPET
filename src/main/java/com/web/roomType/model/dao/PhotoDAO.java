package com.web.roomType.model.dao;

import java.util.List;

import com.core.model.dao.CoreDAO;
import com.web.roomType.model.entities.Photo;

public interface PhotoDAO extends CoreDAO<Photo, Photo.PK>{
	Photo.PK[] addBatch(Photo[] ts);
	Integer deleteByRoomTypeId(Integer roomTypeId);
	List<Photo> getAllPhotosByRoomTypeId(Integer roomTypeId);
}
