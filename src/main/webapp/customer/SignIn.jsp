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
   }
   
   .form-group input{
   border: 1px solid #efefef;
      padding: 2px 9px;
      border-radius: 15px;
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
	font-size: 0.8rem;
	color: red;
	margin-left: 0.5rem;
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
         <img alt="" src="<%=request.getContextPath()+"/imgs/burger.png"%>" class="plate">
      </div>
      
      <div>
         Footer
      </div>
    
    </div>
    
    
    <form action="" class="signin-form-wrapper" id="signin">
    
       <h4 class="text-center">Sign In</h4>



        <div class="form-group" >
                     <input type="email" class="form-control" placeholder="email" name="email" id="email">
        </div>

        

        <div class="form-group">
            <input type="text" class="form-control" name="password" id="password" placeholder="Password">
        </div>
        

        <div class="form-footer">
            <button type="submit" class="btn btn-primary mb-3">Sign Up</button>
        </div>
        
        <div class="form-nav-footer">
           <p class="mb-0">
                Don't have an account? <a href="<%=request.getContextPath()+"/customer/SignUp.jsp"%>">Sign Up</a>
            </p>
        </div>
     
    
    </form>

 </div>
 <script>

 $(document).ready(function () {
     $("#signin").validate({
         rules: {
             email: {
                 required: true,
                 email: true
             },
             password: {
                 required: true,
                 minlength: 6
             } 
         },
         messages: {
             email:{
            	 required: "Please enter email",
            	 email: "Please enter a valid email address"
             } ,
             password: {
            	 required: "Please confirm your password",
            	 minlength: "Password must be at least 6 characters long"
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