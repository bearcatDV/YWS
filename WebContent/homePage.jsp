<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			border:1px solid blue;
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
		.grids_middle{
			
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
		<div class="w3-about-grids">
			<div class="grids_top">
				<ul>
					<li><a href="">动态</a></li>
					<li><a href="">回答</a></li>
					<li><a href="">提问</a></li>
					<li><a href="">文章</a></li>
				</ul>
				<hr />
			</div>
			<div class="grids_middle">
				<%
					for(int i=0;i<4;i++){
						
					}
				%>
				
			</div>
			
		</div>
	</div>
</div>

</body>
</html>