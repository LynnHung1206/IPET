package com.web.admin.model.service;

import java.util.List;

import com.web.admin.model.dao.AdminFuncDAO;
import com.web.admin.model.dao.impl.*;
import com.web.admin.model.entities.AdminFunc;

public class AdminFuncService {

	private AdminFuncDAO dao;

	public AdminFuncService() {
		dao = new AdminFuncDAOImpl();
	}

	public List<AdminFunc> getAll() {
		return dao.getAll();
	}

	public void addAdminFunc(AdminFunc adminFunc) {
		dao.add(adminFunc);
	}

	public void editAdminFunc(AdminFunc adminFunc) {
		dao.update(adminFunc);
	}

	public void getOne(Integer adminId) {
        dao.getById(adminId);
	}
}