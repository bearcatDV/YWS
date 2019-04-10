package org.bigjava.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.bigjava.bean.Answer;
import org.bigjava.bean.Article;
import org.bigjava.bean.Review;
import org.bigjava.bean.User;
import org.bigjava.dao.ReviewDao;
import org.bigjava.dao.UserDao;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ReviewAction extends ActionSupport implements RequestAware,ModelDriven<Review>,ServletRequestAware{
	
	private Review review;
	private HttpServletRequest req;
	private ReviewDao reviewDao;
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}
	
	public String saveReview() {
		
		Integer user_id = Integer.parseInt(req.getParameter("user_ID"));  
		Integer article_id = Integer.parseInt(req.getParameter("article_ID")); 
		
		review.setUser(new User(user_id));;
		review.setArticle(new Article(article_id));
		
		reviewDao.saveReview(review);
		
	    User users = userDao.getUserById(user_id);
	    List<Article> articles = userDao.getAllArticle(user_id);
	    List<Review> reviews = reviewDao.getAllReview();
	    
	    Integer artiLenth = articles.size();
		Integer reviLenth = reviews.size();
		
		request.put("artiLenth", artiLenth);
		request.put("reviLenth", reviLenth);
	    request.put("users", users);
	    request.put("articles", articles);
	    request.put("reviews", reviews);
		
		return "review";
		
	}
	

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.req = arg0;
		
	}

	@Override
	public Review getModel() {
		if(review==null) {
			review = new Review();
		}
		return review;
	}

	Map<String,Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
		
	}

}
