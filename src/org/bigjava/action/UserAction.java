package org.bigjava.action;

/**
 * test
 */

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.interceptor.RequestAware;
import org.bigjava.bean.User;
import org.bigjava.dao.UserDao;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements RequestAware,ModelDriven<User>{
 
	private static final long serialVersionUID = 7622329058096927609L;
	private User user;
	private UserDao userDao;
	private Map<String, Object> request;
	private String result;
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public String login() throws Exception {
		System.out.println("User="+user);
		String username=user.getUsername();
		String password=user.getPassword();
		Matcher matcher=null;
		Pattern pattern=null;
		boolean b = false; 
		if(username == null || password == null){
			result="璐﹀彿鎴栧瘑鐮佷笉鑳戒负绌猴紒";
			return "error";
		}
		
		pattern = Pattern.compile("^[a-zA-Z\u4e00-\u9fa5]{2,10}$");
		matcher = pattern.matcher(username);
		b=matcher.matches();
		if(b ==false){
			result="鐢ㄦ埛鍚�2-10涓瓧锛屽彧鑳芥槸涓枃鎴栬嫳鏂�!";
		}
		
		User user1=userDao.login(user);
		if(user1 == null){
			result="璐﹀彿涓嶅瓨鍦紒";
			return "error";
		}
		System.out.println("login");
		return "success";
	}
	
	
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}
	
	@Override
	public User getModel() {
		if(user == null){
			user=new User();
		}
		return user;
	}
	
}