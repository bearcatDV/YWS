package org.bigjava.dao.impl;

import org.bigjava.bean.User;
import org.bigjava.dao.UserDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.Result;

import antlr.collections.List;

public class UserDaoImpl implements UserDao {
	
	private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public User loginByUsername(User user) {
		
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
	

	public User loginByAccount(User user){
		String hql="FROM User u WHERE u.account=? and u.password=?";
		Query query=getSession().createQuery(hql);
		query.setString(0, user.getAccount());
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
		System.out.println("sava"+user);
		getSession().save(user);
		System.out.println("save成功");
		return true;
	}
	
	//错误
	public void update(User user){
		String hql="update User as u set (u.username=?,u.password=?,u.sex=?) where u.id=?"; 
		Query query=(Query) getSession().createQuery(hql);
		query.setString(0, user.getUsername());
		query.setString(1, user.getPassword());
		query.setString(2, user.getSex());
		int result=query.executeUpdate();
		System.out.println("result"+result);
	}
	
	public void delete(User user){
		String hql="delete User as u WHERE u.id=?";
		Query query=getSession().createQuery(hql);
		 
	}

	@Override
	public User getUserByUsername(String username) {
		String hql="FROM User u WHERE u.username=?";
		Query query=getSession().createQuery(hql);
		query.setString(0, username);
		User user=(User) query.uniqueResult();
		if(user !=null){
			return user;
		}
		return null;
	}
	public User getUserById(Integer id){
		String hql="FROM User u WHERE u.id=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, id);
		User user=(User) query.uniqueResult();
		if(user !=null){
			return user;
		}
		return null;
	}
	@Override
	public boolean savaPhotoById(User user){
		System.out.println("savaPhoto"+user.getPhoto()+user.getId());
		String hql="update User user set user.photo=? where user.id=?";
		Query query=getSession().createQuery(hql);
		query.setString(0, user.getPhoto());
		query.setInteger(1, user.getId());
		System.out.println("yunxingok");
		int result=query.executeUpdate();
		System.out.println("getPhotoById"+result);
		if(result != 1){
			return false;
		}
		return true;
	}
	
	@Override
	public boolean savaMessageById(User user){
		System.out.println("savaMessage"+user);
		String hql="update User set data=?,address=?,email=?,hobby=?,introduce=? WHERE id=?";
		Query query=getSession().createQuery(hql);
		query.setString(0, user.getData());
		query.setString(1, user.getAddress());
		query.setString(2, user.getEmail());
		query.setString(3, user.getHobby());
		query.setString(4, user.getIntroduce());
		query.setInteger(5, user.getId());
		int result = query.executeUpdate();
		if(result !=1){
			return false;
		}
		return true;
	}
	 
	
	public void add(User user){
		
	}
	

}
