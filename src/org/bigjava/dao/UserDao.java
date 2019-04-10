package org.bigjava.dao;

import java.util.List;

import org.bigjava.bean.Answer;
import org.bigjava.bean.Article;
import org.bigjava.bean.Question;
import org.bigjava.bean.Review;
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
	
	/**
	 * 通过ID获得用户
	 * @param id
	 * @return
	 */
	public User getUserById(Integer id);
	
	/**
	 * 存入头像
	 * @param user
	 * @return
	 */
	public boolean savaPhotoById(User user);
	
	/**
	 * 通过id保存信息
	 * @param user
	 * @return
	 */
	public boolean savaMessageById(User user);
	
	/**
	 * 得到所有信息
	 * @return
	 */
	public List<Article> getAllArticle(Integer id);
	
	/*
	  * 得到所有Question
	 */
	public List<Question> getQuestions(Integer id);
	
	/*
	 * 
	 * 得到所有Anawer
	 */
	public List<Answer> getAnswers(Integer id);
	
	/*
	 * 得到所有Review
	 */
	public List<Review> getReview(Integer id);
}
