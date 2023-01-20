package com.web.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.model.entity.Product;
import com.web.product.model.service.imp.ProductServiceFrontImp;

@WebServlet({"/templates/frontstage/shop/category", "/templates/frontstage/shop/search", "/templates/frontstage/shop/detail"})
public class VewProductServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
//		search by category
		if(req.getParameter("typeID") != null) {
			
			Integer typeID = Integer.parseInt((String) req.getParameter("typeID"));
			ProductServiceFrontImp prodSvc = new ProductServiceFrontImp();
			List<Product> list = prodSvc.findSameCategoryProduct(typeID);
			
			req.setAttribute("list", list);
			RequestDispatcher successView = req.getRequestDispatcher("/templates/frontstage/shop/searchByCategory.jsp");
			successView.forward(req, resp);
		}
		
//		search by keyword
		if(req.getParameter("keyword") != null) {
			
			String keyword = req.getParameter("keyword");
			ProductServiceFrontImp prodSvc = new ProductServiceFrontImp();
			List<Product> list = prodSvc.findSpecifiedProduct(keyword);
			System.out.println(list.size());
			req.setAttribute("list", list);
			RequestDispatcher successView = req.getRequestDispatcher("/templates/frontstage/shop/searchByKeyword.jsp");
			successView.forward(req, resp);
		}
		
//		view product detail
		if(req.getParameter("prodID") != null) {
			
			Integer prodID = Integer.parseInt(req.getParameter("prodID"));
			ProductServiceFrontImp prodSvc = new ProductServiceFrontImp();
			Product product = prodSvc.getSpecifiedProduct(prodID);
			req.setAttribute("product", product);
			RequestDispatcher successView = req.getRequestDispatcher("/templates/frontstage/shop/productDetail.jsp");
			successView.forward(req, resp);
		}
	}
}
