package org.bigjava.dao;

import org.bigjava.bean.User;

public interface UserDao {
	
	/**
	 * 通过用户名登陆
	 * @param user
	 * @return
	 */
	public User loginByUsername(User user);
	
	/**
	 * 通过账号登录
	 * @param user
	 * @return
	 */
	public User loginByAccount(User user);
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
	
	/**
	 * 通过用户名得到用户（校验用户是否存在）
	 * @param username
	 * @return
	 */
	public User getUserByUsername(String username);
}
