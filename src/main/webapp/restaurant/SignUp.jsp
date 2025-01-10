<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Playwrite+AU+SA:wght@100..400&display=swap" rel="stylesheet">

<style type="text/css">

   body{
    width: 100%;
    min-height: 100vh;
    
   }
 
  .signin-wrapper{
   min-height: 100vh;
   width: 100%;
   display: flex;
   justify-content: center;
   align-items: center;
   position: relative;
   font-family:"outfit",serif;
  }
  
  .wrapper-1{
   width: 40%;
   height:100vh;
   background: #feb80a;
  }
  .wrapper-2{
   width: 60%;
   height:100vh;
  }
  
  .welcome-card{
   width: 370px;
   height: 600px;
   border: 1px solid #efefef;
   box-shadow: 0px 2px 4px #efefef !important;
   border-radius: 20px;
   padding: 20px;
   position: absolute;
   left: 25%;
   background: white;
   display: flex;
   justify-content: center;
   flex-direction: column;
   align-items: center;
   margin-top: -100px;
  }
  
  .signin-form-wrapper{
   position: absolute;
   display: flex;
   flex-direction: column;
   align-items: center;
   justify-content: center;
   left:55%;
   width: 400px;
   margin-top: 100px;
   padding: 10px 20px;
   border: 1px solid #efefef;
   box-shadow: 0px 2px 5px gray !important;
   border-radius: 20px;
   background: white;
  }
  
    .form-group{
     width: 100%;
     padding-left: 20px;
     position: relative;
     border: 1px solid #efefef;
     border-radius: 15px;
     margin-bottom: 20px;
   }
   
   .form-icon{
    position: absolute;
    left: 3px;
    top: 50%;
    transform:translateY(-50%);
    
   }
   
   .form-group input{
      border:none;
      padding: 2px 9px;
   }
   
   
    .form-footer{
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .form-footer button{
     background: black;
     color: white;
     border: none;
    }
    .form-footer button:hover {
	 background: black !important;
    }
  
  .form-nav-footer{
   position:absolute;
   background:#feb80a; 
   bottom: -1px;
   padding: 2px 8px;
   color: black;
   border-radius: 5px 5px 0px 0px;
   font-size: 0.85rem;
  }
  
  .welcome-bg-wrapper{
   position: relative;
  }
  
  .bg-1{
   width: 250px;
   height: 250px;
  }
  
  .plate{
   position: absolute;
   width: 150px;
   height: 150px;
   left:25%;
   top:40%;
   transform: translateX(-50%);
   transform: translateY(-50%);
  }
  
  .dancing-font{
   font-family: "Playwrite AU SA", serif;
   font-style: italic;
   font-weight: 600;
  }
  
  
  
  @media (max-width:1270px) {
   
   .welcome-card{
    left: 20%;
   }
  
	
  }
  
  
  @media (max-width:1100px) {   
   .welcome-card{
    left: 15%;
    display: none;
   }
   
   .signin-form-wrapper
   {
      left:50%;
      transform:translateX(-50%);
   }
   
   
  }
  
  @media (max-width:450px) {
	.signin-form-wrapper{
	 width: 330px;
	}
} 

 @media (max-width:350px) {
	.signin-form-wrapper{
	 width: 300px;
	 padding: 5px;
	}
} 
.error{
	font-size: 0.7rem;
	color: red;
	margin-left: 0.5rem;
}

.welcome-card-footer{
 text-align: center;
}
input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    
  }
  
  .info-modal{
   position: fixed;
   background: white;
   box-shadow: 0px 1px 2px graytext !important;
   top:10px;
   left: 50%;
   transform:translateX(-50%);
   padding: 5px 10px;
   border-radius: 10px;
   display: flex;
   justify-content: center;
   align-items: center;
   opacity: 1;
   transition:all 1s;
  }
  
  .close-info-modal{
   top: -10px;
   opacity: 0;
  }
  
  .error-icon{
   color: red;
  }
  
  #custom-alert{
   font-family: "outfit",sans-serif;
  }

</style>
 
 

</head>
<body >
 <div class="signin-wrapper">
    
    <div class="wrapper-1">
    
    </div>
    
    <div class="wrapper-2">
     
    </div>
    
    
    <div class="welcome-card">
     
     <h5>Welcome To <span class="dancing-font">Swiggy</span> </h5>
      
      <div class="welcome-bg-wrapper">
         <img alt="" src="<%=request.getContextPath()+"/imgs/bg1.png"%>" class="bg-1">
         <img alt="" src="<%=request.getContextPath()+"/imgs/cheif.png"%>" class="plate">
      </div>
      
      <div class="welcome-card-footer">
         Hello Food Creator! Ready to Serve Something Delicious?
      </div>
    
    </div>
    
    
      <form method="post" action="<%=request.getContextPath()+"/restaurant/signup"%>" class="signin-form-wrapper" id="restarentSignup">
      
    
       <h4 class="text-center">Sign Up</h4>

        <div class="form-group">
           <i class="ri-hotel-line form-icon"></i> <input type="text" class="form-control" placeholder="Restarent name" name="name" id="fname">
        </div>


        <div class="form-group">
            
         <i class="ri-mail-line form-icon"></i>    <input type="email" class="form-control" placeholder="Email" name="email" id="email">
        </div>

        <div class="form-group">
            
         <i class="ri-phone-line form-icon"></i>      <input type="number" class="form-control" name="phone" placeholder="Phone" id="phone" min="0">
        </div>

        <div class="form-group">
           
         <i class="ri-map-pin-line form-icon"></i>    <input type="text" class="form-control" name="address" placeholder="Restarent address">
        </div>
        <div class="form-group">
            
          <i class="ri-lock-line form-icon"></i>  <input type="password" class="form-control" name="password" id="password" placeholder="Password">
        </div>
        
        <div class="form-group">
            
           <i class="ri-lock-line form-icon"></i> <input type="password" class="form-control" name="confirmPassword" id="password" placeholder="Confirm password">
        </div>

        

        <div class="form-footer">
            <button type="submit" class="btn btn-primary mb-3">Sign Up</button>
        </div>
        
        <div class="form-nav-footer">
           <p class="mb-0">
                Already have an account? <a href="<%=request.getContextPath()+"/restaurant/SignIn.jsp"%>">Sign In</a>
            </p>
        </div>
     
    
    </form>
 </div>
 
 <div id="custom-alert">This is a custom alert message!</div>
 
 
 
 
 
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
            $("#restarentSignup").validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 3
                    },
                    
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
                    },
                    phone: {
                        required: true,
                        minlength: 10,
                        maxlength: 10
                    },
                    
                    address: {
                        required: true
                    }
                },
                messages: {
                    name:{
                    	required: "Please enter a valid name",
                    	minlength:"Name must be at least 3 characters long"
                    },
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
                    },
                    phone:{
                    	required: "Please enetr your mobile number",
                    	maxlength: "Please enter a valid 10-digit mobile number",
                    	 minlength:"Please enter a valid 10-digit mobile number",
                    } ,
                    
                    address: {
                    	required:"Please enter your address"
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
 	
 	
 	
 	function showAlert(message) {
        const alertBox = document.getElementById('custom-alert');
        alertBox.textContent = message;
        alertBox.style.display = 'block';

        // Hide the alert after 2 seconds
        setTimeout(() => {
            alertBox.style.display = 'none';
        }, 2000); // 2000ms = 2 seconds
    }
 	
 	
 	
 	
    </script>
</body>
</html>