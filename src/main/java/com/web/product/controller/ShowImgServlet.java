package com.web.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.model.service.imp.ProductServiceFrontImp;

@WebServlet("/templates/frontstage/shop/showImg")
public class ShowImgServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Integer prodID = Integer.parseInt((String) req.getParameter("prodID"));
		ProductServiceFrontImp prodSvc= new ProductServiceFrontImp();
		ServletOutputStream out = resp.getOutputStream();
		resp.setContentType("image/jpg");
		resp.setContentLength(prodSvc.findProductImg(prodID).length);
		out.write(prodSvc.findProductImg(prodID));
		out.close();
	}
}
