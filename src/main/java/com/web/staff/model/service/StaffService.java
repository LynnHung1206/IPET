package com.web.staff.model.service;



import java.util.List;

import com.web.admin.model.dao.AdminDAO;
import com.web.admin.model.dao.AdminFuncDAO;
import com.web.admin.model.dao.impl.AdminDAOImpl;
import com.web.admin.model.dao.impl.AdminFuncDAOImpl;
import com.web.staff.model.dao.StaffDAO;
import com.web.staff.model.dao.StaffDAOImpl;
import com.web.staff.model.entity.Staff;

public class StaffService {

	private StaffDAO dao;
	private AdminDAO admindao;
	private AdminFuncDAO adminFuncdao;
	
	public StaffService() {
		dao = new StaffDAOImpl();
		admindao = new AdminDAOImpl();
		adminFuncdao = new AdminFuncDAOImpl();
	}

	int id = 0;

	public int addStaff(Staff staffVO) {
		id = dao.add(staffVO);
		return id;
	}
	
	public Staff updateStaff(Staff staffVO) {
		return dao.update(staffVO);
	}
	
	
	public Staff getStaff(int id) {
		Staff staffVO = dao.getById(id);
		return staffVO;
	}
	
	public List<Staff> getAll() {
		return dao.getAll();
	}

	

}
