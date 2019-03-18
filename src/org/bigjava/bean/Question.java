package org.bigjava.bean;

public class Question {
	
	private String what;
	private String type;
	private int id;
	private String myFile;
	
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
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMyFile() {
		return myFile;
	}
	public void setMyFile(String myFile) {
		this.myFile = myFile;
	}
	
	private void Qusetion() {}
	
	@Override
	public String toString() {
		return "Question [what=" + what + ", type=" + type + ", id=" + id + ", myFile=" + myFile + "]";
	}

}
