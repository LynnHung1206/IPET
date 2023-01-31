package com.web.pet.model.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.pet.model.entity.Pet;
import com.web.pet.model.service.PetService;
import com.web.member.model.entity.Member;
import com.web.member.model.service.MemberService;

@WebServlet({ "/ipet-back/pet/allPetList", "/ipet-back/pet/edit", "/ipet-back/pet/addNew", "/ipet-back/pet/getAllList",
		"/ipet-back/pet/editPet" , "/ipet-back/pet/editPetFinal"})
public class PetServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if ("/ipet-back/pet/allPetList".equals(path)) {
			PetService petSvc = new PetService();
			List<Pet> list = petSvc.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/templates/backstage/pet/petList.jsp").forward(req, res);
		}
		if ("/ipet-back/pet/addNew".equals(path)) {
			req.getRequestDispatcher("/templates/frontstage/member/petAddNew.jsp").forward(req, res);
		}
		if ("/ipet-back/pet/getAllList".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/pet/petList.jsp").forward(req, res);
		}

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//		insert
		if ("insert".equals(action)) {
			insert(req, res);
		}
		if ("updateTemp".equals(action)) {
			Integer petId = Integer.valueOf(req.getParameter("petId"));
			PetService petSvc = new PetService();
			MemberService memberSvc = new MemberService();

//			Member member = memberSvc.getOneMemberByInt(petId);
			Pet pet = petSvc.getPet(petId);

//			req.setAttribute("member", member);
			req.setAttribute("pet", pet);

			String url = "/templates/frontstage/member/petUpdate.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		if ("updatePet".equals(action)) {
			Integer petId = Integer.valueOf(req.getParameter("petId"));
			PetService petSvc = new PetService();
			MemberService memberSvc = new MemberService();

//			Member member = memberSvc.getOneMemberByInt(petId);
			Pet pet = petSvc.getPet(petId);

//			req.setAttribute("member", member);
			req.setAttribute("updatePet", pet);

			String url = "/templates/backstage/pet/update.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		if ("update".equals(action)) {
			update(req, res);
		}
		if ("updateFinal".equals(action)) {
			updateFinal(req, res);
		}

	}

	private void update(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memIdStr = req.getParameter("memId");
		String petName = req.getParameter("petName");
		String petVarId = req.getParameter("petVarId");
		String petSize = req.getParameter("petSize");
		String petGen = req.getParameter("petGen");
		String petBirthStr = req.getParameter("petBirth");
		String petStatusStr = req.getParameter("petStatus");
		String petIdStr = req.getParameter("petId");
		java.sql.Date petBirth = Date.valueOf(petBirthStr);
		Integer petStatus = Integer.valueOf(petStatusStr);
		Integer petId = Integer.valueOf(petIdStr.toString().trim());
		Integer memId = Integer.valueOf(memIdStr.toString().trim());

		Pet pet = new Pet();
		pet.setPetId(petId);
		pet.setMemId(memId);
		pet.setPetName(petName);
		pet.setPetVarId(petVarId);
		pet.setPetSize(petSize);
		pet.setPetGen(petGen);
		pet.setPetBirth(petBirth);
		pet.setPetStatus(petStatus);
		PetService petSvc = new PetService();
		petSvc.updatePet(pet);

//			轉交
		String url = "/ipet-back/member/listPet";
		res.sendRedirect(req.getContextPath() + url);
		// RequestDispatcher successView = req.(url);
		// successView.forward(req, res);
	}
	
	private void updateFinal(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String memIdStr = req.getParameter("memId");
		String petName = req.getParameter("petName");
		String petVarId = req.getParameter("petVarId");
		String petSize = req.getParameter("petSize");
		String petGen = req.getParameter("petGen");
		String petBirthStr = req.getParameter("petBirth");
		String petStatusStr = req.getParameter("petStatus");
		String petIdStr = req.getParameter("petId");
		java.sql.Date petBirth = Date.valueOf(petBirthStr);
		Integer petStatus = Integer.valueOf(petStatusStr);
		Integer petId = Integer.valueOf(petIdStr.toString().trim());
		Integer memId = Integer.valueOf(memIdStr.toString().trim());
		
		Pet pet = new Pet();
		pet.setPetId(petId);
		pet.setMemId(memId);
		pet.setPetName(petName);
		pet.setPetVarId(petVarId);
		pet.setPetSize(petSize);
		pet.setPetGen(petGen);
		pet.setPetBirth(petBirth);
		pet.setPetStatus(petStatus);
		PetService petSvc = new PetService();
		petSvc.updatePet(pet);
		
//			轉交
		String url = "/ipet-back/pet/allPetList";
		res.sendRedirect(req.getContextPath() + url);
		// RequestDispatcher successView = req.(url);
		// successView.forward(req, res);
	}

	private void insert(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String petName = req.getParameter("petName");
		String petVarId = req.getParameter("petVarId");
		String petSize = req.getParameter("petSize");
		String petGen = req.getParameter("petGen");
		String petBirthStr = req.getParameter("petBirth");
//		String petStatusStr = req.getParameter("petStatus");
		List<String> errorMsgs = getErrorMsgs(petName, petVarId, petSize, petGen, petBirthStr);
		java.sql.Date petBirth = Date.valueOf(petBirthStr);
//		Integer petStatus = Integer.valueOf(petStatusStr);

		Pet pet = new Pet();
		pet.setMemId(((Member) req.getSession().getAttribute("member")).getMemId());
		pet.setPetName(petName);
		pet.setPetVarId(petVarId);
		pet.setPetSize(petSize);
		pet.setPetGen(petGen);
		pet.setPetBirth(petBirth);
		pet.setPetStatus(1);

		if (!errorMsgs.isEmpty()) {
			req.setAttribute("pet", pet); // 含有輸入格式錯誤的empVO物件,也存入req
			RequestDispatcher failureView = req.getRequestDispatcher("/templates/frontstage/member/petAddNew.jsp");
			failureView.forward(req, res);
			return;
		}

		PetService petSvc = new PetService();
		int petId = petSvc.addPet(pet);

//		MemberService memberSvc = new MemberService();
//		Member member = memberSvc.addPetOnMember(memberInt, staffid);

//			轉交
		String url = "/ipet-back/member/listPet";
		res.sendRedirect(req.getContextPath() + url);
//		String url = "/templates/backstage/pet/petList.jsp";
//		RequestDispatcher successView = req.getRequestDispatcher(url);
//		successView.forward(req, res);
	}

	private List<String> getErrorMsgs(String petName, String petVarId, String petSize, String petGen,
			String petBirthStr) {
		List<String> errorMsgs = new LinkedList<String>();
		String petNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
		if (petName == null || petName.trim().length() == 0) {
			errorMsgs.add("寵物姓名: 請勿空白");
		} else if (!petName.trim().matches(petNameReg)) {
			errorMsgs.add("寵物姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
		}

		if (petVarId == null || petVarId.trim().length() == 0) {
			errorMsgs.add("請勿空白");
		}

		if (petSize == null || petSize.trim().length() == 0) {
			errorMsgs.add("請勿空白");
		}

		if (petGen == null || petGen.trim().length() == 0) {
			errorMsgs.add("請勿空白");
		}

		try {
			java.sql.Date petBirth = Date.valueOf(petBirthStr);
		} catch (IllegalArgumentException e) {
			errorMsgs.add("請輸入日期!");
		}

		return errorMsgs;
	}

}
