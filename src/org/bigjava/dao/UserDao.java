package org.bigjava.dao;

import org.bigjava.bean.User;

public interface UserDao {
	
	/**
	 * ��¼
	 * @param user
	 * @return
	 */
	public User login(User user);
}
