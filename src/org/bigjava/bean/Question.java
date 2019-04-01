package org.bigjava.bean;

import java.util.HashSet;
import java.util.Set;

public class Question {
	
	private Integer id;
	private String what;
	private String fileForm;  // MyEclipse中文件的绝对路径
	private User user;
	private Set<Answer> answer = new HashSet<Answer>();
	
	
	@Override
	public String toString() {
		return "Question [id=" + id + ", what=" + what + ", fileForm=" + fileForm + ", user=" + user
				+ "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}



	public String getWhat() {
		return what;
	}
	public void setWhat(String what) {
		this.what = what;
	}



	public String getFileForm() {
		return fileForm;
	}
	public void setFileForm(String fileForm) {
		this.fileForm = fileForm;
	}



	public User getUser() {
		return user;
	}
	public void setUser(User user) {

		this.user = user;
	}
	
	

	public Set<Answer> getAnswer() {
		return answer;
	}
	public void setAnswer(Set<Answer> answer) {
		this.answer = answer;
	}

    



	public Question(Integer id, String what, String fileForm, User user, Set<Answer> answer) {
		super();
		this.id = id;
		this.what = what;
		this.fileForm = fileForm;
		this.user = user;
		this.answer = answer;
	}

	public Question() {}
	
	public Question(Integer id) {
		
		this.id = id;
	}
	
	
	
}
