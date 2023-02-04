package com.web.product.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.web.product.model.entity.Product;
import com.web.product.model.entity.ProductImg;
import com.web.product.model.entity.ProductType;
import com.web.product.model.service.ProductImgServiceBack;
import com.web.product.model.service.ProductServiceBack;

@WebServlet({ "/ipet-back/prod/listOneProd", "/ipet-back/prod/getOneForUpdate", "/ipet-back/prod/delete",
		"/ipet-back/prod/updateProdInput", "/ipet-back/prod/addOneProd", "/ipet-back/prod/listAllProd1",
		"/ipet-back/prod/addOneProd1", "/ipet-back/prod/select_page1" })
@MultipartConfig(location = "C:\\CGA_105_WebApp\\eclipse_WTP_workspace1")
public class ProductServletBack extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
//		===============================轉換backindex用===============================
		String path = request.getServletPath();
		if ("/ipet-back/prod/listAllProd1".equalsIgnoreCase(path)) {
			RequestDispatcher failureView = request.getRequestDispatcher("/templates/backstage/prod/listAllProd.jsp");
			failureView.forward(request, response);
		}

		if ("/ipet-back/prod/addOneProd1".equalsIgnoreCase(path)) {
			RequestDispatcher failureView = request.getRequestDispatcher("/templates/backstage/prod/addProd.jsp");
			failureView.forward(request, response);
		}

		if ("/ipet-back/prod/select_page1".equalsIgnoreCase(path)) {
			RequestDispatcher failureView = request.getRequestDispatcher("/templates/backstage/prod/select_page.jsp");
			failureView.forward(request, response);
		}
//		===============================轉換backindex用===============================
		
