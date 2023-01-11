package com.web.admin.model.dao;


import com.core.model.dao.CoreDAO;
import com.web.admin.model.entities.AdminFunc;

public interface AdminFuncDAO extends CoreDAO<AdminFunc,Integer>{

		public void update(AdminFunc adminFunc) ;
//		不會對功能做刪除,資料會變斷頭資料
}
