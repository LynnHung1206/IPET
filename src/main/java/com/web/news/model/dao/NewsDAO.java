package com.web.news.model.dao;


import com.core.model.dao.CoreDAO;
import com.web.news.model.entity.News;

public interface NewsDAO extends CoreDAO<News,Integer>{

	public void update(News news);
	public void delete(Integer id);
}
