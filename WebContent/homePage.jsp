<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,org.bigjava.bean.*" %>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="width=device-width, initial-scale=1; charset=UTF-8">
	<title>个人主页</title>
	<link rel="stylesheet" href="css/font-awesome.min.css" />
	<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Yanone+Kaffeesatz:200,300,400,700" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css" media="all" />
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<!--  
	<script type="text/javascript">
	$(document).ready(function(){
		  $(".but").click(function(){
	      var val = $(this).val();
	      if(val=="评论"){
		 // $(this).next().show();
		  $(this).val("收起评论");
	      }else{
	    	 // $(this).next().hide();
	    	  $(this).val("评论");
	      }
		  });
		});
    </script>
	-->
	<style type="text/css">
		bady{
			background:#F6F6F6;
		}
		.um_file {
    		position: relative;
    		display: inline-block;
    		background: #778899;
    		border: 0px solid #99D3F5;
    		border-radius: 4px;
    		padding: 4px 12px;
    		overflow: hidden;
    		color: white;
    		text-decoration: none;
    		text-indent: 0;
    		line-height: 20px;
		}
		.my_file {
    		position: absolute;
    		font-size: 100px;
    		right: 0;
    		top: 0;
    		opacity: 0;
		}
		.um_file:hover {
    		background: #AADFFD;
    		border-color: #78C3F3;
    		color: #004974;
    		text-decoration: none;
		}
		.sub{
			background: #778899;
    		border: 0px solid #99D3F5;
    		border-radius: 4px;
    		padding: 4px 12px;
    		overflow: hidden;
    		color: white;
    		text-decoration: none;
    		text-indent: 0;
    		line-height: 20px;
    		position: relative;
    		right: 0;
    		top: -10px;
    		
		}
		.in_text{
			background-color:white;
			filter: alpha(opacity=0);
			opacity: 0.2;
			color:black;
		}
		.sp_input{
			background-color:#778899;
			border: 0px solid #99D3F5;
		}
		.w3-about-head{
			border:0px solid black;
			background:white;
			width:75%;
			height:70px;
			margin:0 auto;
			line-height:20px;
		}
		.w3-about-head h3{
			position: relative;
			top:15px;
		}
		.grids_top{
			border:1px solid blue;
			width:100%;
			height:70px;
		}
		.container{
			border:0px solid blue;
			background-color:#F6F6F6;
			width:100%;
			height:900px;
		}
		
		.grids_top ul li{
			margin-top:10px;
			display:inline-block;
			font-size:24px;
			width:18%;
		}
		
		.grids_midT{
			width:100%; 
            height: 8%;             
            float:top;
		}
		
		.grids_middle{
			width:75%; 
            height:75%; 
            background-color: yellow; 
		}
		
		
		.grids_midZong{
			width:100%; 
            height: 100%; 
            float:top;
		}
		
		.grids_midTop{
			width:100%; 
            height:20%; 
            float:top;
           
		}
		
		.grids_midTopTop{
			width:100%; 
            height:25%; 
            float:top;
           
		}
		
		.grids_midTopF{
			width:100%; 
            height:95%; 
            float:top;
           
		}
		
		.grids_midTopFleft{
			width:5%; 
            height:78%; 
            float:left;
           
		}
		
		.grids_midTopFleftRight{
			width:20%; 
            height:78%; ; 
            padding-top:2%;
            float:left;
           
		}
		
		.grids_midMid{
			width:100%; 
            height: 10%; 
            padding-top:2%; 
            float:top;
           
		}
		.grids_midHead{
			width:100%; 
            height: 35%; 
            float:top;
		}
		
		.grids_comment{
			width:100%; 
            height: 35%; 
            margin-top:6%;
            float:top;
		}
		
		.grids_comz{
			width:100%; 
            height: 100%; 
		}
		
	</style>
