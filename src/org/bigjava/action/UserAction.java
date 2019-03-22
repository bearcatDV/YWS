package org.bigjava.action;

import java.util.List;

/**
 * test
 */

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.interceptor.RequestAware;
import org.bigjava.bean.Question;
import org.bigjava.bean.User;
import org.bigjava.dao.UserDao;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;




public class UserAction extends ActionSupport implements RequestAware,ModelDriven<User>{
 
	private static final long serialVersionUID = 7622329058096927609L;
	private User user;
	private Question question;
	private UserDao userDao;
	Map<String, Object> request;
	private String result;
	private String result1;
	private String rePassword; //密码确认验证
	Matcher matcher=null;
	Pattern pattern=null;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User getUser() {
		return user;
	}
	
	
	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	 

	public String getResult1() {
		return result1;
	}

	public void setResult1(String result1) {
		this.result1 = result1;
	}

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	//登录
	public String login() throws Exception {
		System.out.println("login"+user);
		boolean b = false;
		String username=user.getUsername();
		String password=user.getPassword();
		
		//账号验证
		if(username == null || password == null || username.equals("") || password.equals("")){
			System.out.println("验证一");
			result="账号或密码不能为空";
			return SUCCESS;
		}
		
		//密码验证
		pattern = Pattern.compile("^[A-Za-z0-9]+$");
		matcher = pattern.matcher(password);
		b=matcher.matches();
		if(b == false){
			System.out.println("验证三");
			result="密码错误密码由数字和字母组成";
			return SUCCESS;
		}
		
		if(password.length()<6 || password.length()>16){
			System.out.println("验证四");
			result="密码不少于六位或不多于十六位";
			return SUCCESS;
		}
		
		pattern = Pattern.compile("^-?[1-9]\\d*$");
		matcher = pattern.matcher(username);   
		b=matcher.matches();
		//用户名登录
		if(b == false){
			
			pattern = Pattern.compile("^[a-zA-Z\u4e00-\u9fa5]{2,10}$");
			matcher = pattern.matcher(username);
			boolean c=matcher.matches();
			if(c == false){
				System.out.println("验证二");
				result="用户名2到10个字且只能是中文或英文";
				return SUCCESS;
			}
			User user1=userDao.loginByUsername(user);
			if(user1 == null){
				System.out.println("验证五");
				result="用户名不存在";
				
				return SUCCESS;
			}
			
			result="1";
			result1=user1.getId().toString();
			System.out.println("login_id"+user1.getId());
			return "success";
			
		}
		//账号登录
		if(b == true){
			user.setAccount(username);
			User user1 = userDao.loginByAccount(user);
			if(user1 == null){
				result="账号不存在";
				return "success";
			}
			result="1";
			result1=user1.getId().toString();
			return SUCCESS;
		}
		System.out.println("jiesule");
		return SUCCESS;
		
	}
	
	//注册
	public String regist(){

		System.out.println("User_regist"+user);
		System.out.println(rePassword);
		String username = user.getUsername();
		String password = user.getPassword();
		String age = user.getAge();
		String phone = user.getPhone();
		User user1=userDao.getUserByUsername(username);
		System.out.println(user1);
		//验证用户名
		if(user1 != null){
			System.out.println("验证一");
			result="用户名已存在！";
			return SUCCESS;
		}
		if(user1 == null ||user1.equals("")){
			pattern = Pattern.compile("^[a-zA-Z\u4e00-\u9fa5]{2,10}$");
			matcher = pattern.matcher(username);
			boolean b = matcher.matches();
			if(b == false){
				System.out.println("验证二");
				result="用户名2到10个字且只能是中文或英文";
				return SUCCESS;
			}
		}
		//密码验证
		pattern = Pattern.compile("^[A-Za-z0-9]+$");
		matcher = pattern.matcher(password);
		boolean b=matcher.matches();
		if(b == false){
			System.out.println("验证三");
			result="密码错误密码由数字和字母组成";
			return SUCCESS;
		}
		if(password.length()<6 || password.length()>16){
			System.out.println("验证四");
			result="密码不少于六位或不多于十六位";
			return SUCCESS;
		}
		
		if(!password.equals(rePassword)){
			System.out.println("验证五");
			result="密码输入不一致";
			return SUCCESS;
		}
		//年龄验证
		pattern = Pattern.compile("^-?[1-9]\\d*$");
		matcher = pattern.matcher(age);
		b=matcher.matches();
		if(b == false){
			System.out.println("验证六");
			result="年龄不能为空并且必须为整数";
			return SUCCESS;
		}
		//手机号验证
		pattern = Pattern.compile("^[1][3,4,5,8][0-9]{9}$");
		matcher = pattern.matcher(phone);
		b=matcher.matches();
		if(b == false){
			System.out.println("验证七");
			result="手机号码格式不正确";
			
			return SUCCESS;
		}
		
		//获取账号
		int x=(int) (Math.random()*100000000);
		String account=Integer.toString(x);
		user.setAccount(account);
		System.out.println(account);
		user.setAccount(account);
		user.setPhoto("image/photo.jpg");
		user.setState("1");
		userDao.save(user);
		result="注册成功！您的随机账号为"+account+",请去登录页面登录";
		return "success";
	}
	//登录成功
	public String login_ok(){
		System.out.println("login_ok");
		List<Question> list=userDao.getAllQuestions();
		
		if(list != null){
			request.put("questions", list);
		}
		System.out.println("list.get"+list.get(0).getWhat());
		request.put("user", user);
		return SUCCESS;
	}
	public String homePage() throws Exception{
		User user1=userDao.getUserById(user.getId());
		request.put("user", user1);
		System.out.println("homePage_user1"+user1);
		return "homePage";
	}
	//上传头像
	public String upload() throws Exception{
		System.out.println("id"+user.getId());
		
		return SUCCESS;
	}
	@Override
	public User getModel() {
		if(user == null){
			user= new User();
		}
		return user;
	}
	
}
