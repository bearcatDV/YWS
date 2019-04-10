package org.bigjava.action;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.bigjava.bean.Answer;
import org.bigjava.bean.Question;
import org.bigjava.bean.User;
import org.bigjava.dao.QuestionDao;
import org.bigjava.dao.UserDao;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PhotoUpload extends ActionSupport implements ModelDriven<User>,RequestAware{
	private User user;
	private UserDao userDao;
	Map<String,Object> request;
	private File myFile;
	private String myFileContentType;
	private String myFileFileName;
	private String destPath;
	private Question question;
	private QuestionDao questionDao;
	
	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}

	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
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

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getMyFileContentType() {
		return myFileContentType;
	}

	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}

	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	public String getDestPath() {
		return destPath;
	}

	public void setDestPath(String destPath) {
		this.destPath = destPath;
	}

	public String upload() throws Exception {
		System.out.println("upload()"+user);
		

		destPath = "D:/chuangjian/YWS/WebContent/images";
		System.out.println("destPath"+destPath);
		if(myFile!=null) {
			System.out.println("myFile"+myFile+"myFileFileName"+myFileFileName);
    		File destFile  = new File(destPath, myFileFileName);
			if(!destFile.getParentFile().exists()){//判断目录是否存在 
				destFile.getParentFile().mkdirs();//创建目录
			}
			
			FileUtils.copyFile(myFile, destFile);
			
			destPath = ServletActionContext.getServletContext().getRealPath("/images");
			destFile  = new File(destPath, myFileFileName);
			FileUtils.copyFile(myFile, destFile);
			
			String ph="images/"+myFileFileName;
			
			user.setPhoto(ph);
			userDao.savaPhotoById(user);
			User user1=userDao.getUserById(user.getId());
			List<Question> questions = userDao.getQuestions(user.getId());
			
			System.out.println("upload_user1"+user1);
	
			request.put("questions",questions);
			request.put("user", user1);
			return "upload";
		}else{
    		return "error";
		} 
		
	}
	public String message() throws Exception{
		System.out.println("message"+user);
		boolean b = userDao.savaMessageById(user);
		if(b == false){
			return "error";
		}
		User user1 = userDao.getUserById(user.getId());
		
		request.put("user", user1);
		return "message";
	}
	
	@Override
	public User getModel() {
		if(user == null){
			user= new User();
		}
		return user;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request=arg0;
	}


}
