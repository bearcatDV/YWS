package org.bigjava.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {
	private Integer id;  //id
	private String username;  //用户名
	private String account;	 //账号
	private String password;	//密码
	private String sex;  //性别
	private Date birth;  //出生日期
	private String state;  //状态
	private Set questions = new HashSet(0);

	public User() {
	}
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
	
	public Set getQuestions() {
		return questions;
	}
	public void setQuestions(Set questions) {
		this.questions = questions;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", account=" + account + ", password=" + password
				+ ", sex=" + sex + ", birth=" + birth + ", state=" + state + ", questions=" + questions + "]";
	}
	
	public User(Integer id, String username, String account, String password, String sex, Date birth, String state,
			Set questions) {
		super();
		this.id = id;
		this.username = username;
		this.account = account;
		this.password = password;
		this.sex = sex;
		this.birth = birth;
		this.state = state;
		this.questions = questions;
	}
	
	
	
	
}
