package com.web.product.model.service;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ipet-back/prod/DBGifReader")
public class DBGifReaderController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("image/gif");
		ServletOutputStream out = response.getOutputStream();
		

		try {
			Integer prodID = Integer.valueOf(request.getParameter("prodID"));
		
			ProductServiceBack prodSvc = new ProductServiceBack();
			out.write(prodSvc.getOneProdIMG(prodID).getImgFile());
		} catch (Exception e) {
			InputStream in = getServletContext().getResourceAsStream("/static/backstage/img/nopic.jpg");
			byte[] buf = new byte[in.available()];
			in.read(buf);
			out.write(buf);
			in.close();
		}
	}

}
