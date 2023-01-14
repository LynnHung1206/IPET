package com.web.news.model.service;

import java.util.List;

import com.web.news.model.dao.NewsDAO;
import com.web.news.model.dao.NewsDAOImpl;
import com.web.news.model.entity.News;

public class NewsService {

	private NewsDAO dao;
	
	public NewsService() {
		dao = new NewsDAOImpl();
	}
	public Integer add(News news) {
		return dao.add(news);
	}
	public void update(News news) {
		dao.update(news);
	}
	public void delete(Integer newsID) {
		dao.delete(newsID);
	}
	public News getByID(Integer newsID) {
		return dao.getById(newsID);
	}
	public List<News> getAll(){
		return dao.getAll();
	}
	
}
