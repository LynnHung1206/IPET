package com.web.news.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.news.model.entity.News;
import com.web.news.model.service.NewsService;

@WebServlet({ "/ipet-back/news/addNew", "/ipet-back/news/getAllList","/ipet-back/news/addNewNews","/ipet-back/news/editNews","/ipet-front/news/allNews" })
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if("/ipet-back/news/addNew".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/news/newsEditor.jsp").forward(req, res);
		}
		
		if("/ipet-front/news/allNews".equals(path)) {
			NewsService newsSvc = new NewsService();
			GsonBuilder builder = new GsonBuilder();
			Gson gson = builder.serializeNulls()
					.setDateFormat("yyyy-MM-dd")
					.create();
			List<News> allnews = newsSvc.getAll();
			req.setAttribute("allnews",gson.toJson(allnews));
			System.out.println(gson.toJson(allnews));
			req.getRequestDispatcher("/templates/frontstage/news/news.jsp").forward(req, res);
		}
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if("/ipet-back/news/addNewNews".equals(path)) {
			req.setCharacterEncoding("UTF-8");
			String title = req.getParameter("title");
			String text = req.getParameter("text");
			
			News news = new News();
			news.setTitle(title);
			news.setText(text);
			NewsService newsSvc = new NewsService();
			newsSvc.add(news);
//			TODO 待改網址
			req.getRequestDispatcher("/templates/backstage/news/newsEditor.jsp").forward(req, res);
		}

		
		
	}
	
	

}

