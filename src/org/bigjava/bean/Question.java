package org.bigjava.bean;

public class Question {
	
	private Integer id;
	private String what;
	private String type;
	private String fileForm;  // MyEclipse中文件的绝对路径
	private User user;
	
	
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	
	public Question() {}
	
	@Override
	public String toString() {
		return "Question [id=" + id + ", what=" + what + ", type=" + type + ", fileForm=" + fileForm + ", user=" + user
				+ "]";
	}
	
	public Question(Integer id, String what, String type, String fileForm, User user) {
		super();
		this.id = id;
		this.what = what;
		this.type = type;
		this.fileForm = fileForm;
		this.user = user;
	}
	
	
	
}
