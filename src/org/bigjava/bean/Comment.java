package org.bigjava.bean;


public class Comment {
	private Integer id;
	private String content;
	private User user;
	private Article article;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public Comment() {
		super();
	}
	public Comment(Integer id, String content, User user, Article article) {
		super();
		this.id = id;
		this.content = content;
		this.user = user;
		this.article = article;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", user=" + user + ", article=" + article + "]";
	}
		
	
}
