package org.bigjava.bean;

public class User {
	private Integer id; // id
	private String username; // 用户名
	private String account; // 账号
	private String password; // 密码
	private String age; // 年龄
	private String sex; // 性别
	private String phone; // 手机号
	private String state; // 状态
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

	
	public User(Integer id, String username, String account, String password, String age, String sex, String phone, String state) {
		super();
		this.id = id;
		this.username = username;
		this.account = account;
		this.password = password;
		this.age = age;
		this.sex = sex;
		this.phone = phone;
		this.state = state;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", account=" + account + ", password=" + password
				+ ", age=" + age + ", sex=" + sex + ", phone=" + phone + ", state=" + state + "]";
	}

}
