package com.core.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({ "/ipet-front/prod/fromProductDetailWish","/ipet-front/prod/fromProductDetailCart"})
public class ListgLoginFilter extends HttpFilter {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = req.getSession();
		Object memId = session.getAttribute("member");
		if (memId != null) {
			chain.doFilter(req, res);
		} else {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().print(0);
		}
		
	}
}