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
    font-family: "outfit",sans-serif;
   }
   
   .wrapper{
    min-height: 100vh;
    max-width: 1800px;
    margin: 0 auto;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    padding-right: 10%;
   }
 
  
  
  .signin-form-wrapper{
   display: flex;
   flex-direction: column;
   align-items: center;
   justify-content: center;
   width: 400px;
   padding: 10px 20px;
   border: 1px solid #efefef;
   box-shadow: 0px 2px 5px gray !important;
   border-radius: 20px;
   background: white;
   position: relative;
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
     background: #f68c34;
     color: black;
     border: none;
    }
    .form-footer button:hover {
	 background: #f68c34 !important;
    }
  
  .form-nav-footer{
   position:absolute;
   background: #f68c34;; 
   bottom: -1px;
   padding: 2px 8px;
   color: black;
   border-radius: 5px 5px 0px 0px;
   font-size: 0.85rem;
   color: white;
  }

  
 
.error{
	font-size: 0.7rem;
	color: red;
	margin-left: 0.5rem;
	position: absolute;
	top:100%;
}

.flex-d{
 display: flex;
 align-items: center;
 padding-right: 5px;
}
.password-icon{
 cursor: pointer;
}

#open-eye{
display: block;
}
#close-eye{
display: none;
}

/*  #f68c34; */

.overlay-1{
 width:70%;
 position: absolute;
 top:0;
 left: 0;
 height: 100vh;
 border-radius: 0 20% 20% 0;
 display: flex;
 justify-content: center;
 align-items: center;
 flex-direction: column;
 z-index: -1; 
}

.delivery-boy{
 width: 300px;
 height: 300px;
}
.hero-img-wrapper{
 position: relative;
}
.overlay-2{
 position: absolute;
 top:-30%;
 left:50%;
 transform:translateX(-50%);
 width: 300px;
 height: 300px;
 border-radius: 50%;
 background: #f68c34;
 z-index: -1;
 filter:blur(40px);
}

.mobile-hero-sec{
 position: absolute;
 left: 50%;
 transform:translateX(-50%);
 bottom: 101%;
 
}
.mobile-delivery-boy{
 width: 200px;
 height: 200px;
}
.mobile-title-1{
 font-size: 1rem;
margin-bottom: 1px; 
}
.mobile-title-2{
 font-size: 0.9rem;
 margin-bottom: 1px;
}

.mobile-hero-sec{
 display: none;
}

@media (width <1200px) {

 .wrapper{
  padding-right: 2%;
 }
 .overlay-1{
  width: 60%;
  transform:scale(0.7)
 }
 .signin-form-wrapper{
  width: 350px;
 }
 

	
}

@media (width <768px) {

 .wrapper{
  padding-right: 2%;
  justify-content: center;
 }
 .overlay-1{
  display: none;
 }
 
 .mobile-hero-sec{
  display: block;
 }
 .signin-form-wrapper{
  width: 300px;
  transform:translateY(100px);
 }
 	
}




</style>
 
 

</head>
<body >
  
  <section class="wrapper">

       <aside class="overlay-1">
       
            <div class="hero-img-wrapper">
             
                  <span class="overlay-2"></span>
               
                 <img class="delivery-boy" alt="" src="<%=request.getContextPath()+"/imgs/delivery-boy.png"%>">
             </div>
             
            <h1 class="title-1">Ready to deliver smiles? <i class="ri-motorbike-line"></i></h1>
            <h3 class="title-2"> Log in to start! <i class="ri-arrow-right-circle-fill"></i></h3>
       
       </aside>




		<form method="post"
			action="<%=request.getContextPath() + "/delivery/signin"%>"
			class="signin-form-wrapper" id="signin">
			  
			  <div class="mobile-hero-sec">
			        <img class="mobile-delivery-boy" alt="" src="<%=request.getContextPath()+"/imgs/delivery-boy.png"%>">
			         <h6 class="mobile-title-1">Ready to deliver smiles? <i class="ri-motorbike-line"></i></h6>
                     <h6 class="mobile-title-2"> Log in to start! <i class="ri-arrow-right-circle-fill"></i></h6>
			  </div>
			  
              
            <h1>Delivery Food</h1>
			<h4 class="text-center">Sign In</h4>

			<div class="form-group">
				<i class="ri-mail-line form-icon"></i> <input type="email"
					class="form-control" placeholder="Email" name="email" id="email">
			</div>



			<div class="form-group flex-d">
				<i class="ri-lock-line form-icon"></i> <input type="password"
					class="form-control" name="password" id="password"
					placeholder="Password"> <i
					class="ri-eye-line password-icon" id="open-eye"
					onclick="handleOpenEyeClick()"></i> <i
					class="ri-eye-off-line password-icon" id="close-eye"
					onclick="handleCloseEyeClick()"></i>
			</div>


			<div class="form-footer">
				<button type="submit" class="btn btn-primary mb-3">Sign In</button>
			</div>

			<div class="form-nav-footer">
				<p class="mb-0">
					Don't have an account? <a
						href="<%=request.getContextPath() + "/delivery/SignUp.jsp"%>">Sign Up</a>
				</p>
			</div>


		</form>

	</section>
 
 
<%@include file="/utils/Alerts.jsp" %>
 <script>
		
	<%if (request.getAttribute("failure") != null) {%>
	  showAlert('<%=request.getAttribute("failure")%>');
	 <%
 }
 if(request.getAttribute("success")!=null)
 {
	 %>
	 showSuccessAlert('<%=request.getAttribute("success")%>');
	 <%
 }
%>
 


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
 
 function handleOpenEyeClick(){
	 
	 $("#password").attr("type","text");
	 $("#close-eye").show();
	 $("#open-eye").hide();
 }
 
function handleCloseEyeClick(){
	 
	 $("#password").attr("type","password");
	 $("#close-eye").hide();
	 $("#open-eye").show();
 }
 
 </script>
</body>
</html>