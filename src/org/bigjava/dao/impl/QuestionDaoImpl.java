package org.bigjava.dao.impl;

import org.bigjava.bean.Question;
import org.bigjava.dao.QuestionDao;
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
}
