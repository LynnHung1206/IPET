package com.web.admin.model.dao;


import com.core.model.dao.CoreDAO;
import com.web.admin.model.entities.Admin;

public interface AdminDAO extends CoreDAO<Admin,Admin.PK>{
//	權限可刪除
	public void update(Admin admin);
	
	
}
