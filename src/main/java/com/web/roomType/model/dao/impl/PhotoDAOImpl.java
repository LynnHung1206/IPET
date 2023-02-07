package com.web.roomType.model.dao.impl;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.hibernate.Session;
import org.hibernate.engine.jdbc.batch.spi.Batch;

import com.web.roomType.model.dao.PhotoDAO;
import com.web.roomType.model.entities.Photo;
import com.web.salonService.model.entities.Service;


public class PhotoDAOImpl implements PhotoDAO{
	
//	@Override
//	public Photo add(Photo photo) {
//		Session session = getSession();
//		session.persist(photo);
//		Photo.PK pk = new Photo.PK();
//		pk.roomTypeId =photo.getRoomTypeId();
//		pk.roomTypePhotoId = photo.getRoomTypePhotoId();
//		return pk;
//	}
//	
//	@Override
//	public Photo.PK[] addBatch(Photo[] photos) {
//		Session session =getSession();
//		Photo.PK[] pks =new Photo.PK[photos.length];
//		int i =0;
//		for(Photo photo :photos) {
//			session.persist(photo);
//			Photo.PK pk = new Photo.PK();
//			pk.roomTypeId =photo.getRoomTypeId();
//			pk.roomTypePhotoId=photo.getRoomTypePhotoId();
//			pks[i]= pk;
//			i++;
//		}
//		return pks;
//	}
	
	
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

	@Override
	public List<Photo> getAllPhotosByRoomTypeId(Integer roomTypeId) {
		Session session =getSession();
		String hql ="FROM Photo WHERE roomTypeId = :roomTypeId";
		return session.createQuery(hql, Photo.class).setParameter("roomTypeId", roomTypeId).list();
	}

	@Override
	public Photo getById(Byte id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Byte add(Photo t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer deleteById(Integer roomTypePhotoId) {
		// TODO Auto-generated method stub
		return null;
	}
}
