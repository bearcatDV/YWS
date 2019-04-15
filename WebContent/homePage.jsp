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
	
	  
	<script type="text/javascript">
	  $(document).ready(function(){
			
		  $(".but").click(function(){
	      var sub = $(this).text();
	      
	      if(sub=="评论"){
		  $(this).next().show();

		  $(this).text("收起评论");

	      }else{
	    	  
	    	  $(this).next().hide();
	    	  $(this).text("评论");
	      }
		  });  
		});
	  
	 function dynamic(){
		 var val = document.getElementById("dyna");
		 val.style.display="none";
		 var di = document.getElementById("dis");
		 di.style.display="block";
	 }
	
    </script>

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
		.w3-about{
			border:0px solid blue;
			width:100%;
			height:auto;
		}
		
		.if_top ul li{
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
            height:auto; 
		}
		
		
		.grids_midZong{
			width:100%; 
            height: auto; 
            float:top;
		}
		
		.grids_midTop{
			width:100%; 
            height:20%; 
            padding-top:-1%
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
            
            float:left;
           
		}
		
		.grids_midMid{
			width:100%; 
            height: 10%;  
            margin-top:8%;
            float:top;
           
		}
		.grids_midHead{
			width:100%; 
            height: 35%; 
            margin-top:3%;
            float:top;
		}
		
		.grids_comment{
			width:100%; 
            height:45%; 
            margin-top:4%;
            float:top;
		}
		
		.grids_comz{
			width:100%; 
            height: 75%; 
          
		}
		
		.grids_comzHead{
			width:100%; 
            height: 40px; 
            border:1px solid black;
            float:top;
		}
		
		.question_answers{
			width:100%; 
            height: 80%; 
            border:1px solid black;
            float:top;
		}
		
		.grids_answer{
			width:100%; 
            height: 50px; 
            border:1px solid black;           
            float:top;
		}
		
		a:link{color:black;
	        font-size:30;
			text-decoration:none;
			font-weight:bold;
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
	 
	
	  
		<div class="w3-about-head">
			<h3>知&nbsp;乎</h3>
			<hr />
		</div>
		
		<%
           Object artiLenth = request.getAttribute("artiLenth");
		%>
		
		<div class="if_zong" style="width:75%;height:100%;margin:0 auto;">
		  <div class="if_top" style="width:100%;height:10%;float:top;">
		    <ul>
				
					<li>
					<a href="UN_dynamic?id=${user.id }" target="left" onClick="dynamic()" >动态
					<input type="hidden" name="id" value="<%=request.getParameter("id") %>" />
					</a>
					
					</li>
					<li><a href="">回答</a></li>
					<li><a href="">提问</a></li>
					<li><a href="UN_article?id=${user.id }" target="left" onClick="dynamic()">文章&nbsp<%=artiLenth %>
					<input type="hidden" name="id" value="<%=request.getParameter("id") %>" />
					</a></li>
					
				</ul>
				
				<hr />
		    
		  </div> 
		  
		  <div class="if_foot" style="width:100%;height:100%;float:top">
		  
		    <div class="if_footLeft" style="width:70%;height:100%;float:left;">
		    
		    <div id="dyna">
		    
		    	    <div class="grids_midT" style="padding-top:2%">我的动态</div>
			
	<%
	                
	   				List<Question> list = (List)request.getAttribute("questions");
	                
	
					if(list !=null){
						System.out.println("index1.jsp"+list);
			
						 for (int i = 0; i < list.size(); i++) {
						
								 
							 
				%>
			  
			<div class="grids_middle">
	        <hr>
	     
	        <div class="grids_midZong">
        
	        <div class="grids_midTop">
	        <div class="grids_midTopTop" style="margin-top:-1%;">发布了想法</div>
	        
	        <div class="grids_midTopF">
	        
	        <div class="grids_midTopFleft" style="padding-top:1%;">
	        <img alt="img" src="<%=list.get(i).getUser().getPhoto() %>" style="width:41px;height:43px;" >
	        </div>
	        <div class="grids_midTopFleftRight" style="padding-top:2%;padding-left:3%">
	        <%=list.get(i).getUser().getUsername()%>
	        </div>
	        </div>
	        </div>
	        
	        <div class="grids_midMid" style="padding-top:2%;">
	       
	         <%=list.get(i).getWhat() %>
	         </div>
	         
	         <div class="grids_midHead">
	         <img alt="img" src="<%=list.get(i).getFileForm() %>" style="width:164px;height:172px;">
	        </div>
	         
	         <div class="grids_comment">
	          
	         <form action="save_answer?id=${user.id }" method="post">
	          
	          <a href="#" class="but" style="margin-top:-5%;" />评论</a>
	          
	          <!--  
	           <input type="button" class="but" style="margin-top:-5%;" value="评论">
	          -->
	          
	           <div class="grids_comz" style="display: none">
                   <div class="grids_comzHead">
                   
                  </div>
  	          
  	            <%
  	              List<Answer> lists = (List)request.getAttribute("answers");
  	
  	               if(lists!=null){
  	               
  	            	   int z = list.get(i).getId();
  	            
  	            	   for(int j=0; j<lists.size();j++){
  	            		if(z==lists.get(j).getQuestion().getId()){
  	            		
  	            %>
  	               
  	             
  	             <div class="question_answers">
  	              <div style="width:100%; height:70px;float:top;">
  	                <div  style="width:8%; height:70px%;float:left; padding-top:2%; padding-left:2%;">
  	                   <img alt="img" src="<%=lists.get(j).getUser().getPhoto() %>" style="width:41px;height:43px;" > 
  	                </div>
  	                <div style="width:80%; height:70px;float:left; padding-top:3%;padding-left:1%;" >
  	                  <%=lists.get(j).getUser().getUsername() %>
  	                </div>
  	              </div>
  	              <div style="width:90%;height:40px;float:top;padding-left:2%;padding-top:-10px;">
  	               <%=lists.get(j).getComm() %>  
  	              </div>
  	            
  	           </div>
  	           
  	           <%
  	               }
						 
  	               }
  	               }
  	           %>
  	           <div class="grids_answer" style="padding-top:1%;">
  	           <input type="text" name="comm" placeholder="请写下你的评论" id="txt1" />
  	           <button><a target="right">提交</a></button>
  	           </div>
  	           
  	           <input type="hidden" name="user_id" value="<%=request.getParameter("id") %>" />
  	           <input type="hidden" name="question_id" value="<%=list.get(i).getId() %>" />
  	           
               </div>
	             
	         </form>
	         
	         </div>
	         
	          
	       </div>
            
			</div>
			<%
  	            	 
  	               }
						}
					
				%>
			
		    </div>
		    
		    <div id="dis" style="display:none;">
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
		    
		    <div class="if_footRight" style="width:29%;height:800px;float:left;margin-left:1%;">
		    
		       <div style="width:100%;height:60px;background:red;float:top;line-height:60px;">
		               个人成就
		       </div>
		       
		       <div style="width:100%;height:80px;background:yellow;float:top;text-align:center;line-height:80px;">
		             参与了<%=artiLenth %>  次文章编辑
		       </div>
		      
		      <div style="width:100%;height:100px;background:red;float:top; margin-top:10px;">
		      
		        <div style="width:50%; height:100px;float:left; background:green;;text-align:center;line-height:100px;">关注了</div>
		        <div style="width:50%; height:100px;float:left;background:yellow;text-align:center;line-height:100px;">关注者</div>
		         
		       </div>
		       
		       <hr>
		       <a href="#">关注的话题</a>
		       
		       <hr>
		       <a href="#">关注的专栏</a>
		       
		       <hr>
		       <a href="#">关注的问题</a>
		       
		       <hr>
		       <a href="#">关注的收藏夹</a>
		       
		       <hr>
		       <p style="font-size:12px;"><a href="#">XXX</a><a href="#">•论坛指南</a><a href="#">•论坛协议</a><a href="#">•论坛隐私保护指引</a></p>
		       
		       <p style="font-size:12px;"><a href="#">应用</a><a href="#">•工作</a><a href="#">•申请开通论坛机构号</a></p>
		       
		       <p style="font-size:12px;"><a href="#">侵权举报</a><a href="#">•网上有害信息举报专区</a></p>
		       
		       <p style="font-size:12px;"><a href="#">违法和不良信息举报：110</a></p>
		       
		       <p style="font-size:12px;"><a href="#">儿童色情信息举报专区</a></p>
		       
		       <p style="font-size:12px;"><a href="#">电信与服务行业经营许可证</a></p>
		       
		       <p style="font-size:12px;"><a href="#">网络文化经营许可证</a></p>
		       
		       <p style="font-size:12px;"><a href="#">联系我们 @2019</a></p>
		      
		    </div>
		  
		  </div>
		  
		</div>
		
	
</div>

</body>
</html>