<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/imgs/icon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>

<style type="text/css">
 body {
	min-height: 100vh;
	width: 100%;
	font-family: "outfit", sans-serif;
	max-width: 1800px;
	margin: 0 auto;
	padding: 20px 0px;
	
}

.wrapper-section{
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 80vh;
  padding: 30px 0px;
}

.add-food-form{
 width: 400px;
 padding: 30px;
 border-radius: 10px;
 box-shadow: 0px 1px 5px #efefef !important;
 border: 1px solid #efefef;
}

.add-food-form h4{
 font-size: 2.5rem;
 color:  #feb80a;
}

.form-footer{
 display: flex;
 justify-content: center;
 align-items: center;
 margin-top: 10px;
}

.form-footer button{
 background: #feb80a;
 border: 1px solid #feb80a !important;
}

.form-footer button:hover {
	color: black;
	background: white;
	border: 1px solid #feb80a !important;
}

@media (width < 400px) {
	.add-food-form{
	 padding: 5px;
	 width: 300px;
	}
}
input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    
  }
  .error{
	font-size: 0.7rem;
	color: red;
	margin-left: 0.5rem;
}


</style>

</head>
<body>
  
   <section class="wrapper-section">
   
        <form method="post" action="<%=request.getContextPath()+"/customer/forgotPassword"%>" class="add-food-form" id="forgotPassword" >    
           <h4 class="text-center" style=" margin-bottom: 1.5rem">Forgot Password</h4>

		
        
         <div class="form-group" >
                     <input type="email" class="form-control"  placeholder="Email" name="email" >
        </div>
       
       <div class="form-group flex-d">
             <input type="password" class="form-control" name="password" id="password" placeholder="Password">
         </div>
        
         <div class="form-group">
            <input type="text" class="form-control" name="confirmPassword" id="password" placeholder="Confirm password">
        </div>
            
        <div class="form-footer">
            <button type="submit" class="btn btn-primary mb-3">Update Password</button>
        </div>
    </form>
   </section>
    <div id="custom-alert">
  
  <i class="ri-close-circle-fill"></i>
  <span id="alert-msg"></span>
 
 </div>
   <script >
    
    <%
       if(request.getAttribute("failure")!=null)
       {
    	   %>
    	   showAlert('<%=request.getAttribute("failure")%>');
    	   <%
       }
    %>
   $(document).ready(function () {
            $("#forgotPassword").validate({
                rules: {    
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 6
                    },
                    confirmPassword: {
                        required: true,
                        minlength: 6,
                        equalTo: "#password"
                    }
                   
                },
                messages: {
                    
                    email: {
                    	required: "Please enter email",
                   	 	email: "Please enter a valid email address"
                    },
                    password:{
                    	required:"Please enter your password",
                    	minlength:"Password must be at least 6 characters long"
                    } ,
                    confirmPassword: {
                        required: "Please confirm your password",
                        equalTo: "Passwords do not match",
                        minlength:"Password must be at least 6 characters long"
                    }
                },
                errorElement: "div",
                errorPlacement: function (error, element) {
                    error.addClass("error");
                    error.insertAfter(element);
                },
                highlight: function (element) {
                    $(element).addClass("is-invalid").removeClass("is-valid");
                },
                unhighlight: function (element) {
                    $(element).addClass("is-valid").removeClass("is-invalid");
                }
            });
        });
 	
 	
 	
 	
 	
 	
 	
    </script>
</body>

</html>