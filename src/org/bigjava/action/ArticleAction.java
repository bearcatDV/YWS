 package org.bigjava.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.bigjava.bean.Article;
import org.bigjava.bean.User;
import org.bigjava.dao.ArticleDao;
import org.bigjava.dao.impl.ArticleDaoImpl;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @author 讲不出再见
 *
 */
public class ArticleAction extends ActionSupport implements ModelDriven<Article>, ServletRequestAware{

private ArticleDao articleDao;
private Article article;

private File myFile;//action上传的实际文件
private String myFileContentType;//上传文件的内容类型
private String myFileFileName; //上传文件的名称
private String destPath;//上传的地址

private HttpServletRequest request;

public ArticleDao getArticleDao() {
	return articleDao;
}

public void setArticleDao(ArticleDao articleDao) {
	this.articleDao = articleDao;
}

public Article getArticle() {
	return article;
}

public void setArticle(Article article) {
	this.article = article;
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



public ArticleAction(){}

public String write() {
	
		Integer id=Integer.valueOf(request.getParameter("user_id"));
		article.setUser(new User(id));
		/*destPath ="E:/tomcat/apache-tomcat-7.0.92/apache-tomcat-7.0.92/webapps/YWS/picture/";//图片上传的路径*/	
		destPath = ServletActionContext.getServletContext().getRealPath("/images");
		String myFileFileNames = "images/"+myFileFileName;
		article.setPicture(myFileFileNames);//将myFileFileNames路径存放在article中
		System.out.println("内容"+article);
		articleDao.add(article);//将文件路径存放进数据库中
		System.out.println("图片路径"+ myFileFileNames);
		
		try{
			System.out.println("到底是：" +myFile);
			System.out.println("File name" +myFileFileName);
		
			File destFile = new File(destPath, myFileFileName);
			FileUtils.copyFile(myFile, destFile);
			
			destPath="D:/chuangjian/YWS/WebContent/images";// 图片上传到的路径
			destFile = new File(destPath,myFileFileName);
			FileUtils.copyFile(myFile, destFile);
			
		}catch(IOException e){
			e.printStackTrace();
			return ERROR;
		}
		return "write";
	}

@Override
public Article getModel() {
	if(article == null){
		article = new Article();
	}
	return article;
}

@Override
public void setServletRequest(HttpServletRequest arg0) {
	this.request = arg0;
	
}

}
