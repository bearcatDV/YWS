package org.bigjava.dao.impl;

import org.bigjava.bean.User;
import org.bigjava.dao.UserDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserDaoImpl implements UserDao {
	
	private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	@Override
	public User login(User user) {
		System.out.println("login方法"+user);
		String hql="FORM User u WHERE u.username=? and u.password=?";
		Query query=(Query) getSession().createCriteria(hql);
		query.setString(0, user.getUsername());
		query.setString(1, user.getPassword());
		
		User user1=(User) query.uniqueResult();
		if(user1 == null){
			return null;
		}
		System.out.println("login方法出");
		return user1;
	}

}
