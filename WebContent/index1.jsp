<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,org.bigjava.bean.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
			$(function(){
				//当键盘键被松开时发送Ajax获取数据
				$('#c_text').keyup(function(){
					var keywords = $(this).val();
					if (keywords=='') { 
						$('#word').hide(); 
						return 
					};
					$.ajax({
 						url: 'http://suggestion.baidu.com/su?wd=' + keywords,
 						dataType: 'jsonp',
 						jsonp: 'cb',
						beforeSend:function(){
							$('#word').append('<div>正在加载。。。</div>');
						},
						success:function(data){
							$('#word').empty().show();
							if (data.s==''){
								$('#word').append('<div class="error">Not find  "' + keywords + '"');
							}
							$.each(data.s, function(){
								$('#word').append('<div class="click_work"><strong>'+ this +'</strong></div>');
							})
						},
						error:function(){
							$('#word').empty().show();
							$('#word').append('<div class="click_work">Fail "' + keywords + '"');
						}
					})
				})
				//点击搜索数据复制给搜索框
				$(document).on('click','.click_work',function(){
					var word = $(this).text();
					$('#c_text').val(word);
					$('#word').hide();
				});
				
				$(".h_left_d").click(function(e){ 
					$("#i3").toggle(); 
				    e.stopPropagation();
				});
				   
				$(document).click(function(){ 
					$("#word").hide();
					$("#i3").hide(); 
				}); 
				   
				$("#i3").click(function(e){ 
					e.stopPropagation(); 
				});
	
			});
			window.onload=function(){
			      var obj=document.getElementById("pop");
				  var head=document.getElementById("head_overlay");
				  var middle=document.getElementById("middle_overlay");
				  var foot=document.getElementById("foot_overlay");
				  
			      var oBtn=document.getElementById("click");
			      
			       oBtn.onclick=function(){
			        obj.style.display="block";
			      }   
			      document.onclick=function(event){
			        //e对象存在时回返e,当window.event存在时返回event，这样就区分ff,ie
			        var e=e|| window.event;//兼容ie和非ie的event
					
			        var aim=e.srcElement || e.target; //兼容ie和非ie的事件源
					
			        //一种规范 ，判断浏览器 e.srcElement(IE下支持), e.target(ff下支持)
			        if(e.srcElement){
			         var aim=e.srcElement;
			          if(aim!=oBtn && aim!=obj && aim!=head && aim!=middle && aim!=foot){
			            obj.style.display="none";
			          }
			        }else{
			          var aim=e.target;
			          if(aim!=oBtn && aim!=obj && aim!=head && aim!=middle && aim!=foot){
			            obj.style.display="none";
			          }
			        }
			      }     
			}
				
				function javaScriptDiv(obj){
				    var divVal = document.getElementById(obj).innerHTML;
				    
					
				}
				
				// 鼠标光标接触事件
				function over(obj){
				  obj.style.backgroundColor="white"
				}
				
				//失去鼠标光标事件
				function out(obj){
				 obj.style.backgroundColor="#F6F1B3"
				};
				$(function(){
					
					$(".mz_button").click(function(){
						var a = $(this).text();
						if(a == "阅读全文"){
							$(this).prev().attr("class","meddle_content1");
							$(this).text("收起");
						}
						if(a != "阅读全文"){
							$(this).prev().attr("class","meddle_content");
							$(this).text("阅读全文");
						}
					});
					
				});
			
		</script>
<style type="text/css">
body {
	
}

.total {
	border: 1px solid red;
	background: #F6F6F6;
	width: 100%;
	height: auto !important;
}

.head {
	background: white;
	border: 1px solid green;
	width: 100%;
	height: 50px;
}

.h_left {
	border: 1px solid blue;
	width: 65%;
	height: 100%;
	margin: 0 auto;
}

.h_left_a {
	border: 0px solid red;
	width: 90px;
	height: 45px;
	float: left;
}

.h_left_a a img {
	width: 80px;
	height: 32px;
	padding-top: 8px;
}

.h_left_b {
	border: 0px solid red;
	width: 198px;
	height: 45px;
	margin-left: 10px;
	float: left;
	font-size: 16px;
	line-height: 46px;
}

.h_left_b a {
	border: 0px solid red;
	padding-right: 26px;
	text-decoration: none;
}

.h_left_c {
	border: 0px solid red;
	width: 300px;
	height: 45px;
	float: left;
	line-height: 46px;
}

#c_text {
	background-color: #F6F6F6;
	border: none;
	width: 250px;
	height: 30px;
	outline-color: invert;
	outline-style: none;
	outline-width: 0px;
	border-radius: 5px;
	border-style: none;
	text-shadow: none;
	-webkit-appearance: none;
	-webkit-user-select: text;
	outline-color: transparent;
	box-shadow: none;
}

#c_text:focus {
	box-sizing: border-box;
	border: 1px solid #000000;
}

#c_button {
	width: 40px;
	height: 30px;
	border: 0px;
	color: #ffffff;
	background-color: #0086DB;
}

#c_button:hover {
	background-color: #2792C3;
}

#word {
	position: absolute;
	z-index: 99;
	width: 145px;
	height: auto;
	background-color: white;
	border: black solid 1px;
	display: none;
}

.h_left_d {
	border: 0px solid red;
	width: 45px;
	height: 45px;
	float: left;
	margin-left: 105px;
}

#d_button {
	border: 0px soild red;
	width: 43px;
	height: 38px;
	border: 0px;
	margin-top: 10px;
	background-color: white;
	padding-bottom: 5px;
}

