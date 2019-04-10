package org.bigjava.bean;

import java.util.HashSet;
import java.util.Set;

public class Article {
	/*
	 * 文章
	 * 1.文章标题(必须)
	 * 2.文章图片(可选)
	 * 3.文章正文(必须)
	 * 4.类别
	 * 5.关联用户id
	 */
	
	private Integer id;
	private String article_title;//文章标题
	private String picture;//文章图片
	private String content;//文章正文
	private String category;//文章类别
	private Set<Review> reviews= new HashSet<Review>();
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public Set<Review> getReviews() {
		return reviews;
	}
	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", article_title=" + article_title + ", picture=" + picture + ", content="
				+ content + ", category=" + category + ", user=" + user + "]";
	}
	
	public Article(Integer id, String article_title, String picture, String content, String category,
			Set<Review> reviews) {
		super();
		this.id = id;
		this.article_title = article_title;
		this.picture = picture;
		this.content = content;
		this.category = category;
		this.reviews = reviews;
	}
	public Article() {}
	
	public Article(Integer id) {
		this.id = id;
	}
	
}
