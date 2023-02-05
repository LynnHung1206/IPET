package com.web.staff.model.controller;

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

import com.web.admin.model.entities.Admin;
import com.web.admin.model.service.AdminService;
import com.web.staff.model.entity.Staff;
import com.web.staff.model.service.StaffService;

@WebServlet({ "/ipet-back/staff/allStaffList", "/ipet-back/staff/edit", "/ipet-back/staff/addNew",
		"/ipet-back/staff/getAllList", "/ipet-back/staff/checkAc", "/ipet-back/staff/checkStatus" })
public class StaffServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String path = req.getServletPath();
		if ("/ipet-back/staff/allStaffList".equals(path)) {
			StaffService staffSvc = new StaffService();
			List<Staff> list = staffSvc.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/templates/backstage/staff/staffList.jsp").forward(req, res);
		}
		if ("/ipet-back/staff/addNew".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/staff/register.jsp").forward(req, res);
		}
		if ("/ipet-back/staff/getAllList".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/staff/staffList.jsp").forward(req, res);
		}

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String path = req.getServletPath();

		System.out.println("經過這裡");
		// insert
		if ("insert".equals(action)) {
			insert(req, res);
		}
		if ("updateTemp".equals(action)) {
			Integer staffId = Integer.valueOf(req.getParameter("staffId"));
			StaffService staffSvc = new StaffService();
			AdminService adminSvc = new AdminService();

			Admin admin = adminSvc.getOneAdminByInt(staffId);
			Staff staff = staffSvc.getStaff(staffId);

			req.setAttribute("admin", admin);
			req.setAttribute("staff", staff);

			String url = "/templates/backstage/staff/update.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		if ("update".equals(action)) {
			update(req, res);
		}
		if ("/ipet-back/staff/checkAc".equals(path)) {
			StaffService staffSvc = new StaffService();
			Staff staff = new Staff();
			staff.setAc(req.getParameter("account"));

			res.getWriter().print(staffSvc.findAc(staff.getAc()));
		}
		if ("/ipet-back/staff/checkStatus".equals(path)) {
			StaffService staffSvc = new StaffService();
			Staff staff = new Staff();
			staff.setAc(req.getParameter("account"));

			System.out.println("status=" + staffSvc.acAcactive(staff.getAc()));

			res.getWriter().print(staffSvc.acAcactive(staff.getAc()));
		}
	}

	private void update(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String sname = req.getParameter("sname");
		String uid = req.getParameter("uid");
		java.sql.Date birth = Date.valueOf(req.getParameter("birth"));
		String sex = req.getParameter("sex");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String acount = req.getParameter("acount");
		String password = req.getParameter("password");
		String posi = req.getParameter("job");
		Integer status = Integer.valueOf(req.getParameter("status").trim());
		Integer id = Integer.valueOf(req.getParameter("staffId").toString().trim());

		Integer adminid = Integer.valueOf(req.getParameter("admin").trim());

		Staff staff = new Staff();
		staff.setId(id);
		staff.setName(sname);
		staff.setUid(uid);
		staff.setBth(birth);
		staff.setSex(sex);
		staff.setEmail(email);
		staff.setPhone(phone);
		staff.setTel(tel);
		staff.setAdd(address);
		staff.setAc(acount);
		staff.setPw(password);
		staff.setPosi(posi);
		staff.setStatus(status);

		StaffService staffSvc = new StaffService();
		staffSvc.updateStaff(staff);

		Admin admin = new Admin();
		admin.setStaffID(id);
		admin.setAdminID(adminid);
		AdminService adminSvc = new AdminService();
		adminSvc.update(admin);
//			轉交
		String url = "/templates/backstage/staff/staffList.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, res);
	}

	private void insert(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String sname = req.getParameter("sname");
		String uid = req.getParameter("uid");
		String birthStr = req.getParameter("birth");
		String sex = req.getParameter("sex");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		String acount = req.getParameter("acount");
		String password = req.getParameter("password");
		String posi = req.getParameter("job");
		String adminStr = req.getParameter("admin");

		List<String> errorMsgs = getErrorMsgs(sname, uid, birthStr, sex, email, phone, address, acount, password, posi,
				adminStr);
		java.sql.Date birth = Date.valueOf(birthStr);

		Integer adminInt = Integer.valueOf(adminStr.trim());

		Staff staff = new Staff();
		staff.setName(sname);
		staff.setUid(uid);
		staff.setBth(birth);
		staff.setSex(sex);
		staff.setEmail(email);
		staff.setPhone(phone);
		staff.setTel(tel);
		staff.setAdd(address);
		staff.setAc(acount);
		staff.setPw(password);
		staff.setPosi(posi);

		if (!errorMsgs.isEmpty()) {
			req.setAttribute("staff", staff);
			RequestDispatcher failureView = req.getRequestDispatcher("/templates/backstage/staff/register.jsp");
			failureView.forward(req, res);
			return;
		}

		StaffService staffSvc = new StaffService();
		int staffid = staffSvc.addStaff(staff);

		AdminService adminSvc = new AdminService();
		Admin admin = adminSvc.addAdminOnStaff(adminInt, staffid);

//			轉交
		String url = "/templates/backstage/staff/staffList.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, res);
	}

	private List<String> getErrorMsgs(String sname, String uid, String birthStr, String sex, String email, String phone,
			String address, String acount, String password, String posi, String adminStr) {
		List<String> errorMsgs = new LinkedList<String>();
		String snameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
		if (sname == null || sname.trim().length() == 0) {
			errorMsgs.add("員工姓名: 請勿空白");
		} else if (!sname.trim().matches(snameReg)) {
			errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
		}

		if (uid == null || uid.trim().length() == 0) {
			errorMsgs.add("請勿空白");
		}

		try {
			java.sql.Date birth = Date.valueOf(birthStr);
		} catch (IllegalArgumentException e) {
			errorMsgs.add("請輸入日期!");
		}

		if (sex == null || sex.trim().length() == 0) {
			errorMsgs.add("請勿空白");
		}

		if (email == null || email.trim().length() == 0) {
			errorMsgs.add("請勿空白");
		}

		if (phone == null || phone.trim().length() == 0) {
			errorMsgs.add("請勿空白");
		} else if (phone.trim().length() != 10) {
			errorMsgs.add("手機號碼錯誤");
		}

		if (address == null || address.trim().length() == 0) {
			errorMsgs.add("請勿空白");
		}

		if (acount == null || acount.trim().length() == 0) {
			errorMsgs.add("請勿空白");

			if (password == null || password.trim().length() == 0) {
				errorMsgs.add("請勿空白");
			}

			if (posi == null || posi.trim().length() == 0) {
				errorMsgs.add("請選擇職稱");
			}

			if (adminStr == null) {
				errorMsgs.add("請選擇權限");
			}
			return errorMsgs;
		}
		return errorMsgs;
	}

}
