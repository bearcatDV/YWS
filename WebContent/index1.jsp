<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	    
		
		function javaScriptDiv(obj){
		    var divVal = document.getElementById(obj).innerHTML;
			document.write("this is："+divVal); 
		}
		
		// 鼠标光标接触事件
		function over(obj){
		  obj.style.backgroundColor="white"
		}
		
		//失去鼠标光标事件
		function out(obj){
		 obj.style.backgroundColor="#F6F1B3"
		};
	
		
		//实现预览功能
		function preview() {
			//获取文件框的第一个文件,因为文件有可能上传多个文件,咱这里是一个文件
			var file = document.getElementById("fileload").files[0];
			//可以进行一下文件类型的判断
			var fileType = file.type.split("/")[0];
			if(fileType != "image") {
				alert("请上传图片")
				return;
			}
			//图片大小的限制
			var fileSize = Math.round(file.size/1024/1024);
			if(fileSize >= 3) {
				alert("请上传小于少于3M的图片");
				return;
			}
			//获取img对象
			var img = document.getElementById("image");
			//建一条文件流来读取图片
			var reader = new FileReader();
			//根据url将文件添加的流中
			reader.readAsDataURL(file);
			//实现onload接口
			reader.onload = function(e) {
				//获取文件在流中url
				url = reader.result;
				
				//将url赋值给img的src属性
				img.src = url;
			};


		};
		//实现取消上传功能
		function call() {
			//将img的src属性赋值为空串
			document.getElementById("image").src = "";
			//选择文件框的value属性赋值为空串
			
			document.getElementById("fileload").value = "";
		};
	
}
		
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
				border:0px solid red;
				width:300px;
				height:45px;
				float:left;
				line-height:46px;
			}
			#c_text{
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
			#c_text:focus{
				box-sizing: border-box;
				border:1px solid #000000;
			}
			#c_button{
				width:40px;
				height:30px;
				border:0px;
				color:#ffffff;
				background-color:#0086DB;
				
			}
			#c_button:hover{
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
				border:0px solid red;
				width:45px;
				height:45px;
				float:left;
				margin-left:105px;	
			}
			#d_button {
				border:0px soild red;
				width:43px;
				height:38px;
				border:0px;
				margin-top:10px;
				background-color:white;
				padding-bottom:5px;
			}
			#d_button:focus{
				outline:none;
			}
			#d_button img{
				width:42px;
				height:30px;
			}
		
			#d_button img:hover{
				width:43px;
				height:31px;
			}
			#i3{
				position: absolute;
				z-index: 99;
				width: 150px;
				height: 250px;
				background-color: red;
				border: black solid 1px;
				display: none;
			}
			.h_left_f{
				border:0px solid red;
				width:45px;
				height:45px;
				float:left;
				margin-left:50px;
			
			}
			#f_button{
				outline: none;
				border:0px;
				padding:0 0 0 0;
				margin-top:10px;
				width: 30px; 
				height: 30px;
			}
			#f_button img{
				width: 30px; 
				height: 30px;
			}
			#pop {   
				display: none; 
            	position: absolute; 
            	margin-top:15px;
            	margin-left:-38px;
            	width: 8%; 
            	height: 15%; 
           		background-color: #F6F1B3; 
            	z-index:1001; 
            	-moz-opacity: 0.8; 
            	opacity:.80; 
            	filter: alpha(opacity=88);
			}
			
    		.nav {
            	position:absolute;
            	left:50px;
            	overflow:hidden;
            	width:0;
            	height:0;
            	border-width:10px;
            	border-style:solid dashed dashed dashed;
        	}
        	.nav-border {
            	top:-20px;
            	border-color:transparent transparent #DACE7C transparent;
        	}
        	.nav-background {
           		top:-19px;
            	border-color:transparent transparent #F6F1B3 transparent;
        	}
			
      		#head_overlay{ 
           		top: 0%; 
            	left: 0%; 
            	width: 100%; 
            	height: 30%; 
            	background-color: ; 
            	z-index:1001; 
            	-moz-opacity: 0.8; 
            	opacity:.80; 
            	filter: alpha(opacity=88); 
				margin-top:5px;
        	} 
			#middle_overlay{ 
            	top: 0%; 
            	left: 0%; 
            	width: 100%; 
            	height: 30%; 
           		background-color:; 
            	z-index:1001; 
            	-moz-opacity: 0.8; 
            	opacity:.80; 
            	filter: alpha(opacity=88);
    		
        	} 
			#foot_overlay{ 
           		width: 100%; 
            	height: 30%; 
            	background-color:; 
            	z-index:1001;
            	-moz-opacity: 0.8;
            	opacity:.80; 
            	filter: alpha(opacity=88);
      			
        	}
			div{
		    	text-align:center;
				line-height: 200%;
			
				text-color:block;
			}
			
			.middle{
				border:1px solid yellow;
				background:white;
				width:65%;
				height:89%;
				margin:0 auto;
				margin-top:10px;
			}
			
			.middle_left{
                width: 69%; 
                height: 100%; 
                background-color: #F6F1B3; 
                float:left;
            
			}
			
			.middle_right{
                width: 30%; 
                height: 100%; 
                background-color: #F6F1B3; 
                float:left;
                margin-left:1%;
            
			}
			
			.m_left_top{
                width: 100%; 
                height: 20%; 
                background-color: white; 
                float:top;
            
			}
			
			.m_left{
                width: 30%; 
                height: 100%; 
                background-color: yellow; 
                float:left;
            
			}
			
			.m_middle{
                width: 30%; 
                height: 100%; 
                background-color: red; 
                float:left;
                margin-left:5%
            
			}
			
			.m_right{
                width: 30%; 
                height: 100%; 
                background-color: yellow; 
                float:right;
            
			}
			
			.black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 20%; 
            left: 30%; 
            width: 33%; 
            height: 65%; 
            padding: 20px;  
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
        
        textarea{
            resize: none;
        }
	    
	    a:link,a:visited{
            text-decoration:none;
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
					<input type="text" id="c_text" placeholder="搜索" />
					<input type="button" id="c_button" value="提问" />
					<div id="word"></div>
				</div>
					
				<div class="h_left_d">
					<button id="d_button"><img src="image/zhong.PNG"/></button>
					<div id="i3">
						<div>1</div>
						<div>2</div>
	  				</div>
				</div>
					
				<div class="h_left_f">
					<button id="f_button"><img src="image/zhong.PNG"id="click" />
					</button>
					<div id="pop">
	   					<div class="nav nav-border"></div>
       					<div class="nav nav-background"></div>
       					<div id="head_overlay" onclick="javaScriptDiv(id)"
							onmouseover="over(this)" onmouseout="out(this)">我的主页</div>
	   
	   					<div id="middle_overlay" onclick="javaScriptDiv(id)"
							onmouseover="over(this)" onmouseout="out(this)">设置</div> 
	   
	   					<div id="foot_overlay" onclick="javaScriptDiv(id)"
							onmouseover="over(this)" onmouseout="out(this)">退出</div>
    				</div>
				</div>
			</div>
					
		</div>	
				
				
			
		<div class="middle">
				<div class="middle_left"></div>
				<div class="middle_right">
				    <div class="m_left_top">
				        <div class="m_left"></div>
				        <div class="m_middle"></div>
				        <div class="m_right">
				        <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
				                写想法</a>
				        </div>
				    </div>
		</div>
				
		</div>
		
	</div>
		
		<div id="light" class="white_content">
		  <h1>写想法</h1><h4>ZH写出你的想法</h4>
          
    <form name="fileSave" action="upload"  method="post" enctype="multipart/form-data" style=" margin-align:center;" >  
    <br><br>
   <textarea name="what" rows="15%" cols="70%" style="margin-top:-15%" value="" onkeyup="ifNull();"></textarea>
    <br>
    <input type="file" name="myFile" style="display:none;" onchange="preview()" id="fileload" /> 
    <input type="button" value="浏 览" onclick="myFile.click();" name="get_file" style=" margin-left:-75%; background:white; outline:none; border:none " />

		<input type="button" value="x" style="outline:none;" onclick="call();" />
		
		<img id="image" width:10%; height:20% />

        <br>
		<input type="submit" value="提交" id="ifSubmit" disabled="true" style="width:55%; height:70%; margin-left:-10%; margin-top:10%; background-color:#00BFFF; border:none" />
    </form>
    
    <!-- 判断textarea是否为空 -->
    <script language="javascript" type="text/javascript"> 
       var ifSubmit=document.getElementById("ifSubmit");
          function ifNull () { 
               if(document.fileSave.what.value!="") {
                   ifSubmit.disabled=false; 
               } else{ 
            	   ifSubmit.disabled=true; 
                 }
          }
   </script>
    
        </div> 
        <div id="fade" class="black_overlay">
            <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
                   <div style="position: absolute; top: 10%; left: 70%; color: white; font-size:30px ">X</div></a>
        </div> 
    
</body>
</html>