package com.core.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({ "/ipet-front/salon/addAppointment" })
public class frontLoginFilter extends HttpFilter {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = req.getSession();
<<<<<<< HEAD
		Member member = (Member) session.getAttribute("member");
		if (member.getMemId() != null) {
=======
		Object memId = session.getAttribute("member");

		if (memId != null) {
>>>>>>> dd1ca7fc1077a7f247c3f6aa90a9411141a8a53d
			chain.doFilter(req, res);
		} else {
			req.getRequestDispatcher("/templates/frontstage/member/login.jsp").forward(req, res);
		}
	}
}
