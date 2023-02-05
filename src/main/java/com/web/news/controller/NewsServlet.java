package com.web.news.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.news.model.entity.News;
import com.web.news.model.service.NewsService;
import com.web.news.model.service.impl.NewsServiceImpl;

@WebServlet({ "/ipet-back/news/addNew", "/ipet-back/news/getAllList","/ipet-back/news/addNewNews","/ipet-back/news/editNews","/ipet-front/news/allNews","/ipet-front/news/deleteNews" })
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if("/ipet-back/news/addNew".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/news/newsEditor.jsp").forward(req, res);
		}
		
		if("/ipet-front/news/allNews".equals(path)) {
			turnToGson(req);
			req.getRequestDispatcher("/templates/frontstage/news/news.jsp").forward(req, res);
		}
		if("/ipet-back/news/getAllList".equals(path)) {
			turnToGson(req);
			req.getRequestDispatcher("/templates/backstage/news/allNews.jsp").forward(req, res);
		}
		
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		if("/ipet-back/news/addNewNews".equals(path)) {
			String title = req.getParameter("title");
			String text = req.getParameter("text");
			
			News news = new News();
			news.setTitle(title);
			news.setText(text);
			NewsService newsSvc = new NewsServiceImpl();
			newsSvc.add(news);
			turnToGson(req);
			req.getRequestDispatcher("/templates/backstage/news/allNews.jsp").forward(req, res);
		}
		
		if("/ipet-back/news/editNews".equals(path)) {
			String idStr = req.getParameter("id");
			String title = req.getParameter("title");
			String text = req.getParameter("text");
			
			Integer id = Integer.valueOf(idStr);
			
			News news = new News();
			news.setId(id);
			news.setTitle(title);
			news.setText(text);
			NewsService newsSvc = new NewsServiceImpl();
			newsSvc.update(news);
			
			turnToGson(req);
			
			req.getRequestDispatcher("/templates/backstage/news/allNews.jsp").forward(req, res);
		}
		
		if("/ipet-front/news/deleteNews".equals(path)) {
			String idStr = req.getParameter("newsId");
			Integer id = Integer.valueOf(idStr);
			NewsService newsSvc = new NewsServiceImpl();
			newsSvc.delete(id);
			turnToGson(req);
			req.getRequestDispatcher("/templates/backstage/news/allNews.jsp").forward(req, res);
		}

		
		
	}
	public void turnToGson(HttpServletRequest req) {
		NewsService newsSvc = new NewsServiceImpl();
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.serializeNulls()
				.setDateFormat("yyyy-MM-dd")
				.create();
		List<News> allnews = newsSvc.getAll();
		req.setAttribute("allnews",gson.toJson(allnews));
	}
	
	

}

