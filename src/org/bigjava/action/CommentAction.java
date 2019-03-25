package org.bigjava.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.bigjava.bean.Article;
import org.bigjava.bean.Comment;
import org.bigjava.bean.User;
import org.bigjava.dao.CommentDao;
import org.bigjava.dao.UserDao;
import org.junit.runner.Request;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CommentAction extends ActionSupport implements RequestAware,ModelDriven,ServletRequestAware{

	private static final long serialVersionUID = 1L;
	
	private Comment comment;
	private User user;
	private Article article;
	private Map<String, Object> req1;
	private HttpServletRequest req2;
	
	private CommentDao commentDao;

	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}


	public String content(){
		Integer id1= Integer.valueOf(req2.getParameter("user_id"));
		Integer id2 = Integer.valueOf(req2.getParameter("article_id"));
		
		comment.setUser(new User(id1));
		comment.setArticle(new Article(id2));
		System.out.println();
		System.out.println("comment"+comment);
		//commentDao.savaComment(comment);
		
		return SUCCESS;
	}

	
	
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.req1 = arg0;
	}

	@Override
	public Object getModel() {
		if(comment == null){
			comment = new Comment();
		}
		return comment;
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.req2=arg0;
	}
	
}
