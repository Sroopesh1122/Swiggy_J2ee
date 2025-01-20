<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
  request.setAttribute("menu", "Home");
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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
  
  .section-wrapper{
   display: flex;
   justify-content: space-between;
   align-items: center;
   padding: 10px 30px; 
   background: #ff933a;
   min-height: 93vh;
  }
  
  .section-wrapper img{
   width: 800px;
   height: 700px;
  }
  
  .hero-info{
   flex:1;
   display: flex;
   justify-content: center;
   align-items: flex-start;
   flex-direction: column;
  }
  
  .hero-info h1{
   font-size: 3rem;
   color:  white;
  }
  .hero-info h3{
   font-size: 1.5rem;
  }
  
  .search-wrapper{
   padding: 0px 0px 0px 8px;
   border: 1px solid #efefef;
   border-radius: 20px;
   display: flex;
   justify-content: flex-start;
   align-items: center;
   flex-wrap: nowrap;
   background: white;
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
  
  .detective-dog{
   width: 80px !important;
   height: 80px !important;
   
  }
  
  
  @media (width <1024px) {
  
    .section-wrapper img{
       width: 300px;
       height: 300px;
     }
  
	
  }
  
  @media (width <800px) {
  
   .hero-info h1{
   font-size: 2rem;
  }
  .hero-info h3{
   font-size: 1rem;
  }
  
  
	
  }
  
  @media (width <650px) {
   .section-wrapper{
       flex-direction: column;
       background: #ff933a;
       height: 80vh;
     }
     
   .hero-info h1{
   font-size: 2rem;
   color: white;
  }
  .hero-info h3{
   font-size: 1.3rem;
  }
  
  .search-wrapper{
   background: white;
  }
  }
 
</style>
</head>
<body>
<%@include file="/delivery/Navbar.jsp" %>
 
 <section class="section-wrapper">
 
    <article class="hero-info">
      
       <h1>Choose Your Location & <img alt="" class="detective-dog" src="<%=request.getContextPath()+"/imgs/detective-dog.png"%>"> </h1>
        <h3>Start delivery.</h3>
      
      <form class="search-wrapper" method="get" action="<%=request.getContextPath()+"/delivery/Orders.jsp"%>">
        <input placeholder="Search Location" name="q">
        <button type="submit" class="search-btn">Search <i class="ri-search-line"></i></button>
      </form> 
        
    
    </article>
 
   
    <img alt="" src="<%=request.getContextPath()+"/imgs/delivery-boy-3.png"%>">

 </section>
</body>
</html>