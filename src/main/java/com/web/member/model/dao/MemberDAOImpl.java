package com.web.member.model.dao;

import java.util.*;

import javax.persistence.NoResultException;

import org.hibernate.Session;

import com.web.member.model.entity.Member;



public class MemberDAOImpl implements MemberDAO{
	
	
	@Override
	public Member update(Member member) {
		Session session = getSession();
		Member oldmemberVO = session.get(Member.class, member.getMemId());
		oldmemberVO.setMemName(member.getMemName());
		oldmemberVO.setMemUid(member.getMemUid());
		oldmemberVO.setMemBth(member.getMemBth());
		oldmemberVO.setMemSex(member.getMemSex());
		oldmemberVO.setMemEmail(member.getMemEmail());
		oldmemberVO.setMemPhone(member.getMemPhone());
		oldmemberVO.setMemTel(member.getMemTel());
		oldmemberVO.setMemAdd(member.getMemAdd());
		oldmemberVO.setMemAc(member.getMemAc());
		oldmemberVO.setMemPw(member.getMemPw());
		oldmemberVO.setMemStatus(member.getMemStatus());
		oldmemberVO.setMemId(member.getMemId());
		System.out.println(member.toString()+"impl");
		return member;
	}

	@Override
	public Member getById(Integer memId) {
		 Session session = getSession();
	        return session.get(Member.class, memId);
	}

	@Override
	public Integer add(Member member) {
		System.out.println(member+"impl-before");
		Session session = getSession();
		session.persist(member);
		System.out.println(member+"daoimpl");
		return member.getMemId();
	}

	@Override
	public List<Member> getAll() {
		Session session = getSession();
        String hql = "FROM Member";
        return session.createQuery(hql,Member.class).list();
	}
	
	public Member getMemberByName(String memName) {
		Session session = getSession();
		String hql = "FROM Member WHERE memName = :memName";
		
		return  session.createQuery(hql,Member.class)
				.setParameter("memName", memName).getSingleResult();
	}

	@Override
	public Member getByAcAndPw(String memAc, String memPw) {
		Session session = getSession();
		String hql = "FROM Member WHERE memAc = :memAc and memPw = :memPw";
		try {
			return session.createQuery(hql,Member.class)
					.setParameter("memAc", memAc).setParameter("memPw", memPw).getSingleResult();
			
		} catch (NoResultException e) {
			return null;
		}
				
	}
	@Override
	public Member getByMemAc(String memAc) {
		Session session = getSession();
		String hql = "FROM Member WHERE memAc = :memAc";
		try {
			return session.createQuery(hql,Member.class)
					.setParameter("memAc", memAc).getSingleResult();
			
		} catch (NoResultException e) {
			return null;
		}
		
	}
	
//	public static void main(String[] args) {
//		MemberDAOImpl xx = new MemberDAOImpl();
//		System.out.println(xx.getAll());		
//	}
}
