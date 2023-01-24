package com.web.roomType.model.dao.impl;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

import com.web.roomType.model.dao.PhotoDAO;
import com.web.roomType.model.entities.Photo;
import com.web.salonService.model.entities.Service;


public class PhotoDAOImpl implements PhotoDAO{
	
	@Override
	public Integer add(Photo photo) {
		getSession().merge(photo);
		return photo.getRoomTypePhotoId();
	}
	
	@Override
	public Integer deleteById(Integer roomTypePhotoId) {
		Photo photo = new Photo();
		photo.setRoomTypePhotoId(roomTypePhotoId);
		
		getSession().remove(photo);
		return roomTypePhotoId;
	}
	
	@Override
	public Photo getById(Integer roomTypePhotoId) {
		return getSession().get(Photo.class,roomTypePhotoId);
		
	}
	
	@Override 
	public List<Photo> getAll(){
		final String hql = "from ROOM_TYPE_PHOTO order by ROOM_TYPE_PHOTO_ID ";
		return getSession().createQuery(hql, Photo.class).list();
	}
	
	public List<Photo> findRoomTypePhotoId(Integer roomTypePhotoId){
		final String hql = "from ROOM_TYPE_PHOTO where catId = :catId ORDER BY svcId";
		return getSession().createQuery(hql, Photo.class)
				.setParameter("roomTypePhotoId", roomTypePhotoId)
				.list();
	}
}
