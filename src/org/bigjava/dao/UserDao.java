package org.bigjava.dao;

import org.bigjava.bean.User;

public interface UserDao {
	
	/**
	 * 登陆
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public boolean save(User user);
	
	/**
	 * 修改
	 * 
	 */
	public void update(User user);
	
	/**
	 * 删除
	 * @param user
	 */
	public void delete(User user);
}
