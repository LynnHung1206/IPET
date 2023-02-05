package com.web.member.model.dao;

import java.util.*;

import com.core.model.dao.CoreDAO;
import com.web.member.model.entity.Member;

public interface MemberDAO extends CoreDAO<Member,Integer>{
	
	public Member update(Member Member);

	public List<Member> getAll();

	public Member getByAcAndPw(String memAc, String memPw);

	public Member getByMemAc(String memAc);

}
