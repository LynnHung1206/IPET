package com.web.order.model.services.imp;

import com.web.order.model.entities.OrderDetail;
import com.web.order.model.entities.OrderMaster;
import com.web.order.model.services.OrderService;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.web.order.model.dao.DetailDAO;
import com.web.order.model.dao.MasterDAO;
import com.web.order.model.dao.ReturnDAO;
import com.web.order.model.dao.impl.DetailDAOIpml;
import com.web.order.model.dao.impl.MasterDAOImpl;
import com.web.order.model.dao.impl.ReturnDAOImpl;

public class OrderServiceImp implements OrderService{

	private MasterDAO masterDAO;
	private DetailDAO detailDAO;
	private ReturnDAO returnDAO;
	
	public OrderServiceImp() {
		masterDAO = new MasterDAOImpl();
		detailDAO = new DetailDAOIpml();
		returnDAO = new ReturnDAOImpl();
	}
	
	public List<OrderMaster> findAllOrderMaster(){
		return masterDAO.getAll();
	}
	
	public List<OrderMaster> findOrderMasterBymemID(Integer memID){
		return masterDAO.getBymemID(memID);
	}
	
	public OrderMaster findOrderMaster(Integer orderID) {
		return masterDAO.getById(orderID);
	}
	
	public List<OrderDetail> findOrderDetails(Integer orderID){
		List<OrderDetail> list = detailDAO.getByOrderID(orderID);
		for(OrderDetail od : list) {
			System.out.println(od.getOrderID());
			System.out.println(od.getProdID());
			System.out.println(od.getDetailQuantity());
		}
		return detailDAO.getByOrderID(orderID);
	}
	
	public void updateOrderMaster(OrderMaster orderMaster) {
		masterDAO.update(orderMaster);
	}
	
	public int addOrder(OrderMaster orderMaster, List<OrderDetail> orderDetails) {
		return masterDAO.addWithOrderDetail(orderMaster, orderDetails);
	}
	
	public void sendEmail(String memEmail, String orderDate, String orderID, String name, String phone, String address) {
		
		//********************基本資料********************
		String sender = "testingrobot777@gmail.com";
		String password = "fwujrkpbpsfovjma";
		String receiver = memEmail;
		String subject = "iPET shop";
		String mailContent = "hello world";
		
		//********************連線設定********************
		Properties prop = new Properties();
		//設定連線方式為smtp
		prop.setProperty("mail.transport.protocol", "smtp");
		//host name
		prop.setProperty("mail.host", "smtp.gmail.com");
		//host port
		prop.put("mail.smtp.port", "465");
		//是否需驗證寄件者帳號: yes
		prop.put("mail.smtp.auth","true");
		//是否需透過安全資料傳輸層SSL: yes
		//請api的class實作SSL連線
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		//SSL port
		prop.put("mail.smtp.socketFactory.port", "465");
		
		//********************帳號驗證********************
		//將所有設定放入session，並透過session對GMAIL進行連線
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				
				return new PasswordAuthentication(sender, password);
			}
		});
		
		//********************Message 放入基本資料********************
		MimeMessage message = new MimeMessage(session);
		try {
			//sender
			message.setSender(new InternetAddress(sender));
			//receive
			message.setRecipient(RecipientType.TO, new InternetAddress(receiver));
			//mail title
			message.setSubject(subject);
			//mail content
			StringBuffer html = new StringBuffer();
			html.append("<head><style> label{font-size: 16px; color: rgb(100, 97, 97);} .info{font-weight: bold;} .ship{font-size: 14px;}</style></head>");
			html.append("<body><h2>Thanks for choosing iPET</h2><br>");
			html.append("<label>ORDER INFORMATION</label><hr>");
			html.append("<table><tr><td class='info'>Order Date:</td><td>&emsp;"+ orderDate +"</td></tr>");
			html.append("<tr><td class='info'>Order ID:</td><td>&emsp; #"+ orderID +"</td></tr>");
			html.append("<tr><td class='info'>Shipping To:</td></tr></table>");
			html.append("<p class='ship'>"+ name +"<br>"+ phone +"<br>"+ address +"</p>");
			html.append("<hr><br><p>Sincerely,</p><p>iPET</p></body>");
			
			message.setContent(html.toString(), "text/html;charset=UTF-8");
			
			//********************將Session, Message傳出去********************	
			Transport transport = session.getTransport();
			transport.send(message);
			transport.close();
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
