<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/customer/CustomerSession.jsp" %> 
   
   <% 
      
     if(user ==null)
     {
    	 response.sendRedirect(request.getContextPath()+"/customer/SignIn.jsp");
    	 return;
     }
     request.setAttribute("menu", "");
   %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout </title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>

<style type="text/css">
    body {
	min-height: 100vh;
	width: 100%;
	font-family: "outfit", sans-serif;
	max-width: 1800px;
	margin: 0 auto;
	padding:20px 0px;	
}

</style>
</head>
<body>
 <%@include file="/customer/Navbar.jsp"%>
</body>
</html>