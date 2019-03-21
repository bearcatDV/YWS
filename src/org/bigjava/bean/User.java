package org.bigjava.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {



	private Integer id; // id
	private String username; // 用户名
	private String account; // 账号
	private String password; // 密码
	private String age; // 年龄
	private String sex; // 性别
	private String phone; // 手机号
	private String state; // 状态
	private String photo;//头像
	private String data;//出生日期
	private String address;//住址
	private String email;//邮件
	private String hobby;//爱好
	private String introduce;//个人简介
	/*private Set questions = new HashSet(0);*/
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	/*public Set getQuestions() {
		return questions;
	}
	public void setQuestions(Set questions) {
		this.questions = questions;
	}*/
	public User(Integer id, String username, String account, String password, String age, String sex, String phone,
			String state, String photo, String data, String address, String email, String hobby, String introduce) {
		super();
		this.id = id;
		this.username = username;
		this.account = account;
		this.password = password;
		this.age = age;
		this.sex = sex;
		this.phone = phone;
		this.state = state;
		this.photo = photo;
		this.data = data;
		this.address = address;
		this.email = email;
		this.hobby = hobby;
		this.introduce = introduce;
		
	}
	
	public User() {}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", account=" + account + ", password=" + password
				+ ", age=" + age + ", sex=" + sex + ", phone=" + phone + ", state=" + state + ", photo=" + photo
				+ ", data=" + data + ", address=" + address + ", email=" + email + ", hobby=" + hobby + ", introduce="
				+ introduce +"]";
	}
	
	
	
}
	

	
	
	
	