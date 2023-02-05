package com.web.staff.model.dao;

import java.util.*;

import com.core.model.dao.CoreDAO;
import com.web.staff.model.entity.Staff;

public interface StaffDAO extends CoreDAO<Staff,Integer> {

	public Staff update(Staff Staff);
	public List<Staff> getAll();
	public List<Staff> getStaffByPosi(String posi);
	public Staff getByAcAndPw(Staff staff);
	public boolean getAc(String ac);
	public Integer acActive(String ac) ;
}
