<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,org.bigjava.bean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>

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
    </script>

      <style type="text/css">
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
            height:5%; 
            padding-top:-1%
            background:white;
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
            height: auto; 
            border:1px solid black;
            float:top;
		}
		
		.grids_answer{
			width:100%; 
            height: 50px;         
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
 <div>
 
			
	<%
	                
	   				List<Question> list = (List)request.getAttribute("questions");
	                
	                
					if(list !=null){
			
						 for (int i = 0; i < list.size(); i++) {
						
								 
							 
				%>
			  
			<div class="grids_middle">
	        <hr>
	     
	        <div class="grids_midZong">
        
	            <div class="grids_midTop">               
	       
	        <%=list.get(i).getUser().getUsername() %>&nbsp云:
	  
	        </div>
	        
	         <div class="grids_midMid" style="padding-top:2%;">
	   
	         <%=list.get(i).getWhat() %>
	         </div>
	         
	         <div class="grids_midHead">
	         <img alt="img" src="<%=list.get(i).getFileForm() %>" style="width:164px;height:172px;">
	        </div>
	         
	         <div class="grids_comment">
          
	            
	         <form action="save_answer3?id=${user.id }" method="post">
	          <a href="#" class="but" style="margin-top:-5%;" />评论</a>
	                    
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
  	                <div style="width:80%; height:70px;float:left; padding-top:3%;" >
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
  	           <input type="text" name="comm" placeholder="请写下你的评论" style="width:75%;height:60%;" id="txt1" />
  	           <input class="but_sub" type="submit" value="提交" style="width:10%;height:70%;" />
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

</body>


</html>