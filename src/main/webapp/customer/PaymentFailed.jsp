<%@page import="com.swiggy.dao.impl.OrderDAOImp"%>
<%@page import="com.swiggy.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Payment Failed</title>
 <link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/imgs/icon.ico">
<%
  if(request.getParameter("razorpayOrderId")!=null)
  {
	  OrderDAO orderDAO =  new OrderDAOImp();
	  orderDAO.deleteOrdersByRazorPayId(request.getParameter("razorpayOrderId"));
  }

%>    
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    
    <style type="text/css">
     body{
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      max-width: 1800px;
      font-family: "outfit",sans-serif;
     }
     
     #cancelled-section img{
      width: 300px;
      height: 300px;
     }
     
     #cancelled-section h1{
      transform:translateY(-50px);
      text-align: center;
     }
     
     #cancelled-section h6{
      transform:translateY(-50px);
      text-align: center;
      font-size: 0.8rem;
     }
     
     #cancelled-section h6 a{
      color: black !important;
     }
     
     
     
     
    </style>
</head>
<%@include file="/customer/CustomerSession.jsp" %>
<%
 if(user==null)
 {
	 response.sendRedirect(request.getContextPath()+"/customer/SignIn.jsp");
	 return;
 }
%>
<body>
      
     
      <section id="cancelled-section" >
       <img alt="" class="cancle-img" src="<%=request.getContextPath()+"/imgs/sad-dog2.png"%>">
       <h1>Payment Failed !</h1>
       <h6> <a href="<%=request.getContextPath()+"/customer/Orders.jsp"%>">Go to orders</a> </h6>
     </section> 

</body>
</html>