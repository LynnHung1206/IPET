package com.web.news.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.news.model.entity.News;
import com.web.news.model.service.NewsService;

@WebServlet({ "/ipet-back/news/addNew", "/ipet-back/news/getAllList","/ipet-back/news/addNewNews","/ipet-back/news/editNews" })
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if("/ipet-back/news/addNew".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/news/newsEditor.jsp").forward(req, res);
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

