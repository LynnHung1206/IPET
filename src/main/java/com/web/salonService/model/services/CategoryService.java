package com.web.salonService.model.services;

import java.util.List;
import com.web.salonService.model.dao.CategoryDAO;
import com.web.salonService.model.dao.impl.CategoryImpl;
import com.web.salonService.model.entities.Category;

public class CategoryService {
	private CategoryDAO dao;
	
	public CategoryService() {
		dao = new CategoryImpl();
	}
	
	public Category addCategory(String catName, 
			byte[] catImg, Integer catStatus) {
		
		Category category = new Category();
		
		category.setCatName(catName);
		category.setCatImg(catImg);
		category.setCatStatus(catStatus);
		dao.add(category);
		
		return category;
	}
	
	public Category updateCategory(Integer catId, String catName, 
			byte[] catImg, Integer catStatus) {
		
		Category category = new Category();
		
		category.setCatId(catId);
		category.setCatName(catName);
		category.setCatImg(catImg);
		category.setCatStatus(catStatus);
		dao.add(category);
		
		return dao.getById(catId);
	}
	
	public void deleteCategory(Integer catId) {
		dao.deleteById(catId);
	}
	
	public Category getOneCategory(Integer catId) {
		return dao.getById(catId);
	}
	
	public List<Category> selectAll(){
		return dao.getAll();
	}
}
