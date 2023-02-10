package com.web.product.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.product.model.entity.Product;
import com.web.product.model.service.ProductServiceBack;

@WebServlet("/ipet-front/prod/DBGifReaderFront")
public class DBGifReaderControllerFront extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("image/gif");
		ServletOutputStream out = response.getOutputStream();

		Integer prodID = Integer.valueOf(request.getParameter("prodID"));
	
		if (prodID <= 21) {
			try {

				ProductServiceBack prodSvc = new ProductServiceBack();
				out.write(prodSvc.getOneProdIMG(prodID).getImgFile());
			} catch (Exception e) {
				
				InputStream in = getServletContext()
						.getResourceAsStream("/static/frontstage/img/product/product-" + prodID + ".jpg");
				byte[] buf = new byte[in.available()];
				in.read(buf);
				out.write(buf);
				in.close();
				
				ProductServiceBack prodSvc = new ProductServiceBack();
				prodSvc.upload(buf, prodID);
			}
		}else {
				
				ProductServiceBack prodSvc = new ProductServiceBack();
				out.write(prodSvc.getOneProdIMG(prodID).getImgFile());
			
		}

	}

}
