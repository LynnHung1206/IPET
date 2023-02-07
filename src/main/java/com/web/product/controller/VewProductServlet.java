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

@WebServlet({"/ipet-front/shop/home","/ipet-front/shop/category", "/ipet-front/shop/search", "/ipet-front/shop/detail"})
public class VewProductServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String url = "";
		
		// search by category
		if(req.getParameter("typeID") != null) {
			
			Integer typeID = Integer.parseInt((String) req.getParameter("typeID"));
			ProductServiceFrontImp prodSvc = new ProductServiceFrontImp();
			List<Product> list = prodSvc.findSameCategoryProduct(typeID);
			
			req.setAttribute("list", list);
			url = "/templates/frontstage/shop/searchByCategory.jsp";
		}
		
		// search by keyword
		if(req.getParameter("keyword") != null) {
			
			String keyword = req.getParameter("keyword");
			ProductServiceFrontImp prodSvc = new ProductServiceFrontImp();
			List<Product> list = prodSvc.findSpecifiedProduct(keyword);
			
			req.setAttribute("list", list);
			url = "/templates/frontstage/shop/searchByKeyword.jsp";
		}
		
		// view product detail
		if(req.getParameter("prodID") != null) {
			
			Integer prodID = Integer.parseInt(req.getParameter("prodID"));
			ProductServiceFrontImp prodSvc = new ProductServiceFrontImp();
			Product product = prodSvc.getSpecifiedProduct(prodID);
			
			req.setAttribute("product", product);
			url = "/templates/frontstage/shop/productDetail.jsp";
		}
		
		// go to shop Home
		if(url.equals("")) {
			url = "/templates/frontstage/shop/shop.jsp";
		}
		
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, resp);
	}
}
