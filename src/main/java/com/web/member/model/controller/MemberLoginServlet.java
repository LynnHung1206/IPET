package com.web.member.model.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.web.member.model.entity.Member;
import com.web.member.model.service.MemberService;

//@WebServlet("/ipet-back/member/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		System.out.println("有近來");
//		Gson gson = new Gson();
//		Member member = gson.fromJson(req.getReader(), Member.class);
//		if (member == null) {
//			member = new Member();
//			member.setMessage("查無此會員");
//			member.setSuccessful(false);
//			turnToJson(resp, member);
//			return;
//		}
//		MemberService memberSvc = new MemberService();
//		member = memberSvc.login(member);
//		if (member.isSuccessful()) {
//			if (req.getSession(false) != null) {
//				req.changeSessionId();
//			}
//			final HttpSession session = req.getSession();
//			session.setAttribute("loggedin", true);
//			session.setAttribute("member", member);
//			session.setAttribute("memName", member.getMemName());
//			session.setAttribute("memId", member.getMemId());
//		}
//			turnToJson(resp,member);
//	}
//
//	public static void turnToJson(HttpServletResponse res, Member member) {
//		res.setContentType("application/json");
//		Gson gson = new GsonBuilder().create();
//
//		try (PrintWriter Mempw = res.getWriter()) {
//			Mempw.print(gson.toJson(member));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
}
