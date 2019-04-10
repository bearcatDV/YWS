package org.bigjava.dao.impl;

import java.util.List;

import org.bigjava.bean.Review;
import org.bigjava.dao.ReviewDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ReviewDaoImpl implements ReviewDao {

	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.getCurrentSession();
	}
	
	@Override
	public void saveReview(Review review) {
		 getSession().save(review);

	}

	@Override
	public List getAllReview() {
		String hql="FROM Review";
		Query query = getSession().createQuery(hql);
		
		List list =query.list();
		System.out.println("getAll2"+list);
		if(list == null){
			list= null;
		}

		return list;
	
	}

}
