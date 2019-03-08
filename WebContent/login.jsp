<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>登录and注册</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/login.css" />
	
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/login.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#login_btn").click(function(){
			var u_v = $("input[name='username']").val();
			var p_v = $("input[name='password']").val();
			if("" == u_v){
				alert("用户名不能为空");
				return false;
			}
			
			if("" == p_v){
				alert("密码不能为可空");
				return false;
			}
		
			var params = {
				username : u_v,
				password : p_v
			};
			
			$.ajax({
				url:"User_login",
				type:"post",
				data:params,
				dataType:"json",
				success:function(data,textStatus){
					$("#lab_type1").html(data.result);
				},
				error:function(data,textStatus){
					alert("Oops,ajax callback error,pls output more ....");
					return false;
				}
			});
		});
	});
	
	</script>
</head>
<body style="background: url(image/bg7.png) no-repeat center center fixed;background-size:cover">

	<center style="margin-top:20px;">
	<a id="Login_start_" class="btn btn-danger" style="width:100px;height:40px;border-radius: 0;">登陆</a>
	<a id="Regist_start_" class="btn btn-success" style="width:100px;height:40px;border-radius: 0;">注册</a>
	</center>
	
	<!-- 登录页面  -->
	<div id='_start'>
		<div id='_close' style="display: none;">
			<span class="glyphicon glyphicon-remove"><s:property value="result"/></span>
		</div>
		<br />
		<!--登录框-->
		<div id="login_container">
			<div id="lab1">
				<span id="lab_login">登录页面</span>
				<span id="lab_toRegist">
					&emsp;还没有账号&nbsp;
					<span id='toRegist' style="color: #EB9316;cursor: pointer;">立即注册</span>
				</span>
			</div>
			<div style="width:330px;">
				<span id="lab_type1"></span>
			</div>
			<div id="form_container1">
				<br />
				<form action="User_login" method="post" onsubmit="return check(this)">
					<input type="text" name="user.username"class="form-control" placeholder="手机号/用户名" id="login_number" />
					<input type="password" name="user.password"class="form-control" placeholder="密码" id="login_password" />
					<input type="submit" value="登录" class="btn btn-success" id="login_btn" />
					<s:token></s:token>
					<span id="rememberOrfindPwd">
						<span>
							<input id="remember" type="checkbox" style="margin-bottom: -1.5px;">
						</span>
						<span style="color:#000000">
							记住密码&emsp;&emsp;&emsp;&emsp;
						</span>
						<span style="color:#000000">
							忘记密码
						</span>
					</span>
				</form>
			</div>
		
		</div>
		<!-- 注册页面 -->
		<div id='regist_container' style="display: none;">
			<div id="lab1">
				<span id="lab_login">注册页面</span>
				<span id="lab_toLogin">
					&emsp;已有账号&nbsp;
					<span id='toLogin' style="color: #EB9316;cursor: pointer;">立即登录</span>
				</span>
			</div>
			<form action="User_zhu" method="post">
				<div id="form_container2" style="padding-top: 25px;">
					<input type="text" class="form-control" placeholder="用户名" id="regist_account">
					<input type="password" class="form-control" placeholder="密码" id="regist_password1" />
					<input type="password" class="form-control" placeholder="确认密码" id="regist_password2" />
					<input type="text" class="form-control" placeholder="手机号" id="regist_phone" />
				</div>
				<input type="button" value="注册" class="btn btn-success" id="regist_btn" />
			</form>
		</div>
	</div>

</body>
</html>