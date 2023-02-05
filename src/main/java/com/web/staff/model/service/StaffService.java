package com.web.staff.model.service;

import java.util.List;

import com.web.staff.model.entity.Staff;

public interface StaffService {

	int addStaff(Staff staff);

	Staff updateStaff(Staff staffVO);

	Staff getStaff(int id);

	List<Staff> getAll();

	boolean findAc(String ac);

	Staff login(Staff staff);

	Integer acAcactive(String ac);

}