package com.web.question.model.service;

import java.util.List;

import com.web.question.model.dao.QuestionDAO;
import com.web.question.model.dao.QuestionDAOImpl;
import com.web.question.model.entity.Question;

public class QuestionService {

	private QuestionDAO dao;
	
	public QuestionService() {
		dao = new QuestionDAOImpl();
	}

	int quesId = 0;

	public int addQuestion(Question questionVO) {
		quesId = dao.add(questionVO);
		return quesId;
	}
	
	public Question updateQuestion(Question questionVO) {
		return dao.update(questionVO);
	}
	
	
	public Question getQuestion(int quesId) {
		Question questionVO = dao.getById(quesId);
		return questionVO;
	}
	
	public List<Question> getAll() {
		return dao.getAll();
	}

	

}
