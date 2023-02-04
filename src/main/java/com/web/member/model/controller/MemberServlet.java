package com.web.member.model.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.metamodel.SetAttribute;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.member.model.entity.Member;
import com.web.member.model.service.MemberService;
import com.web.pet.model.entity.Pet;
import com.web.pet.model.service.PetService;

@WebServlet({ "/ipet-back/member/allMemberList", "/ipet-back/member/edit", "/ipet-back/member/addNew",
		"/ipet-back/member/listPet", "/ipet-back/member/getAllList", "/ipet-back/member/login",
		"/ipet-back/member/toLogin", "/ipet-back/member/toEdit", "/ipet-front/member/loginOut",
		"/ipet-front/member/forgetPW","/ipet-back/member/changePW","/ipet-back/member/getNewPW",
		"/ipet-back/member/toEditPW"})
public class MemberServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

//	=================================================判斷path=========================================================

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if ("/ipet-back/member/allMemberList".equals(path)) {
			MemberService memberSvc = new MemberService();
			List<Member> list = memberSvc.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/templates/backstage/member/memberList.jsp").forward(req, res);
		}

		if ("/ipet-back/member/addNew".equals(path)) {
			req.getRequestDispatcher("/templates/frontstage/member/register.jsp").forward(req, res);
		}

		if ("/ipet-back/member/toLogin".equals(path)) {
			req.getRequestDispatcher("/templates/frontstage/member/login.jsp").forward(req, res);
		}
		//=========================================================================
		if ("/ipet-front/member/forgetPW".equals(path)) {
			req.getRequestDispatcher("/templates/frontstage/member/forgetPW.jsp").forward(req, res);
		}

		if ("/ipet-front/member/loginOut".equals(path)) {
			req.getSession().invalidate();
			req.getRequestDispatcher("/templates/frontstage/index.jsp").forward(req, res);
		}

		if ("/ipet-back/member/edit".equals(path)) {
			req.getRequestDispatcher("/templates/frontstage/member/update.jsp").forward(req, res);
		}

		if ("/ipet-back/member/toEdit".equals(path)) {
			req.getRequestDispatcher("/templates/frontstage/index.jsp").forward(req, res);
		}

		if ("/ipet-back/member/listPet".equals(path)) {
			PetService petSvc = new PetService();
			HttpSession session = req.getSession();
			Member member = (Member) session.getAttribute("member");
			List<Pet> petList = petSvc.getPetByMemId(member.getMemId());
			req.setAttribute("petList", petList);
			req.getRequestDispatcher("/templates/frontstage/member/petList.jsp").forward(req, res);
		}

		if ("/ipet-back/member/getAllList".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/member/memberList.jsp").forward(req, res);
		}

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String path = req.getServletPath();

		if ("insert".equals(action)) {
			insert(req, res);
		}

		if ("update".equals(action)) {
			update(req, res);
		}

		if ("updatefront".equals(action)) {
			updatefront(req, res);
		}
		if ("/ipet-back/member/toEditPW".equals(path)) {
			toEditPW(req, res);
		}


		if ("updateTemp".equals(action)) {
			Integer memId = Integer.valueOf(req.getParameter("memId"));
			MemberService memberSvc = new MemberService();

			Member member = memberSvc.getMember(memId);

			req.setAttribute("updateMember", member);
			String url = "/templates/backstage/member/update.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		//=============
		if ("/ipet-back/member/getNewPW".equals(path)) {
			String randomNum = req.getParameter("randomNum");
			if((randomNum).equals("R9JKM5")) {
				Integer memId = Integer.valueOf(req.getParameter("memId"));
				MemberService memberSvc = new MemberService();
				
				Member member = memberSvc.getMember(memId);
				
				req.setAttribute("getNewPWMember", member);
				String url = "/templates/frontstage/member/updatePW.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
			req.setAttribute("wrong", "驗證碼有誤");
			String url = "/templates/frontstage/member/getNewPW.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

//		=============================
		if ("/ipet-back/member/changePW".equals(path)) {
			String memAc = req.getParameter("memAc");
			String memEmail = req.getParameter("memEmail");
			MemberService memberSvc = new MemberService();
			Member member = memberSvc.resetPW(memAc);
			if (member == null) {
				req.setAttribute("wrong", "此帳號不存在");
				String url = "/templates/frontstage/member/forgetPW.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
			MemberService memberSVC = new MemberService();
			
			memberSVC.sendMail(memEmail, "IPET寵物商城-密碼修改驗證", "您的驗證碼為 : R9JKM5");
//			HttpSession session = req.getSession();
			req.setAttribute("changePWMemId", member.getMemId());
			String url = "/templates/frontstage/member/getNewPW.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		
		if ("/ipet-back/member/login".equals(path)) {
			String memAc = req.getParameter("memAc");
			String memPw = req.getParameter("memPw");
			if ((memAc == null || memAc.isEmpty()) || (memPw == null || memPw.isEmpty())) {
				req.setAttribute("wrong", "請輸入帳號或密碼");
				String url = "/templates/frontstage/member/login.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
			MemberService memberSvc = new MemberService();
			Member member = memberSvc.login(memAc, memPw);
			if (member == null) {
				req.setAttribute("wrong", "帳號或密碼有誤");
				String url = "/templates/frontstage/member/login.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
			HttpSession session = req.getSession();
			session.setAttribute("member", member);
			String url = "/templates/frontstage/index.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}

	}

//=================================================update=======================================================

	private void update(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memName = req.getParameter("memName");
		String memUid = req.getParameter("memUid");
		String memBthStr = req.getParameter("memBth");
		String memSex = req.getParameter("memSex");
		String memEmail = req.getParameter("memEmail");
		String memPhone = req.getParameter("memPhone");
		String memTel = req.getParameter("memTel");
		String memAdd = req.getParameter("memAdd");
		String memAc = req.getParameter("memAc");
		String memPw = req.getParameter("memPw");
		String memStatusStr = req.getParameter("memStatus");
		String memIdStr = req.getParameter("memId");
		java.sql.Date memBth = Date.valueOf(memBthStr);

		Integer memStatus = Integer.valueOf(memStatusStr);
		Integer memId = Integer.valueOf(memIdStr.toString().trim());

		Member member = new Member();
		member.setMemId(memId);
		member.setMemName(memName);
		member.setMemUid(memUid);
		member.setMemBth(memBth);
		member.setMemSex(memSex);
		member.setMemEmail(memEmail);
		member.setMemPhone(memPhone);
		member.setMemTel(memTel);
		member.setMemAdd(memAdd);
		member.setMemAc(memAc);
		member.setMemPw(memPw);
		member.setMemStatus(memStatus);

		MemberService memberSvc = new MemberService();
		memberSvc.updateMember(member);
//			轉交
		String url = "/templates/backstage/member/memberList.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, res);
	}
//=================================================update=======================================================

	private void updatefront(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memName = req.getParameter("memName");
		String memUid = req.getParameter("memUid");
		String memBthStr = req.getParameter("memBth");
		String memSex = req.getParameter("memSex");
		String memEmail = req.getParameter("memEmail");
		String memPhone = req.getParameter("memPhone");
		String memTel = req.getParameter("memTel");
		String memAdd = req.getParameter("memAdd");
		String memAc = req.getParameter("memAc");
		String memPw = req.getParameter("memPw");
		String memStatusStr = req.getParameter("memStatus");
		String memIdStr = req.getParameter("memId");
		java.sql.Date memBth = Date.valueOf(memBthStr);

		Integer memStatus = Integer.valueOf(memStatusStr);
		Integer memId = Integer.valueOf(memIdStr.toString().trim());

		Member member = new Member();
		member.setMemId(memId);
		member.setMemName(memName);
		member.setMemUid(memUid);
		member.setMemBth(memBth);
		member.setMemSex(memSex);
		member.setMemEmail(memEmail);
		member.setMemPhone(memPhone);
		member.setMemTel(memTel);
		member.setMemAdd(memAdd);
		member.setMemAc(memAc);
		member.setMemPw(memPw);
		member.setMemStatus(memStatus);

		MemberService memberSvc = new MemberService();
		memberSvc.updateMember(member);
//			轉交
		String url = "/templates/frontstage/index.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, res);
	}
//=================================================toEditPW=======================================================
	
	private void toEditPW(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memName = req.getParameter("memName");
		String memUid = req.getParameter("memUid");
		String memBthStr = req.getParameter("memBth");
		String memSex = req.getParameter("memSex");
		String memEmail = req.getParameter("memEmail");
		String memPhone = req.getParameter("memPhone");
		String memTel = req.getParameter("memTel");
		String memAdd = req.getParameter("memAdd");
		String memAc = req.getParameter("memAc");
		String memPw = req.getParameter("memPw");
		String memStatusStr = req.getParameter("memStatus");
		String memIdStr = req.getParameter("memId");
		java.sql.Date memBth = Date.valueOf(memBthStr);
		
		Integer memStatus = Integer.valueOf(memStatusStr);
		Integer memId = Integer.valueOf(memIdStr.toString().trim());
		
		Member member = new Member();
		member.setMemId(memId);
		member.setMemName(memName);
		member.setMemUid(memUid);
		member.setMemBth(memBth);
		member.setMemSex(memSex);
		member.setMemEmail(memEmail);
		member.setMemPhone(memPhone);
		member.setMemTel(memTel);
		member.setMemAdd(memAdd);
		member.setMemAc(memAc);
		member.setMemPw(memPw);
		member.setMemStatus(memStatus);
		
		MemberService memberSvc = new MemberService();
		memberSvc.updateMember(member);
//			轉交
		String url = "/templates/frontstage/index.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, res);
	}

//=================================================insert=======================================================

	private void insert(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memName = req.getParameter("memName");
		String memUid = req.getParameter("memUid");
		String memBthStr = req.getParameter("memBth");
		String memSex = req.getParameter("memSex");
		String memEmail = req.getParameter("memEmail");
		String memPhone = req.getParameter("memPhone");
		String memTel = req.getParameter("memTel");
		String memAdd = req.getParameter("memAdd");
		String memAc = req.getParameter("memAc");
		String memPw = req.getParameter("memPw");
		String memPw2 = req.getParameter("memPw2"); // ========================================

//		List<String> errorMsgs = getErrorMsgs(memName, memUid, memBthStr, memSex, memEmail, memPhone, memTel, memAdd, memAc, memPw);

		java.sql.Date memBth = Date.valueOf(memBthStr);// 將字串轉成sql.Date

		Member member = new Member();
		member.setMemName(memName);
		member.setMemUid(memUid);
		member.setMemBth(memBth);
		member.setMemSex(memSex);
		member.setMemEmail(memEmail);
		member.setMemPhone(memPhone);
		member.setMemTel(memTel);
		member.setMemAdd(memAdd);
		member.setMemAc(memAc);
		member.setMemPw(memPw);
		if (memPw.equals(memPw2)) {
			MemberService memberSvc = new MemberService();
			int memId = memberSvc.addMember(member);
//				轉交
			String url = "/templates/frontstage/member/login.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			return;
		}

		req.setAttribute("wrong", "密碼與確認密碼不符"); // 錯誤訊息
		req.setAttribute("member", member); // 含有輸入格式錯誤的empVO物件,也存入req
		RequestDispatcher failureView = req.getRequestDispatcher("/templates/frontstage/member/register.jsp");
		failureView.forward(req, res);
		return;

	}

//	private List<String> getErrorMsgs(String memName, String memUid, String memBthStr, String memSex, String memEmail, String memPhone,
//			String memTel, String memAdd, String memAc, String memPw) { 
//		List<String> errorMsgs = new LinkedList<String>();
//		String memNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//		if (memName == null || memName.trim().length() == 0) {
//			errorMsgs.add("員工姓名: 請勿空白");
//		} else if (!memName.trim().matches(memNameReg)) {
//			errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//		}
//
//		if (memUid == null || memUid.trim().length() == 0) {
//			errorMsgs.add("請勿空白");
//		}
//
//		try {
//			java.sql.Date memBth = Date.valueOf(memBthStr);
//		} catch (IllegalArgumentException e) {
//			errorMsgs.add("請輸入日期!");
//		}
//
//		if (memSex == null || memSex.trim().length() == 0) {
//			errorMsgs.add("請勿空白");
//		}
//
//		if (memEmail == null || memEmail.trim().length() == 0) {
//			errorMsgs.add("請勿空白");
//		}
//
//		if (memPhone == null || memPhone.trim().length() == 0) {
//			errorMsgs.add("請勿空白");
//		} else if (memPhone.trim().length() != 10) {
//			errorMsgs.add("手機號碼錯誤");
//		}
//		
//		if (memTel == null || memTel.trim().length() == 0) {
//			errorMsgs.add("請勿空白");
//		} else if (memTel.trim().length() != 9) {
//			errorMsgs.add("手機號碼錯誤");
//		}		
//
//		if (memAdd == null || memAdd.trim().length() == 0) {
//			errorMsgs.add("請勿空白");
//		}
//
//		if (memAc == null || memAc.trim().length() == 0) {
//			errorMsgs.add("請勿空白");
//
//		if (memPw == null || memPw.trim().length() == 0) {
//			errorMsgs.add("請勿空白");
//		} 
//
//			return errorMsgs;
//		}
//		return errorMsgs;
//	}

}
