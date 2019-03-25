package org.bigjava.dao.impl;

import org.bigjava.bean.Comment;
import org.bigjava.dao.CommentDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class CommentDaoImpl implements CommentDao {

	private SessionFactory SessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		SessionFactory = sessionFactory;
	}

	public Session getSession(){
		return SessionFactory.getCurrentSession();
	}
	
	@Override
	public void savaComment(Comment comment) {
		
		getSession().save(comment);
	}

}
