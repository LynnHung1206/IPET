package com.web.admin.model.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.NativeQuery;

import com.web.admin.model.dao.AdminDAO;
import com.web.admin.model.entities.Admin;

public class AdminDAOImpl implements AdminDAO {

	@Override
	public void update(Admin admin) {
		Session session = getSession();
		String hql = "UPDATE Admin SET adminID = :adminid WHERE  staffID = :staffid";
		System.out.println("admin.getStaffID()"+admin.getStaffID());
		System.out.println("admin.getAdminID()"+admin.getAdminID());
		
		 int i = session.createQuery(hql).setParameter("staffid", admin.getStaffID())
				.setParameter("adminid", admin.getAdminID()).executeUpdate();
		 System.out.println(i);
		

	}

	@Override
	public List<Admin> getAll() {
		Session session = getSession();
		String hql = "FROM Admin";
		return session.createQuery(hql, Admin.class).list();
	}

	@Override
	public Admin getById(Admin.PK staffId) {
		Session session = getSession();
		return session.get(Admin.class, staffId);
	}

	@Override
	public Admin.PK add(Admin admin) {
		Session session = getSession();
		session.persist(admin);
		Admin.PK pk = new Admin.PK();
		pk.adminID = admin.getAdminID();
		pk.staffID = admin.getStaffID();
		return pk;
	}

	public Admin getOneAdminByInt(Integer staffId) {
		Session session = getSession();
		String hql = "FROM Admin WHERE staffID = :staffid ";

		return session.createQuery(hql, Admin.class).setParameter("staffid", staffId).getSingleResult();
	}

	public List<Admin.PK> getPk(Integer staffId) {
		Session session = getSession();
		String hql = "FROM Admin WHERE staffID = :staffid ";
		return session.createQuery(hql, Admin.PK.class).setParameter("staffid", staffId).getResultList();
	}

}
