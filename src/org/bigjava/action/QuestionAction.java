package org.bigjava.action;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.RequestAware;
import org.bigjava.bean.Question;
import org.bigjava.dao.QuestionDao;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class QuestionAction extends ActionSupport implements RequestAware,ModelDriven<Question>{
	
	private static final long serialVersionUID = 7622329058096927609L;

	private File myFile;		          // action上传的实际文件
	private String myFileContentType;	 // 这是上传文件的内容类型
	private String myFileFileName;		// 上传文件的名称
	private String destPath;	       // 上传到的地址 
	private Question question;
	
	private QuestionDao questionDao;
	
	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}


	public String savefiles() throws Exception {
		
		destPath = "C:/Users/上官旭峰/Desktop/tomcat/webapps/YWS/images";// 图片上传到的路径	
		
	    String myFileFileNames = "images/" + myFileFileName;		// 将Eclipse内部的文件的绝对路径
		
    	question.setFileForm(myFileFileNames);						// 将myFileFileNames路径存放在 Question中
		
		questionDao.fileSave(question);									// 将文件路径存放进数据库中
		
		System.out.println("图片路径" + myFileFileNames);		// Eclipse中图片的路径
		
		try {
			System.out.println("File name::" + myFile);			// 上传的文件
			System.out.println("File name::" + myFileFileName);	// 上传的文件名
				
			File destFile = new File(destPath,myFileFileName);
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

    

	@Override
	public String toString() {
		return "QuestionAction [myFile=" + myFile + ", myFileContentType=" + myFileContentType + ", myFileFileName="
				+ myFileFileName + ", destPath=" + destPath + "]";
	}

	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}
	
	@Override
	public Question getModel() {
		if(question == null) {
			question = new Question();
		}
		return question;
	}

}