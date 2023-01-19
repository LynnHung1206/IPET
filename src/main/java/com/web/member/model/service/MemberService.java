package com.web.member.model.service;



import com.web.member.model.dao.MemberDAO;
import com.web.member.model.dao.MemberDAOImpl;
import com.web.member.model.entity.Member;
import com.web.staff.model.entity.Staff;

import java.util.List;

public class MemberService {
	
	private MemberDAO dao;
	
	public MemberService() {
		dao = new MemberDAOImpl();
	}
	
	int memId = 0;
	
	public int addMember(Member memberVO) {
		memId = dao.add(memberVO);
		return memId;
	}
	
	public Member updateMember(Member memberVO) {
		return dao.update(memberVO);
	}
	
	public Member getMember(int memId) {
		Member memberVO = dao.getById(memId);
			return memberVO;
	}
	
	public List<Member> getAll(){
		return dao.getAll();
	}

	public Member login(String memAc,String memPw) {
//		String memAc = member.getMemAc();
//		String memPw = member.getMemPw();

		
		Member member = dao.getByAcAndPw(memAc, memPw);
		
		return member;
	}
	
	public boolean findMemAc(String memAc) {
		return true;
	}
	
}
