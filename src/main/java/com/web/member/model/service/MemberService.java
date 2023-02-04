package com.web.member.model.service;



import com.web.member.model.dao.MemberDAO;
import com.web.member.model.dao.MemberDAOImpl;
import com.web.member.model.entity.Member;
import com.web.staff.model.entity.Staff;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.List;

public class MemberService {
	
	private MemberDAO dao;
	
	public MemberService() {
		dao = new MemberDAOImpl();
	}
	
	int memId = 0;
	
	public int addMember(Member memberVO) {
		memId = dao.add(memberVO);
		return memId;
	}
	
	public Member updateMember(Member memberVO) {
		return dao.update(memberVO);
	}
	
	public Member getMember(int memId) {
		Member memberVO = dao.getById(memId);
			return memberVO;
	}
	
	public List<Member> getAll(){
		return dao.getAll();
	}

	public Member login(String memAc,String memPw) {
//		String memAc = member.getMemAc();
//		String memPw = member.getMemPw();

		
		Member member = dao.getByAcAndPw(memAc, memPw);
		
		return member;
	}
	public Member resetPW(String memAc) {
//		String memAc = member.getMemAc();
//		String memPw = member.getMemPw();
		
		
		Member member = dao.getByMemAc(memAc);
		
		return member;
	}
	
	public boolean findMemAc(String memAc) {
		return true;
	}
	
	public void sendMail(String to, String subject, String messageText) {
		
		   try {
			   // 設定使用SSL連線至 Gmail smtp Server
			   Properties props = new Properties();
			   props.put("mail.smtp.host", "smtp.gmail.com");
			   props.put("mail.smtp.socketFactory.port", "465");
			   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			   props.put("mail.smtp.auth", "true");
			   props.put("mail.smtp.port", "465");

	       // ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
	       // ●1) 登入你的Gmail的: 
	       // ●2) 點選【管理你的 Google 帳戶】
	       // ●3) 點選左側的【安全性】
	       
	       // ●4) 完成【兩步驟驗證】的所有要求如下:
	       //     ●4-1) (請自行依照步驟要求操作之.....)
	       
	       // ●5) 完成【應用程式密碼】的所有要求如下:
	       //     ●5-1) 下拉式選單【選取應用程式】--> 選取【郵件】
	       //     ●5-2) 下拉式選單【選取裝置】--> 選取【Windows 電腦】
	       //     ●5-3) 最後按【產生】密碼
		     final String myGmail = "a5130401@gmail.com";
		     final String myGmail_password = "qsingygxytshfepm";
			   Session session = Session.getInstance(props, new Authenticator() {
				   protected PasswordAuthentication getPasswordAuthentication() {
					   return new PasswordAuthentication(myGmail, myGmail_password);
				   }
			   });

			   Message message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(myGmail));
			   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			  
			   //設定信中的主旨  
			   message.setSubject(subject);
			   //設定信中的內容 
			   message.setText(messageText);

			   Transport.send(message);
			   System.out.println("傳送成功!");
	     }catch (MessagingException e){
		     System.out.println("傳送失敗!");
		     e.printStackTrace();
	     }
	   }
		
		 public static void main (String args[]){

	      String to = "yichung412@gmail.com";
	      
	      String subject = "密碼通知";
	      
	      String ch_name = "yi-chung";
	      String passRandom = "RandomNumber";
	      String messageText = "Hello! " + ch_name + " 請謹記此密碼: " + passRandom + "\n" +" (已經啟用)"; 
	       
	      MemberService mailService = new MemberService();
	      mailService.sendMail(to, subject, messageText);

	   }
	
}
