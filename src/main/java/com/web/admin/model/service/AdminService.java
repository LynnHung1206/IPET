package com.web.admin.model.service;

import java.util.List;

import com.web.admin.model.entities.Admin;
import com.web.admin.model.entities.Admin.PK;

public interface AdminService {

	Admin addAdminOnStaff(Integer adminId, Integer staffId);

	List<Admin> getAll();

	Admin getOneAdmin(Admin.PK staffId);

	Admin getOneAdminByInt(Integer staffId);

	List<Admin.PK> getPk(Integer staffId);

	void update(Admin admin);

}