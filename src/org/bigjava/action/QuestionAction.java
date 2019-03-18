package org.bigjava.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.RequestAware;
import org.bigjava.bean.Question;
import org.bigjava.bean.User;
import org.bigjava.dao.QuestionDao;
import org.bigjava.dao.impl.QuestionDaoImpl;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class QuestionAction extends ActionSupport implements RequestAware,ModelDriven<Question>{
	
	QuestionDao filesDao = new QuestionDaoImpl();
	
	public void setFilesDao(QuestionDao filesDao) {
		this.filesDao = filesDao;
	}
	
	private Question question;
	private int imageId;				// 图片的ID
	private File myFile;		// action上传的实际文件
	private String myFileContentType;	// 这是上传文件的内容类型
	private String myFileFileName;		// 上传文件的名称
	private String destPath;	// 上传到的地址

	
	
	public QuestionAction() {}
	
	public String save() throws Exception {
		
		destPath = "D:\\eclipse\\ssh\\WebContent\\images\\";// 图片上传到的路径	
		
		String myFileFileNames = "image/"+myFileFileName;		// 将Eclipse内部的文件的绝对路径
		question.setMyFile(myFileFileNames);						// 将myFileFileNames路径存放在 Files_2中
		filesDao.FileSave(question);									// 将文件路径存放进数据库中
		System.out.println("图片路径" + myFileFileNames);		// Eclipse中图片的路径
		
		try {
			System.out.println("File name" + myFile);			// 上传的文件
			System.out.println("File name" + myFileFileName);	// 上传的文件名
				
			File destFile = new File(destPath,myFileFileName);
			FileUtils.copyFile(myFile, destFile);
			
		} catch(IOException e) {
			e.printStackTrace();
			return ERROR;
		}
		return "file";
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
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

	@Override
	public String toString() {
		return "QuestionAction [imageId=" + imageId + ", myFile=" + myFile + ", myFileContentType=" + myFileContentType
				+ ", myFileFileName=" + myFileFileName + ", destPath=" + destPath + "]";
	}
	

	private Map<String, Object> request;
	
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
	}
	
	@Override
	public Question getModel() {
		if(question == null){
			question=new Question();
		}
		return question;
	}

}
