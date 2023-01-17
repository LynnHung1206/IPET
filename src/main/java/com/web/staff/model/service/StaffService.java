package com.web.staff.model.service;

import java.util.List;

import com.web.staff.model.dao.StaffDAO;
import com.web.staff.model.dao.StaffDAOImpl;
import com.web.staff.model.entity.Staff;

public class StaffService {

	private StaffDAO dao;
	
	public StaffService() {
		dao = new StaffDAOImpl();
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

	public boolean login(Staff staff) {
		if(staff == null) {
			return false;
		}
		final String account = staff.getAc();
		final String password = staff.getPw();
		if(account == null || account.isEmpty()) {
			return false;
		}
		if(password == null || password.isEmpty()) {
			return false;
		}
		return dao.getByAcAndPw(staff)!= null;
	}

}
