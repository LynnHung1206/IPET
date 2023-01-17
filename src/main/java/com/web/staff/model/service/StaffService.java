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

	public Staff login(Staff staff) {
		String account = staff.getAc();
		String password = staff.getPw();
		if(account == null || account.isEmpty()) {
			staff.setMessage("請輸入帳號");
			staff.setSuccessful(false);
			return staff;
		}
		
		
		if(password == null || password.isEmpty()) {
			staff.setMessage("請輸入密碼");
			staff.setSuccessful(false);
			return staff;
		}
		
		staff = dao.getByAcAndPw(staff);
		if(staff == null) {
			staff = new Staff();
			staff.setMessage("帳號或是密碼錯誤");
			staff.setSuccessful(false);
			return staff;
		}
		staff.setMessage("登入成功");
		staff.setSuccessful(true);
		return staff;
		
	}

}
