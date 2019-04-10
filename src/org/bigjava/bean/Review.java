package org.bigjava.bean;

public class Review {

	private Integer id;
	private String comm;
	private Article article;
	private User user;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public String toString() {
		return "Review [id=" + id + ", comm=" + comm + ", article=" + article + ", user=" + user + "]";
	}
	
	public Review(Integer id, String comm, Article article, User user) {
		super();
		this.id = id;
		this.comm = comm;
		this.article = article;
		this.user = user;
	}
	
	public Review() {}
	
	
}
