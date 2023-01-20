package com.web.index.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Yu-Jing
 * @create 2023/1/3 上午 09:58
 */

@WebServlet({ "/ipet-back/home", "/ipet-front/home" })
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// avoid sending requests repeatedly
		String path = req.getServletPath();
		if ("/ipet-back/home".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/back-index.jsp").forward(req, resp);
		}
		
		if("/ipet-front/home".equals(path)) {
			req.getRequestDispatcher("/templates/frontstage/index.jsp").forward(req, resp);
		}
	}
}
