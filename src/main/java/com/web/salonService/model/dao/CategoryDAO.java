package com.web.salonService.model.dao;

import com.core.model.dao.CoreDAO;
import com.web.salonService.model.entities.Category;

public interface CategoryDAO extends CoreDAO<Category, Integer>{

	Integer deleteById(Integer catId);
	
}
