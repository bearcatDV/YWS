package org.bigjava.dao.impl;

import org.bigjava.bean.Article;
import org.bigjava.dao.ArticleDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ArticleDaoImpl implements ArticleDao {

private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.getCurrentSession();
	}
	@Override
	public Boolean add(Article article) {
		if (article == null) {
			return false;
		}
		getSession().save(article);
		return true;
	}

}
