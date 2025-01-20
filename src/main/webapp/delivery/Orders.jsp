<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
  request.setAttribute("menu", "");
  String q = request.getParameter("q")!=null ? request.getParameter("q") :"";
 
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp" %>

<style type="text/css">
  
  body{
   font-family: "outfit",sans-serif;
   padding: 20px 0px;
   width: 100%;
   max-width: 1800px;
   margin: 0 auto;
  }
  
  .search-section{
   display: flex;
   justify-content: center;
   align-items: center;
   width: 100%;
  }
  
  .search-wrapper{
   padding: 2px 8px;
   border: 1px solid #efefef;
   border-radius: 20px;
   display: flex;
   justify-content: flex-start;
   align-items: center;
   flex-wrap: nowrap;
   width: 100%;
   max-width: 500px;
  }
  
  .search-wrapper input{
   flex: 1;
   padding-right: 5px;
  }
  
  input{
   outline: none;
   border: none;
   background: transparent;
  }
  .search-btn{
   font-size: 0.9rem;
   border: none;
   outline:  none;
   padding: 2px 5px;
   border-radius: 20px;
   background: #ff933a;
   white-space: nowrap;
  }
 
 
</style>
</head>
<body>
<%@include file="/delivery/Navbar.jsp" %>
 
 <section class="section-wrapper">
   
   <article class="search-section">
      <div class="search-wrapper">
        <input placeholder="Search Location" value="<%=q%>">
        <button class="search-btn">Search <i class="ri-search-line"></i></button>
      </div> 
   </article>
   
   <%
    
   if(q==null || q.trim().equalsIgnoreCase(""))
   {
	   %>
	     
	     <article class="error-section-1">
	              
	     </article>
	   
	   <%
   }
   
   %>
   
   
   
     
   


 </section>
</body>
</html>