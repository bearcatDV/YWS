package org.bigjava.dao.impl;

import java.util.List;

import org.bigjava.action.UserAction;
import org.bigjava.bean.Answer;
import org.bigjava.bean.Question;
import org.bigjava.bean.User;
import org.bigjava.dao.QuestionDao;
import org.bigjava.dao.UserDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class QuestionDaoImpl implements QuestionDao {
	
    private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.getCurrentSession();
	}

	
	@Override
	public void fileSave(Question question) {
		getSession().save(question);
	}

	@Override
	public List<Answer> getAnswers(Integer id) {
		String hql = "FROM Answer answer where answer.question=?";

		Query query = getSession().createQuery(hql);
		query.setInteger(0, id);
		List list = query.list();
		
		System.out.println("闫妮马：" +list);
		
		if(list==null) {
			list=null;
		}
		return list;
	}

	@Override
	public List<Question> getAllQuestion() {
		String hql = "FROM Question";
		
   Query query = getSession().createQuery(hql);
		
		List list =query.list();
		if(list == null){
			list= null;
		}

		return list;
	}
}
