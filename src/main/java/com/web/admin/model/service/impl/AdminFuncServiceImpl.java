package com.web.admin.model.service.impl;

import java.util.List;

import com.web.admin.model.dao.AdminFuncDAO;
import com.web.admin.model.dao.impl.*;
import com.web.admin.model.entities.AdminFunc;
import com.web.admin.model.service.AdminFuncService;

public class AdminFuncServiceImpl implements AdminFuncService {

	private AdminFuncDAO dao;

	public AdminFuncServiceImpl() {
		dao = new AdminFuncDAOImpl();
	}

	@Override
	public List<AdminFunc> getAll() {
		return dao.getAll();
	}

	@Override
	public void addAdminFunc(AdminFunc adminFunc) {
		dao.add(adminFunc);
	}

	@Override
	public void editAdminFunc(AdminFunc adminFunc) {
		dao.update(adminFunc);
	}

	@Override
	public void getOne(Integer adminId) {
        dao.getById(adminId);
	}
}