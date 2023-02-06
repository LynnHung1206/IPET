package com.web.news.model.dao.impl;


import java.util.List;
import org.hibernate.Session;

import com.web.news.model.dao.NewsDAO;
import com.web.news.model.entity.News;

public class NewsDAOImpl implements NewsDAO {
	
	@Override
	public void update(News news) {
		Session session = getSession();
		News oldNewsVO = session.get(News.class, news.getId());
		oldNewsVO.setId(news.getId());
		oldNewsVO.setTitle(news.getTitle());
		oldNewsVO.setText(news.getText());
	}
	
	@Override
	public void delete(Integer newsID) {
		Session session = getSession();
		News news = new News();
		news.setId(newsID);
		session.remove(news);
	}

	@Override
	public List<News> getAll() {
		Session session = getSession();
		String hql = "FROM News";
		return session.createQuery(hql,News.class).list();
	}

	@Override
	public News getById(Integer newsID) {
		Session session = getSession();
		return session.get(News.class, newsID);
	}

	@Override
	public Integer add(News news) {
		Session session = getSession();
		session.persist(news);
		return news.getId();

	}


}
