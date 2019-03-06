<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				//当键盘键被松开时发送Ajax获取数据
				$('#input_text').keyup(function(){
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
								$('#word').append('<div class="error">Not find  "' + keywords + '"</div>');
							}
							$.each(data.s, function(){
								$('#word').append('<div class="click_work"><strong>'+ this +'</strong></div>');
							})
						},
						error:function(){
							$('#word').empty().show();
							$('#word').append('<div class="click_work">Fail "' + keywords + '"</div>');
						}
					})
				})
				//点击搜索数据复制给搜索框
				$(document).on('click','.click_work',function(){
					var word = $(this).text();
					$('#input_text').val(word);
					$('#word').hide();

				})
	
			})	
		</script>
		<style type="text/css">
			Body{
				background-color:#F6F6F6;
				}
			.total{
				border:1px solid red;
				background:#F6F6F6;
				width:100%;
				height:600px;
			}
			.head{
				background:white;
				border:1px solid green;
				width:100%;
				height:50px;
			}
			.h_left{
				border:1px solid blue;
				width:65%;
				height:100%;
				margin:0 auto;
			}
			.h_left_a{
				border:0px solid red;
				width:90px;
				height:45px;
				float:left;
				
			}
			.h_left_a a img{
				width:80px;
				height:32px;
				padding-top:8px;
			}
			.h_left_b{
				border:0px solid red;
				width:198px;
				height:45px;
				margin-left:10px;
				float:left;
				font-size:16px;
				line-height:46px;
				
			}
			.h_left_b a{
				border:0px solid red;
				padding-right:26px;
				text-decoration:none;

			}
			.h_left_c{
				border:1px solid red;
				width:300px;
				height:45px;
				float:left;
				line-height:46px;
			}
			#input_text{
				background-color:#F6F6F6;
				border: none ;
				width:250px;
				height:30px;
				outline-color: invert ;
				outline-style: none ;
				outline-width: 0px ;
				border-radius:5px;
				border-style: none ;
				text-shadow: none ;
				-webkit-appearance: none ;
				-webkit-user-select: text ;
				outline-color: transparent ;
				box-shadow: none;
			}
			#input_text:focus{
				box-sizing: border-box;
				border:1px solid #000000;
			}
			#input_button{
				width:40px;
				height:30px;
				border:0px;
				color:#ffffff;
				background-color:#0086DB;
				
			}
			#input_button:hover{
				background-color:#2792C3;
			}
			#word{
				position: absolute;
				z-index: 99;
				width: 145px;
				height: auto;
				background-color: white;
				border: black solid 1px;
				display: none;
			}
			.h_left_d{
				border:1px solid red;
				width:45px;
				height:45px;
				float:left;
				line-height:46px;
				margin-left:130px;
				
			}
			.middle{
				border:1px solid yellow;
				background:white;
				width:65%;
				height:300px;
				margin:0 auto;
				margin-top:10px;
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
						<a href="#">首页</a>
						<a href="#">发现</a>
						<a href="#">话题</a>
					</div>
					
					<div class="h_left_c">
						<input type="text" id="input_text" placeholder="搜索" />
						<input type="button" id="input_button" value="提问" style="height:30px;">
						<div id="word"></div>
					</div>
					
					<div class="h_left_d">
						<a href="#"><img src="image/zhong.PNG"/></a>
					</div>
				</div>
				
				
			</div>
			<div class="middle">
				
			</div>
		
		</div>
</body>
</html>