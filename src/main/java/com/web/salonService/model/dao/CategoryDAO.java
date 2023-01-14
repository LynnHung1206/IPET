package com.web.salonService.model.dao;

import java.util.List;
import com.core.model.dao.CoreDAO;
import com.web.salonService.model.entities.Category;
import com.web.salonService.model.entities.Service;

public interface CategoryDAO extends CoreDAO<Category, Integer>{

	Integer deleteById(Integer catId);
	
	List<Service> findSvcByCatId(Integer catId);
}
