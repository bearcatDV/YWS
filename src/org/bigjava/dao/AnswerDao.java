package org.bigjava.dao;

import java.util.List;

import org.bigjava.bean.Answer;

public interface AnswerDao {

	public void saveAnswer(Answer answer);
	
	public List getAllAnswers();
}
