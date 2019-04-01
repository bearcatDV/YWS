package org.bigjava.action;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.bigjava.bean.Answer;
import org.bigjava.bean.Question;
import org.bigjava.bean.User;
import org.bigjava.dao.QuestionDao;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class QuestionAction extends ActionSupport implements RequestAware, ServletRequestAware,ModelDriven<Question>{
	
	private static final long serialVersionUID = 7622329058096927609L;

	private File myFile;		          // action上传的实际文件
	private String myFileContentType;	 // 这是上传文件的内容类型
	private String myFileFileName;		// 上传文件的名称
	private String destPath;	       // 上传到的地址 
	private Question question;
	
	private QuestionDao questionDao;
	
	private HttpServletRequest req ;
	
	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}

	public String filesave() throws Exception {
		Integer user_id = Integer.parseInt(req.getParameter("user_id"));  
		
	
		question.setUser(new User(user_id));
		
		destPath = ServletActionContext.getServletContext().getRealPath("/images");
			
		
	    String myFileFileNames = "images/" + myFileFileName;		// 将Eclipse内部的文件的绝对路径
		
    	question.setFileForm(myFileFileNames);						// 将myFileFileNames路径存放在 Question中
		
		questionDao.fileSave(question);									// 将文件路径存放进数据库中
		
		System.out.println("图片路径" + myFileFileNames);		// Eclipse中图片的路径
		
		try {
			System.out.println("File name::" + myFile);			// 上传的文件
			System.out.println("File name::" + myFileFileName);	// 上传的文件名    
			
			File destFile = new File(destPath,myFileFileName);
			FileUtils.copyFile(myFile, destFile);
			
			destPath="D:/chuangjian/YWS/WebContent/images";// 图片上传到的路径
			destFile = new File(destPath,myFileFileName);
			FileUtils.copyFile(myFile, destFile);
		} catch(IOException e) {
			e.printStackTrace();			
			return ERROR;
		}
		return "file";
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

    public String answers() {
    	
    	List<Answer> answers = questionDao.getAnswers(question.getId());
    	
    	request.put("answers", answers);
    	
    	return "answers";
    }

	@Override
	public String toString() {
		return "QuestionAction [myFile=" + myFile + ", myFileContentType=" + myFileContentType + ", myFileFileName="
				+ myFileFileName + ", destPath=" + destPath + "]";
	}


	@Override
	public Question getModel() {
		if(question == null) {
			question = new Question();
		}
		return question;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.req = arg0;
	}

	Map<String,Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
		
	}

}
