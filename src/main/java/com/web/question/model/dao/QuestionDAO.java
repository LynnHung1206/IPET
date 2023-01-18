package com.web.question.model.dao;

import java.util.*;

import com.core.model.dao.CoreDAO;
import com.web.question.model.entity.Question;

public interface QuestionDAO extends CoreDAO<Question, Integer> {

	public Question update(Question question);

	public List<Question> getAll();
}