//		===============================原先JSP===============================
		String action = request.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = request.getParameter("prodID");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入商品編號");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = request
						.getRequestDispatcher("/templates/backstage/prod/select_page.jsp");
				failureView.forward(request, response);
				return;// 程式中斷
			}

			Integer prodID = null;
			try {
				prodID = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.add("商品編號格式不正確");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = request
						.getRequestDispatcher("/templates/backstage/prod/select_page.jsp");
				failureView.forward(request, response);
				return;//// 程式中斷
			}

			/*************************** 2.開始查詢資料 *****************************************/
			ProductServiceBack prodSvc = new ProductServiceBack();
			Product prodVO = prodSvc.getOneProd(prodID);
			if (prodVO == null) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = request
						.getRequestDispatcher("/templates/backstage/prod/select_page.jsp");
				failureView.forward(request, response);
				return;// 程式中斷
			}

			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			request.setAttribute("prodVO", prodVO); // 資料庫取出的empVO物件,存入req
			String url = "/templates/backstage/prod/listOneProd.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(request, response);
		}

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			String prodName = request.getParameter("prodName");
			String prodNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (prodName == null || prodName.trim().length() == 0) {
				errorMsgs.add("商品名稱: 請勿空白");
			} else if (!prodName.trim().matches(prodNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}

			Integer prodPrice = null;
			try {
				prodPrice = Integer.valueOf(request.getParameter("prodPrice"));
			} catch (NumberFormatException e) {
				prodPrice = 0;
				errorMsgs.add("價格請填數字.");
			}

			String prodDescription = request.getParameter("prodDescription").trim();
			if (prodDescription == null || prodDescription.trim().length() == 0) {
				errorMsgs.add("商品描述請勿空白");
			}

			Integer typeID = Integer.valueOf(request.getParameter("typeID").trim());

			Product prodVO = new Product();
			prodVO.setProdName(prodNameReg);
			prodVO.setProdPrice(prodPrice);
			prodVO.setProdDescription(prodDescription);
			prodVO.setTypeID(typeID);

			// 接收圖片參數
			Part part = request.getPart("imgFile");

			// 將圖片轉為byte陣列
			InputStream in = part.getInputStream();
			byte[] imgFile = new byte[in.available()];
			if (imgFile.length == 0) {
				in = getServletContext().getResourceAsStream("/static/backstage/img/nopic.jpg");
				imgFile = new byte[in.available()];
			}

			in.read(imgFile);
			in.close();

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				request.setAttribute("prodVO", prodVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = request.getRequestDispatcher("/templates/backstage/prod/addEmp.jsp");
				failureView.forward(request, response);
				return;
			}

			/*************************** 2.開始新增資料 ***************************************/
			ProductServiceBack prodSvc = new ProductServiceBack();
			prodVO = prodSvc.addProdAndFile(prodName, prodPrice, prodDescription, typeID, imgFile);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/templates/backstage/prod/listAllProd.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(request, response);
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ***************************************/
			Integer prodID = Integer.valueOf(request.getParameter("prodID"));

			/*************************** 2.開始刪除資料 ***************************************/
			ProductServiceBack prodSvc = new ProductServiceBack();
			prodSvc.deleteProd(prodID);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/templates/backstage/prod/listAllProd.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(request, response);
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllProd.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer prodID = Integer.valueOf(request.getParameter("prodID"));

			/*************************** 2.開始查詢資料 ****************************************/
			ProductServiceBack prodSvc = new ProductServiceBack();
			Product prodVO = prodSvc.getOneProd(prodID);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			request.setAttribute("prodVO", prodVO); // 資料庫取出的ProdVO物件,存入req
			String url = "/templates/backstage/prod/update_prod_input.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);// 成功轉交 update_Prod_input.jsp
			successView.forward(request, response);
		}

		if ("update".equals(action)) { // 來自update_prod_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer prodID = Integer.valueOf(request.getParameter("prodID").trim());

			String prodName = request.getParameter("prodName");
			String prodNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (prodName == null || prodName.trim().length() == 0) {
				errorMsgs.add("商品名稱: 請勿空白");
			} else if (!prodName.trim().matches(prodNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}

			Integer prodPrice = null;
			try {
				prodPrice = Integer.valueOf(request.getParameter("prodPrice").trim());
			} catch (NumberFormatException e) {
				prodPrice = 0;
				errorMsgs.add("薪水請填數字.");
			}

			String prodDescription = request.getParameter("prodDescription").trim();
			if (prodDescription == null || prodDescription.trim().length() == 0) {
				errorMsgs.add("商品描述請勿空白");
			}

			Integer prodStatus = null;
			try {
				prodStatus = Integer.valueOf(request.getParameter("prodStatus").trim());
			} catch (NumberFormatException e) {
				prodStatus = 0;
				errorMsgs.add("商品狀態請填數字.");
			}

			Integer typeID = null;
			try {
				typeID = Integer.valueOf(request.getParameter("typeID").trim());
			} catch (NumberFormatException e) {
				typeID = 0;
				errorMsgs.add("商品類別請填數字.");
			}

			Product prodVO = new Product();

			prodVO.setProdID(prodID);
			prodVO.setProdName(prodName);
			prodVO.setProdPrice(prodPrice);
			prodVO.setProdDescription(prodDescription);
			prodVO.setTypeID(typeID);
			prodVO.setProdStatus(prodStatus);
			prodVO.setTypeID(typeID);

			// 接收圖片參數
			Part part = request.getPart("imgFile");

			// 將圖片轉為byte陣列
			InputStream in = part.getInputStream();
			byte[] imgFile = new byte[in.available()];
			if (imgFile.length == 0) {
				ProductServiceBack prodSvc1 = new ProductServiceBack();
				imgFile = prodSvc1.getOneProdIMG(prodID).getImgFile();
			}

			in.read(imgFile);
			in.close();

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				request.setAttribute("prodVO", prodVO); // 含有輸入格式錯誤的ProdVO物件,也存入req
				RequestDispatcher failureView = request
						.getRequestDispatcher("/templates/backstage/prod/update_prod_input.jsp");
				failureView.forward(request, response);
				return; // 程式中斷
			}

			/*************************** 2.開始修改資料 *****************************************/

			ProductServiceBack prodSvc = new ProductServiceBack();
			prodVO = prodSvc.updateProd(prodID, prodName, prodPrice, prodDescription, prodStatus, typeID, imgFile);

	

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			request.setAttribute("prodVO", prodVO); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/templates/backstage/prod/listOneProd.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(request, response);
		}
		
//		===============================原先JSP===============================
	}

	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		return buffer;
	}
}
