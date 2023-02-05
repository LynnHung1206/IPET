package com.web.salonService.model.services;

import java.util.List;

import com.web.salonService.model.dao.CategoryDAO;
import com.web.salonService.model.dao.impl.CategoryDAOImpl;
import com.web.salonService.model.entities.Category;

public class CategoryService {
	private CategoryDAO dao;
	
	public CategoryService() {
		dao = new CategoryDAOImpl();
	}
	
	public Category addCategory(String catName, byte[] catImg, Integer catStatus) {
		
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
	
	public Category deleteCategory(Integer catId) {
		Category category = dao.getById(catId);
		dao.deleteById(catId);
		return category;
	}
	
	public Category getOneCategory(Integer catId) {
		return dao.getById(catId);
	}
	
	public List<Category> selectAll(){
		return dao.getAll();
	}
	
}
