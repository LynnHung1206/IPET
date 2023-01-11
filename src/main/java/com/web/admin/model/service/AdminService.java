package com.web.admin.model.service;

import java.util.List;

import com.web.admin.model.dao.AdminDAO;
import com.web.admin.model.dao.impl.AdminDAOImpl;
import com.web.admin.model.entities.Admin;

public class AdminService {
	private AdminDAO dao;
	
	public AdminService() {
		dao = new AdminDAOImpl();
	}
	
	public Admin addAdminOnStaff(Integer adminId,Integer staffId) {
		
		Admin admin = new Admin();
		admin.setAdminID(adminId);
		admin.setStaffID(staffId);
		dao.add(admin);
		
		return admin;
	}
	public List<Admin> getAll(){
		return dao.getAll();
	}
	
	public Admin getOneAdmin(Admin.PK staffId) {
		return dao.getById(staffId);
	}
	
	public Admin getOneAdminByInt(Integer staffId) {
		return ((AdminDAOImpl) dao).getOneAdminByInt(staffId);
	}
	
	public List<Admin.PK> getPk(Integer staffId){
		return ((AdminDAOImpl) dao).getPk(staffId)
;	}
	
}
