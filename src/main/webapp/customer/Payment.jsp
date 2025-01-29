<%@page import="com.app.utils.AppProperties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Payment</title>
    <link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/imgs/icon.ico">
    
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
     
     .processing-img{
      width: 600px;
      height: 400px;
      border-radius: 20px;

     }
     .cancle-img{
      width: 300px;
      height: 300px;
     }
     
     .hide{
      display: none;
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
     
     <section id="processing-section" >
       <img alt="" class="processing-img" src="https://cdn.dribbble.com/users/447957/screenshots/6899626/payment-animation.gif">
    
     </section> 
     
      <section id="cancelled-section" class="hide" >
       <img alt="" class="cancle-img" src="<%=request.getContextPath()+"/imgs/sad-dog2.png"%>">
       <h1>Payment Cancelled</h1>
       <h6> <a href="<%=request.getContextPath()+"/customer/Orders.jsp"%>">Go to orders</a> </h6>
     </section> 
   
     
    

    <script>
    var options = {
        "key": "<%=AppProperties.get("RAZORPAY_API_KEY")%>", // Razorpay key ID
        "amount": "<%= request.getAttribute("total_amount") %>" * 100, 
        "currency": "INR",
        "name": "Sroopesh",
        "description": "Demo Transaction",
        "order_id": "<%= request.getAttribute("razorpay_order_id") %>", 
        "handler": function (response) {
        	// This function will execute after successful payment
            window.location.href = "<%=request.getContextPath()%>"+"/order/payment/verify?razorpay_payment_id=" + response.razorpay_payment_id +
                                   "&razorpay_order_id=" + response.razorpay_order_id +
                                   "&razorpay_signature=" + response.razorpay_signature+"&source="+'<%=request.getAttribute("source")%>';
        },
        "prefill": {
            "name": "<%=user.getName()%>",
            "email": "<%=user.getEmail()%>",
            "contact": "<%=user.getPhoneNumber()%>"
        },
        "theme": {
            "color": "#feb80a"
        },
        "modal": {
            "escape": true, // Allow closing via the Escape key
            "ondismiss": function() {
                window.location.href="<%=request.getContextPath()+"/customer/PaymentFailed.jsp?razorpayOrderId="+request.getAttribute("razorpay_order_id")%>"
            }
        }
    };

    var rzp1 = new Razorpay(options);

    // Handle payment failure
    rzp1.on('payment.failed', function (response) {
    	window.location.href="<%=request.getContextPath()+"/customer/PaymentFailed.jsp?razorpayOrderId="+request.getAttribute("razorpay_order_id")%>"
    });

    // Open the Razorpay payment modal
    rzp1.open();
</script>

</body>
</html>
