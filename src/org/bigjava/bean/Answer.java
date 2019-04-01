package org.bigjava.bean;

public class Answer {
	
	private Integer id;
	private String comm;
	private Question question;
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
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	

	@Override
	public String toString() {
		return "Answer [id=" + id + ", comm=" + comm + ", question=" + question + ", user=" + user + "]";
	}
	

	public Answer(Integer id, String comm, Question question, User user) {
		super();
		this.id = id;
		this.comm = comm;
		this.question = question;
		this.user = user;
	}
	public Answer() {}
	
    
}
