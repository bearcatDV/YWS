<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>写文章</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript">

			function check2(){
				var obj = document.getElementById("test").value;
				if(obj ==""){
					return false;
					}
				return true;
				}
		</script>
		<style type="text/css">
		.w1{
			height:600px;
			width:600px;
			
			margin:0 auto;
		
		}
		input{
		 	border:none;
			outline:none;
			height:50px;
			width:590px; 
		}
		textarea{
			border:none;
			outline:none; 
		}
		.w2{
			height:60px;
			widht:800px;
			
			
		}	
		.w2 a{
			position:relative;
			 top:10px;
		}
		.w3{
			font-size:17px;
			font-weight:bold;
			position:relative;
			 left:415px;
		}
		.w5{
 			width: 80px;
 			height: 35px;
 			background-color: white;
 			position:relative;
			left:1200px;
			border: 1px solid #C4C4C4;
			
 		}
		.w4{
			height: 1px;
			border: none;
			border-top: 1px solid #C4C4C4;
		}
		
		.w6 {
			height: 230px;
			width: 230px;
			border: 1px solid blue;
			position:relative;
			left: 1235px;
		}
		
	</style>
</head>
<body>
	
	
	<form action="Article_write" method="post" enctype="multipart/form-data" onsubmit="return check2()">
	<div class="w2">
		<a href="../index1.jsp"><img src="../image/zhi.PNG"/></a>
		<font class="w3">写文章</font> 
			
			<input type="submit" value="发布" class="w5"/>
	<hr class="w4"/>
		
		<div class="w6">
			<h4>发布文章</h4>
			<font>绑定合适的话题，能方便分类检索，文章也更容易让读者发现。</font>
			 <select id="test" name="article.category">
            <option name="category"></option>
            <option value="NBA">NBA</option>
            <option value="CBA">CBA</option>
            <option value="音韵小区">音韵小区</option>
            <option value="OBA">NBA</option>
            <option value="DBA">CBA</option>
            <option value="337校区">337校区</option>
        </select>
		
		</div>
	</div>
	
	<div class="w1">
		
   		<input type="file" name="myFile" />
   		
		<table>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><input type="text" name="article.article_title" placeholder="请输入标题（最多50字）" size="40"/></td>
			</tr>
			<tr>
				<td><textarea rows="32" cols="90" wrap="virtual" placeholder="请输入正文" name="article.content"></textarea></td>
			</tr>
			
		</table>
	
	</div>
		</form>

</body>
</html>