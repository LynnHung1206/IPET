package com.web.question.model.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.question.model.entity.Question;
import com.web.question.model.service.QuestionService;

@WebServlet({ "/ipet-back/question/allQuestionList", "/ipet-back/question/edit", "/ipet-back/question/addNew","/ipet-back/question/getAllList" })
public class QuestionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path = req.getServletPath();
		if ("/ipet-back/question/allQuestionList".equals(path)) {
			QuestionService questionSvc = new QuestionService();
			List<Question> list = questionSvc.getAll();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/templates/backstage/question/questionList.jsp").forward(req, res);
		}
		if ("/ipet-back/question/addNew".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/question/register.jsp").forward(req, res);
		}
		if("/ipet-back/question/getAllList".equals(path)) {
			req.getRequestDispatcher("/templates/backstage/question/questionList.jsp").forward(req, res);
		}

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//		insert
		if ("insert".equals(action)) {
			insert(req, res);
		}
		if ("updateTemp".equals(action)) {
			Integer quesId = Integer.valueOf(req.getParameter("quesId"));
			QuestionService questionSvc = new QuestionService();
			
			
			Question question = questionSvc.getQuestion(quesId);
			
			req.setAttribute("question", question);
			
			String url = "/templates/backstage/question/update.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
		if ("update".equals(action)) {
			update(req, res);
		}
	}

	private void update(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String quesTitle = req.getParameter("quesTitle");
		String quesText = req.getParameter("quesText");
		String quesIdStr = req.getParameter("quesId");
		
		Integer quesId = Integer.valueOf(quesIdStr);

		Question question = new Question();
		question.setQuesId(quesId);
		question.setQuesTitle(quesTitle);
		question.setQuesText(quesText);

		QuestionService questionSvc = new QuestionService();
		questionSvc.updateQuestion(question);
		
//			轉交
		String url = "/templates/backstage/question/questionList.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, res);
	}

	private void insert(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String quesTitle = req.getParameter("quesTitle");
		String quesText = req.getParameter("quesText");

		List<String> errorMsgs = getErrorMsgs(quesTitle, quesText);

		Question question = new Question();
		question.setQuesTitle(quesTitle);
		question.setQuesText(quesText);

		if (!errorMsgs.isEmpty()) {
			req.setAttribute("question", question); // 含有輸入格式錯誤的empVO物件,也存入req
			RequestDispatcher failureView = req.getRequestDispatcher("/templates/backstage/question/register.jsp");
			failureView.forward(req, res);
			return;
		}
		
		QuestionService questionSvc = new QuestionService();
		int quesId = questionSvc.addQuestion(question);
		
//			轉交
		String url = "/templates/backstage/question/questionList.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, res);
	}

	private List<String> getErrorMsgs(String quesTitle, String quesText) {
		List<String> errorMsgs = new LinkedList<String>();

		if (quesTitle == null || quesTitle.trim().length() == 0) {
			errorMsgs.add("請勿空白");
		}
		
		if (quesText == null || quesText.trim().length() == 0) {
			errorMsgs.add("請勿空白");
		}
	
		return errorMsgs;
	}

}