#d_button:focus {
	outline: none;
}

#d_button img {
	width: 42px;
	height: 30px;
}

#d_button img:hover {
	width: 43px;
	height: 31px;
}

#i3 {
	position: absolute;
	z-index: 99;
	width: 150px;
	height: 250px;
	background-color: red;
	border: black solid 1px;
	display: none;
}

.h_left_f {
	border: 0px solid red;
	width: 45px;
	height: 45px;
	float: left;
	margin-left: 50px;
}

#f_button {
	outline: none;
	border: 0px;
	padding: 0 0 0 0;
	margin-top: 10px;
	width: 30px;
	height: 30px;
}

#f_button img {
	width: 30px;
	height: 30px;
}

#pop {
	display: none;
	position: absolute;
	margin-top: 15px;
	margin-left: -38px;
	width: 8%;
	height: 15%;
	background-color: #F6F1B3;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 88);
}

.nav {
	position: absolute;
	left: 50px;
	overflow: hidden;
	width: 0;
	height: 0;
	border-width: 10px;
	border-style: solid dashed dashed dashed;
}

.nav-border {
	top: -20px;
	border-color: transparent transparent #DACE7C transparent;
}

.nav-background {
	top: -19px;
	border-color: transparent transparent #F6F1B3 transparent;
}

#head_overlay {
	top: 0%;
	left: 0%;
	width: 100%;
	height: 30%;
	background-color:;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 88);
	margin-top: 5px;
}

#middle_overlay {
	top: 0%;
	left: 0%;
	width: 100%;
	height: 30%;
	background-color:;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 88);
}

#foot_overlay {
	width: 100%;
	height: 30%;
	background-color:;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 88);
}

.middle {
	border: 1px solid blue;
	width: 65%;
	height: 600px;
	margin: 0 auto;
	margin-top: 10px;
}

.middle_left {
	border: 1px solid red;
	background: white;
	width: 70%;
	height: 600px;
	float: left;
}

.middle_right {
	border: 1px solid red;
	background: white;
	width: 29%;
	height: 600px;
	float: right;
}

#middle_top {
	border: 1px solid blue;
	width: 100%;
	float: top;
}

#middle_down {
	border: 1px solid blue;
	width: 100%;
	height: 50px;
	float: top;
}

.meddle_title {
	border: 1px solid white;
	width: 100%;
	height: 35px;
	font-size: 20px;
	font-weight: bold;
	line-height: 8px;
	margin-top: 0px;
}

.meddle_title p {
	margin-top: 15px;
}

.meddle_content {
	border: 1px solid white;
	width: 100%;
	height: 73px;
	font-size: 18px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 3;
}

.meddle_content1 {
	border: 1px solid white;
	width: 100%;
	height: 75px;
	font-size: 18px;
	height: auto !important;
}

.mr_top {
	border: 1px solid red;
	height: 60px;
	width: 100%;
}
</style>

</head>
<body>
	<div class="total">
		<div class="head">
			<div class="h_left">
				<div class="h_left_a">
					<a href="#"><img src="image/zhihu.PNG" /></a>
				</div>

				<div class="h_left_b">
					<a href="#">首页</a> <a href="#">发现</a> <a href="#">话题</a>
				</div>

				<div class="h_left_c">
					<input type="text" id="c_text" placeholder="搜索" /> <input
						type="button" id="c_button" value="提问" />
					<div id="word"></div>
				</div>

				<div class="h_left_d">
					<button id="d_button">
						<img src="image/zhong.PNG" />
					</button>
					<div id="i3">
						<div>1</div>
						<div>2</div>
					</div>
				</div>

				<div class="h_left_f">
					<button id="f_button">
						<img src="image/zhong.PNG" id="click" />
					</button>
					<div id="pop">
						<div class="nav nav-border"></div>
						<div class="nav nav-background"></div>
						<div id="head_overlay" onmouseover="over(this)"
							onmouseout="out(this)">
							<a href="UN_homePage?id=${user.id}">我的主页</a>
						</div>

						<div id="foot_overlay" onclick="javaScriptDiv(id)"
							onmouseover="over(this)" onmouseout="out(this)">退出</div>
					</div>
				</div>
			</div>
					
		</div>	
				
				
			

		<div class="middle">
			<div class="middle_left">

				<%
					List<Question> list = (List)request.getAttribute("questions");
					System.out.println("index1.jsp"+list);
					for (int i = 0; i < list.size(); i++) {
				%>
				<div id="middle_top">
					<div class="meddle_title">
						<p><%=list.get(i).getWhat() %></p>
					</div>
					<div class="meddle_content">
						<%=list.get(i).getUser().getUsername() %>说：xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx打发打发发色二等分发送到发送到发送到发发生的发生发生的发生发生的发生
						打算发到付发生的发生发送到发飞洒地方飞洒地方是打发打发发送到发染发地方染发地方人打算发达人法地生发送到发飞洒地方飞洒地方
						是打发打发发送到发染发地方染发地方人打算发达人法地</div>
					<button type="button" class="mz_button">阅读全文</button>

				</div>
				<hr style="border: none; border-top: #ccc dashed 2px;" />
				<%
					}
				%>

			</div>
			<div class="middle_right">
				<div class="mr_top">
					<a href="#">写回答</a> <a href="views/write.jsp">写文章</a>
				</div>
			</div>

		</div>

	</div>

</body>
</html>