</head>
<body>
	<div class="w3-banner-top">
		<div class="agileinfo-dot">
			<div class="w3-banner-grids">
				<div class="col-md-6 w3-banner-grid-left">
					<div class="w3-banner-img">
						<form action="Photo_upload?id=${user.id}" method="post" enctype="multipart/form-data">
							<a href="javascript:;" class="um_file">更换头像 
								<input type="file" name="myFile" class="my_file">
							</a>
							<input type="submit" value="确定" class="sub"/>
							
						</form>
    					
						<img src="${user.photo }" alt="img">
						<h3 class="test">${user.username }</h3>
						<p class="test" >账号：${user.account }</p>
					</div>
				</div>
				<div class="col-md-6 w3-banner-grid-right">
					<div class="w3-banner-text">
						<h3>个人主页</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
							Phasellus dignissim velit sed nibh placerat, non aliquam purus pretium. 
							Donec at justo dignissim, maximus elit et, vestibulum mi.</p>
					</div>
					<div class=" w3-right-addres-1">
						<ul class="address">
							<form action="Photo_message?id=${user.id }" method="post">
								<li>
									<ul class="agileits-address-text ">
										<li class="agile-it-adress-left"><b>出生日期</b></li>
										<li><span>:</span><input type="text" name="user.data" placeholder="${user.data }" class="in_text" /></li>
									</ul>
								</li>
								<li>
									<ul class="agileits-address-text">
										<li class="agile-it-adress-left"><b>地址</b></li>
										<li><span>:</span><input type="text" name="user.address" placeholder="${user.address }" class="in_text" /></li>
									</ul>
								</li>
								<li>
									<ul class="agileits-address-text">
										<li class="agile-it-adress-left"><b>邮件</b></li>
										<li><span>:</span><input type="text" name="user.email" placeholder="${user.email }" class="in_text" /></li>
									</ul>
								</li>
								<li>
									<ul class="agileits-address-text">
										<li class="agile-it-adress-left"><b>爱好</b></li>
										<li><span>:</span><input type="text" name="user.hobby" placeholder="${user.hobby }" class="in_text" /></li>
									</ul>
								</li>
								<li>
									<ul class="agileits-address-text">
										<li class="agile-it-adress-left"><b>个人简介</b></li>
										<li><span>:</span><input type="text" name="user.introduce" placeholder="${user.introduce}" class="in_text" /></li>
									</ul>
								</li>
								<li>
									<ul class="agileits-address-text">
										<li class="agile-it-adress-left"></li>
										<li><span></span>&emsp;&emsp;&emsp;<input type="reset" value="重置" class="sp_input"/>&emsp;
											<input type="submit" value="提交" class="sp_input" />
										</li>
									</ul>
								</li>
							</form>
						</ul> 
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="thim-click-to-bottom">
				<a href="#about" class="scroll">
					<i class="fa  fa-chevron-down"></i>
				</a>
		</div>
	</div>
	
	<!-- xiabian -->
	<div class="w3-about" id="about">
	<div class="container">
		<div class="w3-about-head">
			<h3>知&nbsp;乎</h3>
			<hr />
		</div>
		<div class="w3-about-grids" style="border:0px solid;">
			<div class="grids_top">
				<ul>
					<li>
					<a href="#">动态</a>
					<input type="hidden" name="id" value="<%=request.getParameter("id") %>" />
					</li>
					<li><a href="">回答</a></li>
					<li><a href="">提问</a></li>
					<li><a href="">文章</a></li>
				</ul>
				<hr />
			</div>
			<div class="grids_midT" style="padding-top:2%">我的动态</div>
			<s:if test="#request.questions == null || #request.questions.size() == 0">
			  没有任何动态
			</s:if>
			<s:else>
	
	       
			<s:iterator value="#request.user">
			 <s:iterator value="#request.questions">
			  
			<div class="grids_middle">
	        <hr>
	     
	       <div class="grids_midZong">
        
	        <div class="grids_midTop">
	        <div class="grids_midTopTop">发布了想法</div>
	        
	        <div class="grids_midTopF">
	        
	        <div class="grids_midTopFleft">
	        <img alt="img" src="${photo }" style="width:41px;height:43px;" >
	        </div>
	        <div class="grids_midTopFleftRight">
	        ${username }
	        </div>
	        </div>
	        </div>
	        
	         <div class="grids_midMid">
	         
	         ${what }
	         </div>
	         
	         <div class="grids_midHead">
	         <img alt="img" src="${fileForm }" style="width:164px;height:172px;" >
	        </div>
	         
	         <div class="grids_comment">
	
	         <form action="upload_answers?${question.id }" method="post">
	             <input type="button" class="but" value="评论">
	         </form>
	            
	           <s:iterator value="#request.answers">
  	           <div class="grids_comm">
  	            ${comm }
  	           </div>
  	           	</s:iterator>
	            
	         <form action="saveAnswer?question_id=${id }" method="post">
	         
	          
	           <div class="grids_comz" style="display: none">
               <br><br>
  	           <input type="text" name="comm" placeholder="请写下你的评论" id="txt1" />
  	           
  	    
  	           
  	           <input type="hidden" name="user_id" value="<%=request.getParameter("id") %>" />
  	           <input type="hidden" name="question_id" value="<%=request.getParameter("question_id") %>" />
  	           <input type="submit">
               </div>
	             
	         </form>
	         </div>
	          
	       </div>
            
			</div>
			</s:iterator>
	           </s:iterator>

			</s:else>
		</div>
	</div>
</div>

</body>
</html>