package org.bigjava.bean;

public class Question {
	
	private Integer id;
	private String what;
	private String fileForm;  // MyEclipse中文件的绝对路径
	private User user;
	
	
	@Override
	public String toString() {
		return "Question [id=" + id + ", what=" + what + ", fileForm=" + fileForm + ", user=" + user + "]";
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

	public Question(Integer id, String what, String fileForm, User user) {
		super();
		this.id = id;
		this.what = what;
		this.fileForm = fileForm;
		this.user = user;
	}



	public Question() {}
	
	
	
}
