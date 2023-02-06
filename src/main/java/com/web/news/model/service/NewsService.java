package com.web.news.model.service;

import java.util.List;

import com.web.news.model.entity.News;

public interface NewsService {

	Integer add(News news);

	void update(News news);

	void delete(Integer newsID);

	News getByID(Integer newsID);

	List<News> getAll();

}