package com.web.admin.model.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.web.admin.model.dao.AdminFuncDAO;
import com.web.admin.model.entities.AdminFunc;

public class AdminFuncDAOImpl implements AdminFuncDAO {
	
	@Override
	public void update(AdminFunc adminFuncVO) {

		Session session = getSession();
		AdminFunc oldadminFuncVO = session.get(AdminFunc.class, adminFuncVO.getAdminID());
		oldadminFuncVO.setAdminID(adminFuncVO.getAdminID());
		oldadminFuncVO.setAdminName(adminFuncVO.getAdminName());
		}
		
	@Override
	public List<AdminFunc> getAll() {
		Session session = getSession();
		String hql = "FROM AdminFunc";
		return session.createQuery(hql,AdminFunc.class).list();
	}

	@Override
	public AdminFunc getById(Integer adminID) {
		Session session = getSession();
		return session.get(AdminFunc.class, adminID);
	}

	@Override
	public Integer add(AdminFunc adminFuncVO) {
		Session session = getSession();
        session.persist(adminFuncVO);
        return adminFuncVO.getAdminID();
	}

}
