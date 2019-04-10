package org.bigjava.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.bigjava.bean.Answer;
import org.bigjava.bean.Question;
import org.bigjava.bean.User;
import org.bigjava.dao.AnswerDao;
import org.bigjava.dao.QuestionDao;
import org.bigjava.dao.UserDao;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AnswerAction implements RequestAware,ModelDriven<Answer>,ServletRequestAware {
	
	private Answer answer;
	private AnswerDao answerDao;
	private HttpServletRequest req ;
	private UserDao userDao;
	private QuestionDao questionDao;
	private User user;
	
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public void setAnswerDao(AnswerDao answerDao) {
		this.answerDao = answerDao;
	}

	public String answer() {
		
		
		Integer user_id = Integer.parseInt(req.getParameter("user_id"));  
		Integer question_id = Integer.parseInt(req.getParameter("question_id"));  
		
		answer.setUser(new User(user_id));
		answer.setQuestion(new Question(question_id));
		
		answerDao.saveAnswer(answer);
		
		User user1 = userDao.getUserById(user_id);
		List<Question> questions = userDao.getQuestions(user_id);
		List<Answer> answers = answerDao.getAllAnswers();
		
		Integer ansLenth = answers.size();
		
		request.put("answers", answers);
		request.put("user", user1);
		request.put("ansLenth", ansLenth);
		request.put("questions", questions);
		
		return "answer";
	}
	
public String answer2() {

		Integer user_id = Integer.parseInt(req.getParameter("user_id"));  
		Integer question_id = Integer.parseInt(req.getParameter("question_id"));  
		
		answer.setUser(new User(user_id));
		answer.setQuestion(new Question(question_id));
		
		answerDao.saveAnswer(answer);
		
		User user1 = userDao.getUserById(user_id);
		List<Question> questions = userDao.getQuestions(user_id);
		List<Answer> answers = answerDao.getAllAnswers();
		
		Integer ansLenth = answers.size();
		
		request.put("answers", answers);
		request.put("user", user1);
		request.put("ansLenth", ansLenth);
		request.put("questions", questions);
		
		return "answer2";
	}

	@Override
	public Answer getModel() {
		if(answer == null) {
			answer = new Answer();
		}
		return answer;
	}

	Map<String,Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
		
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.req = arg0;
		
	}

}
