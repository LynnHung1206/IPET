package com.web.staff.model.dao;

import java.util.*;

import org.hibernate.Session;
import com.web.staff.model.entity.Staff;


public class StaffDAOImpl implements StaffDAO {


	@Override
	public Staff update(Staff staff) {
		Session session = getSession();
		Staff oldstaffVO = session.get(Staff.class, staff.getId());
		oldstaffVO.setName(staff.getName());
		oldstaffVO.setUid(staff.getUid());
		oldstaffVO.setBth(staff.getBth());
		oldstaffVO.setSex(staff.getSex());
		oldstaffVO.setEmail(staff.getEmail());
		oldstaffVO.setPhone(staff.getPhone());
		oldstaffVO.setTel(staff.getTel());
		oldstaffVO.setAdd(staff.getAdd());
		oldstaffVO.setAc(staff.getAc());
		oldstaffVO.setPw(staff.getPw());
		oldstaffVO.setStatus(staff.getStatus());
		oldstaffVO.setPosi(staff.getPosi());
		oldstaffVO.setId(staff.getId());
		return staff;
	}

	@Override
	public List<Staff> getAll() {
		Session session = getSession();
        String hql = "FROM Staff";
        return session.createQuery(hql, Staff.class).list();
	}
		
	@Override
	public Staff getById(Integer id) {
		 Session session = getSession();
	        return session.get(Staff.class, id);
	}
	

	@Override
	public Integer add(Staff staff) {
		Session session = getSession();
		session.persist(staff);
		return staff.getId();
	}

	public List<Staff> getStaffByPosi(String posi) {
		Session session = getSession();
		String hql = "FROM Staff WHERE posi = :posi";
		
		return  session.createQuery(hql,Staff.class)
				.setParameter("posi",posi).list();
	}

	@Override
	public Staff getByAcAndPw(Staff staff) {
		Session session = getSession();
		String hql = "FROM Staff WHERE ac = :ac AND pw = :pw";
		return session.createQuery(hql,Staff.class)
				.setParameter("ac", staff.getAc())
				.setParameter("pw", staff.getPw()).getSingleResult();
	}
}
