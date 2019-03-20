<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="width=device-width, initial-scale=1; charset=UTF-8">
	<title>个人主页</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css" media="all" />
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<style type="text/css">
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
	</style>
</head>
<body>
	<div class="w3-banner-top">
	<div class="agileinfo-dot">
		<div class="w3-banner-grids">
			<div class="col-md-6 w3-banner-grid-left">
				<div class="w3-banner-img">
					
						<form action="" method="post" enctype="multipart/form-data">
							<a href="javascript:;" class="um_file">更换头像
							<input type="file" name="myfile" class="my_file"></a>
							<input type="submit" value="确定" class="sub"/>
							
						</form>
    					
					
					<img src="image/bg7.png" alt="img">
					<h3 class="test">用户名</h3>
					<p class="test" >账号：654646r</p>
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
								<li>
									<ul class="agileits-address-text ">
										<li class="agile-it-adress-left"><b>出生日期</b></li>
										<li><span>:</span>21-08-1987</li>
									</ul>
								</li>
								<li>
									<ul class="agileits-address-text">
										<li class="agile-it-adress-left"><b>地址</b></li>
										<li><span>:</span>3030 New York, NY, USA</li>
									</ul>
								</li>
								<li>
									<ul class="agileits-address-text">
										<li class="agile-it-adress-left"><b>邮件</b></li>
										<li><span>:</span><a href="mailto:example@mail.com"> info@example.com</a></li>
									</ul>
								</li>
								<li>
									<ul class="agileits-address-text">
										<li class="agile-it-adress-left"><b>爱好</b></li>
										<li><span>:</span><a href="mailto:example@mail.com"> 吃饭，睡觉，打代码</a></li>
									</ul>
								</li>
								<li>
									<ul class="agileits-address-text">
										<li class="agile-it-adress-left"><b></b></li>
										<li><span>:</span><a href="#">www.myresume.com</a></li>
									</ul>
								</li>
							</ul> 

				</div>
			</div>
			
		</div>
		</div>
	</div>


		
	

</body>
</html>