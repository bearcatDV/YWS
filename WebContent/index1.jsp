<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,org.bigjava.bean.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>知乎首页</title>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/wangEditor-1.1.0-min.css">

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src='js/wangEditor-1.1.0-min.js'></script>
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
					document.write("this is："+divVal); 
				}
				
				// 鼠标光标接触事件
				function over(obj){
				  obj.style.backgroundColor="white"
				}
				
				// 失去鼠标光标事件 
				function out(obj){
				 obj.style.backgroundColor="#F6F1B3"
				}
				
				$(function(){
					
					$(".mz_button").click(function(){
						var a = $(this).text();
						if(a == "阅读全文"){
							$('.meddle_content').attr("class","meddle_content1");
							$(this).text("收起全文");
						}
						if(a != "阅读全文"){
							$('.meddle_content1').attr("class","meddle_content");
							$(this).text("阅读全文");
						}
					});
					$(".pl_button").click(function(){
						var a = $(this).text();
						alert("a"+a);
						if(a == "评论"){
							$(this).parent().next().children().show();
							var $editor = $(this).parent().next().children().wangEditor();
							
							$(this).text("收起评论");
						}
						if(a != "评论"){
							$(this).parent().next().children().hide();
							
							$('#txtDiv_sm').hide();
							$(this).text("评论");
						}
					});
					
					
				});
	
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
					/*var fileSize = Math.round(file.size/1024/1024);
					if(fileSize >= 3) {
						alert("请上传小于少于3M的图片");
						return;
					} */
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
						
						if(img.src==""){
							img.style.display="none";
							documnet.getElementById("x").style.display="none";
						}
					};


				};
				//实现取消上传功能
				function call() {
					//将img的src属性赋值为空串
					document.getElementById("image").src = "";
					//选择文件框的value属性赋值为空串
					
					document.getElementById("fileload").value = "";
				};
			
				function NoImage(imgObject){   
					
					this.style.display="none";
					}
			
		</script>
<style type="text/css">

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

 #pop {     display: none; 
            position: absolute; 
            top:; 
            left: 69%; 
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

.middle {
	border: 1px solid yellow;
	width: 55%;
	height: auto !important;
	float:;
}

.middle_left {
	border: 1px solid red;
	background: white;
	width: 70%;
	height: auto !important;
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
	            width: 100%; 
                height: 10%; 
                float:top;
}

.m_left{
                width: 30%; 
                height: 100%; 
                float:left;
            
			}
			
			.m_middle{
                width: 30%; 
                height: 100%; 
                float:left;
                margin-left:5%
            
			}
			
			.m_right{
                width: 30%; 
                height: 100%; 
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
            top: 15%; 
            left: 32%; 
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
		


#txtDiv{
	display: none;
	margin-top:5px;
}


#txtDiv_sm{
	display: none;
}
.content_img{
	background-size:contain|cover;
	width:99%;
	height:100%;
}

</style>

<script type="text/javascript">
$(function(){
    

    //一句话，即可把一个div 变为一个富文本框！o(∩_∩)o 
     

 
});
$(function(){
	$('#txtDiv_sm').click(function(){
		var v_u = $(".txt_content").text();
		
		alert("ab"+v_u);
		$('#txtDiv_hi').val(v_u);
		
	});
		
	
});
	
</script>

</head>
<body>
	<div class="total">
		<div class="head">
			<div class="h_left">
				<div class="h_left_a">
					<a href="#"><img src="image/zhihu.PNG" /></a>
				</div>

				<div class="h_left_b">
					<a href="#">首页</a> <a href="#">发现</a> <a href="upload_topic?id=${user.id }" target="left">话题</a>
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
					<a href="#?${user.id }">
						<img src="image/myPage.png" id="click" style="width:44px;height:41px" />
					</a>
					<div id="pop">
						<div class="nav nav-border"></div>
						<div class="nav nav-background"></div>
						
						<a href="UN_homePage?id=${user.id}"><div id="head_overlay" onmouseover="over(this)"onmouseout="out(this)">
							我的主页
							
						</div></a>
                          <div id="middle_overlay" onclick="javaScriptDiv(id)"
	                   onmouseover="over(this)" onmouseout="out(this)">设置</div>
						<div id="foot_overlay" onclick="javaScriptDiv(id)"
							onmouseover="over(this)" onmouseout="out(this)">退出</div>
					</div>
				</div>
			</div>
					
		</div>	
				
				
   <div style="width:75%;height:auto;margin-left:17.5%;">

		<div class="middle" style="width:62%;height:100%;float:left;">
		
              <div id="dynamic">
                    <iframe src="" id="myframe" name="left" scrolling="no" width="100%" frameborder="0"
         onload="this.height=100px" style="overflow:hidden;"  ></iframe>
		       </div>
		       <script type="text/javascript">
           function reinitIframe()
           {
               var iframe = document.getElementById("myframe");
               try{
                   var bHeight = iframe.contentWindow.document.body.scrollHeight;
                   var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
                   var height = Math.max(bHeight, dHeight);
                   iframe.height =  height;
                   }catch (ex){}
           }
           window.setInterval("reinitIframe()", 200);
           
       </script>
              
			</div>
			<div class="middle_right" style="width:25%;height:100%;float:left;">
				<div class="mr_top">

					<div class="m_left"></div>
				        <div class="m_middle"></div>
				        <div class="m_right">
				        <a href = "#?id=${user.id }" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
				                写想法</a>
				        </div>

					<a href="#">写回答</a> <a href="views/write.jsp?id=${user.id }">写文章</a>

				</div>
			</div>
    </div>
		</div>

	</div>
	
		<div id="light" class="white_content">
		  <h1 style="text-align:center;margin-top:-3%">写想法</h1>
		  <h4 style="text-align:center">ZH写出你的想法</h4>
          
    <form name="fileSave" action="upload_filesave?id=${user.id }"  method="post" enctype="multipart/form-data" style=" margin-align:center;" >  
    <br><br>
   <textarea name="what" rows="15%" cols="70%" style=" margin-left: 2.5%; margin-top:-5%" value="" onkeyup="ifNull();"></textarea>
    <br>
    <input type="file" name="myFile" style="display:none;" onchange="preview()" id="fileload" /> 

<!-- 
    <a href="#" onclick="myFile.click();" name="get_file" style="position: absolute; top:70%; left:5%;" >上传图片</a>
    
 -->

    <button onclick="myFile.click();" name="get_file" style="width:66px;height:18px;text-align:center ; background:white; outline:none; border:none; position: absolute; top:70%; left:5%;" ><a href="#">上传图片</a></button>

     <div style="margin-top:1%"><a id="x" href="#" style="margin-left:20%;" onclick="call();">x</a></div>
	  
	    
		<img src="" id="image" style="width:47px;height:43px;border:1px solid white;margin-left:2%;"  />
        
         <input type="hidden" name="user_id" value="<%=request.getParameter("id") %>" />
         
		<input type="submit" value="提交" id="ifSubmit" disabled="true" style="width:55%; height:40px; margin-left:25%; margin-top:13%; background-color:#00BFFF; border:none" />
   
    </form>
    
    <!-- 判断textarea是否为空 -->
    <script language="javascript" type="text/javascript"> 
       var ifSubmit=document.getElementById("ifSubmit");
          function ifNull () { 
               if(document.fileSave.what.value == "" || document.fileSave.what.value.replace('\s+', '') <= 0 || document.fileSave.what.value == null) {
                   ifSubmit.disabled=true; 
               } else{ 
            	   ifSubmit.disabled=false; 
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