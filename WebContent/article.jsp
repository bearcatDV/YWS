<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,org.bigjava.bean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
   <script type="text/javascript">
   $(function(){
	   
	   $(".comm_button").click(function(){
		      var but = $(this).val();
		      
		      
		      if(but=="评论"){
		    	  $(this).next().show();
		    	  
				  $(this).val("收起评论");

		      }else{
		    	  
		    	  $(this).next().hide();
					$(this).val("评论");
		      }
			  });
		
		$(".mz_button").click(function(){
			
			var but = $(this).text();
			
				if(but=="阅读全文﹀"){
					$(this).prev().show();
					$(this).prev().prev().hide();
					$(this).text("收起︿");
					$(this).css("margin-left","73%");
				}else{
					$(this).prev().hide();
					$(this).prev().prev().show();
					$(this).text("阅读全文﹀");
					$(this).css("margin-left","0");
				}
			});
		
		
	});
 </script>

  <style type="text/css">
  
     .atr_zong{
     
             width:75%;
             height:auto;
 
             
     
     }
     
     .atr_zong1{
     
             width:100%;
             height:40px;
             padding-top:15px;
            
     
     }
     
     .atr_zong2{
     
             width:100%;
             height:20%;
 
     
     }
     
     .atr_zong3{
     
             width:100%;
             height:60px;
           
     
     }
     
     
     .atr_zong5{
     
           width:100%;
           height:auto;
	       margin-top:5px;
     
     }
     .atr_zong5left img{
            width:164px;
            height:172px;

     }
     
     .atr_zong5right{
         margin-left:-6%;
         line-height:200px;
         overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp:1;
     }
    
    .atr_zong6{
	width: 100%;
	height: 75px;
	font-size: 18px;
	height: auto !important;
}
    
    a:link{color:black;
	        font-size:30;
			text-decoration:none;
			font-weight:bold;
			}           
    
  </style>

</head>
<body>


   <div>
     <div class="atr_zong1">我的文章</div>
     
     <%
                    
	   				List<Article> list = (List)request.getAttribute("articles");
                    Integer reviLenth = (Integer)request.getAttribute("reviLenth");
	                
					if(list !=null){
						System.out.println("index1.jsp"+list);
			
						 for (int i = 0; i < list.size(); i++) {
						
								 
							 
				%>
     
     <div class="atr_zong2">
     
     <%=list.get(i).getArticle_title() %>
     
     </div>
     <div class="atr_zong3">
       <div style="width:6%;height:60px;float:left;padding-top:8px;">
       
       <img alt="img" src="<%=list.get(i).getUser().getPhoto() %>" style="width:41px;height:43px;" >
       </div>
       <div style="width:20%;height:60px;float:left; background-color:yellow;line-height:60px ">
       <%=list.get(i).getUser().getUsername() %>
    
       </div>
       
     </div>
     
     
     <div class="atr_zong5">
      <div class="atr_zongz" style="width:100%;height:200px;">
      <div class="atr_zong5left" style="width:30%;height:auto;margin-left:-6%;float:left;">
     	<img alt="img" src="<%=list.get(i).getPicture() %>" >
      </div>
      
       <div style="width:60%;height:200px;float:left;">
       
     	<div class="atr_zong5right" style="width:100%;height:120px;float:top;">  
     	<%=list.get(i).getContent() %>    	
     	</div>
     	
     	<div style="width:100%;height:80px;float:top;margin-left:-6%;">
     	
     	</div>
     	
     	</div>
     	
     	</div>
     	
     
     </div>
     
     <div class="atr_zong6" style="display:none">
     
       <div style="width:81%;">
     	<img alt="img" src="<%=list.get(i).getPicture() %>" >
     </div>
     
     <div style="width:81%;">
     	 <%=list.get(i).getContent() %>
     </div>
     	
     </div> 
   
    <a href="#" class="mz_button">阅读全文﹀</a>
   
    <div>

     <form action="saveReview?id=${user.id }" method="post">
   
     <input type="button" class="comm_button" value="评论" />
    
      <div class="atr_TOPZ" style="display: none;margin-top:2%;">
      <%
  	              List<Review> lists = (List)request.getAttribute("reviews");
  	
  	               if(lists!=null){
  	               
  	            	   int z = list.get(i).getId();
  	            
  	            	   for(int j=0; j<lists.size();j++){
  	            		if(z==lists.get(j).getArticle().getId()){
  	            		
  	  %>
  	            
    
     <div class="atr_top" style="width:100%;height:60px;background:white;float:top">
       <div class="atr_top1" style="width:6%;height:60px;background:yellow;float:left;">
       
        <img alt="img" src="<%= lists.get(j).getUser().getPhoto()%>" style="width:41px;height:43px;margin-top:8px;">
       </div>
       <div class="atr_top2" style="width:10%;height:60px;background:green;float:left;line-height:60px;">
        <%=lists.get(j).getUser().getUsername() %>
       </div>
     </div>
     <div class="atr_Review">
      <%=lists.get(j).getComm() %>
     </div>
     
     <%
  	            		}
  	            		}
  	            	   }
     %>
     
     <div class="atr_zong6" style="width:100%;height:50px;">
   
      
        <input type="text" name="comm" />
        <input type="submit" value="添加评论" />
      
      <input type="hidden" name="user_ID" value="<%=request.getParameter("id") %>" />
      <input type="hidden" name="article_ID" value="<%=list.get(i).getId() %>" />
      
      </form>
   </div>
     
     </div>
     
     </div>
     <hr>
     <%
						 }
					}
     
    %>
   
   
   </div>

</body>
</html>