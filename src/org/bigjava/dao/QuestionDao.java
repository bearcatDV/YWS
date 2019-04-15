package org.bigjava.dao;

import java.util.List;

import org.bigjava.bean.Answer;
import org.bigjava.bean.Question;

public interface QuestionDao {
	
	    // 保存用户和图片路径 
		public void fileSave(Question question);
	
		//拿到该问题所有评论
		public List<Answer> getAnswers(Integer id);
		
		//拿到所有问题
		public List<Question> getAllQuestion();
		
		
}
