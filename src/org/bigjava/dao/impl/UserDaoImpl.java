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
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public User login(User user) {
		
		String hql="FROM User u WHERE u.username=? and u.password=?";
		Query query=getSession().createQuery(hql);
		query.setString(0, user.getUsername());
		query.setString(1, user.getPassword());
		
		User user1=(User) query.uniqueResult();
		if(user1 == null){
			return null;
		}
		
		return user1;
	}
	
	public boolean save(User user){
		if(user == null){
			return false;
		}
		getSession().save(user);
		return true;
	}
	
	public void update(User user){
		String hql="update User as u set (u.username=?,u.password=?,u.sex=?,u.birth=?) where u.id=?"; 
		Query query=(Query) getSession().createQuery(hql);
		query.setString(0, user.getUsername());
		query.setString(1, user.getPassword());
		query.setString(2, user.getSex());
		query.setDate(3, user.getBirth());
		int result=query.executeUpdate();
		System.out.println("result"+result);
	}
	
	public void delete(User user){
		String hql="delete User as u WHERE u.id=?";
		Query query=(Query) getSession().createCriteria(hql);
		 
	}
	

}
