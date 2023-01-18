package com.web.question.model.dao;

import java.util.*;

import org.hibernate.Session;
import com.web.question.model.entity.Question;


public class QuestionDAOImpl implements QuestionDAO {


	@Override
	public Question update(Question question) {
		Session session = getSession();
		Question oldquestionVO = session.get(Question.class, question.getQuesId());
		oldquestionVO.setQuesTitle(question.getQuesTitle());
		oldquestionVO.setQuesText(question.getQuesText());
		oldquestionVO.setQuesTime(question.getQuesTime());
		oldquestionVO.setQuesId(question.getQuesId());
		return question;
	}

	@Override
	public List<Question> getAll() {
		Session session = getSession();
        String hql = "FROM Question";
        return session.createQuery(hql, Question.class).list();
	}
		
	@Override
	public Question getById(Integer quesId) {
		 Session session = getSession();
	        return session.get(Question.class, quesId);
	}
	

	@Override
	public Integer add(Question question) {
		Session session = getSession();
		session.persist(question);
		return question.getQuesId();
	}

}
