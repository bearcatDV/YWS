package org.bigjava.bean;

import java.util.Date;

public class User {
	private Integer id;  //�û�id
	private String username;  //�û���
	private String account;	 //�û��˺�
	private String password;	//�û�����
	private String sex;  //�Ա�
	private Date birth;  //��������
	private String state;  //�˻�״̬

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", account=" + account + ", password=" + password
				+ ", sex=" + sex + ", birth=" + birth + ", state=" + state + "]";
	}
	
	
}
