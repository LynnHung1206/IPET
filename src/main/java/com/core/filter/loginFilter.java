package com.core.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({"/ipet-back/staff/*","/ipet-back/news/*"})
public class loginFilter  extends HttpFilter  {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = req.getSession();
		Object id = session.getAttribute("id");
		
		
		if(id != null) {
			chain.doFilter(req, res);
		}else {
			req.getRequestDispatcher("/templates/backstage/login.jsp").forward(req, res);
		}
	}


}
