<%@page import="com.app.utils.AppProperties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/imgs/icon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Playwrite+AU+SA:wght@100..400&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Lexend+Deca:wght@100..900&family=Lilita+One&display=swap" rel="stylesheet">

<style type="text/css">
 
  body{
    width: 100%;
    min-height: 100vh;
      max-width: 1800px;
    margin: 0 auto;
    font-family: "outfit",sans-serif;
   }
   .section-wrapper{
    width: 100%;
    position: relative;
    height: 100vh;
   }
   .img-overlay{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    
   }
   .shadow-overlay{
     position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.6);
   }
   .email-form-wrapper{
    background: white;
    padding: 10px;
    border-radius: 10px;
    position: absolute;
    right: 5%;
    top:50%;
    transform:translateY(-50%);
    width: 400px;
   }
   
   .email-form-wrapper h1 {
    font-size: 2.5rem;
    text-align: center;
    font-family: "Lilita One", serif;
    color: #feb80a;
    text-shadow: -1px -1px 0 #000,  
                 1px -1px 0 #000,  
                 -1px 1px 0 #000,  
                 1px 1px 0 #000;
}

   
   .form-group{
    display: flex;
    justify-content: flex-start;
    align-items: center;
    padding: 1px 5px;
    border: 1px solid #efefef;
    border-radius: 15px;
    position: relative;
    margin-bottom: 30px;
    box-shadow: 1px 1px 2px #efefef !important; 
   }
   
   
   
   .form-group input {
	 flex: 1;
	 border: none;
	 outline: none;
   }
   
   .form-footer{
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
   }
   .verify-btn{
    width: 70%;
    border: none;
    outline: none;
    padding: 5px 0px;
    border-radius: 20px;
    background: #feb80a;
   }
   
   .input-error
   {
    position: absolute;
    top:100%;
    left:0;
    font-size: 0.7rem;
    color: red;
   }
   
   .verification-code {
    display: flex;
    justify-content: flex-start;
    align-items:center;
    gap:10px;
    margin: 10px 0;
    border: none !important;
  }

  .code-input {
    width: 30px;
    height: 30px;
    border: 1px solid #ddd !important;
    flex:0 !important;
    border-radius: 5px;
    text-align: center;
  }

  .code-input:focus {
    border-color: #feb80a;
    outline: none;
  }
  
  .verification-label{
   font-size: 0.8rem;
  }
  
  .hide{
   display: none !important;
  }
  
  .loading-indicator{
  width: 100%;
  height: 100vh;
  position: fixed;
  top:0;
  left:0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0,0,0,0.7);
  z-index: 10;
  }
  
  .loading-indicator img{
   transform:scale(0.3);
   border-radius: 50%;
  }
  
  .footer-1{
   display: flex;
   justify-content: center;
   align-items: center;
  }
  
  .footer-1 p{
    font-size: 0.8rem;
  }
  
  #emoji{
   width: 50px;
   height: 50px;
  }
  
</style>

</head>
<body>

<section class="section-wrapper">
    <img alt="" class="img-overlay" src="<%=request.getContextPath()+"/imgs/overlay-1.jpg"%>">
     <div class="shadow-overlay"></div>

		<article class="email-form-wrapper">

			<h1>Swiggy <img alt="" id="emoji" src="<%=request.getContextPath()+"/imgs/emoji.png"%>"> </h1>

			<form method="post"  id="email-form">

				<div class="form-group">
					<i class="ri-mail-line form-icon"></i> <input type="email"
						class="form-control" placeholder="Email" name="email" id="email">
				</div>



                
				<div class="verification-input hide" id="otp-form">
				   <h6 class="verification-label">Enter recieved verification code</h6>
				   <div class="form-group verification-code">
					<input type="text" maxlength="1" class="code-input" name="code1" id="code1">
					<input type="text" maxlength="1" class="code-input" name="code2" id="code2">
					<input type="text" maxlength="1" class="code-input" name="code3" id="code3">
					<input type="text" maxlength="1" class="code-input" name="code4" id="code4">
					<input type="text" maxlength="1" class="code-input" name="code5" id="code5">
					<input type="text" maxlength="1" class="code-input" name="code6" id="code6">
				  </div>
				</div>

				<div class="form-footer">
					<button type="button" class="verify-btn" id="verify-btn" onclick="handleVerificationCLick('<%=request.getContextPath()+"/auth/otp"%>')">Verify</button>
					<button type="button" class="verify-btn hide" id="submit-btn" onclick="handleSubmitClick('<%=request.getContextPath()+"/auth/otp/verify"%>')">Submit</button>
				</div>

			</form>
			
			
			<footer class="footer-1 mt-4">
			 
			  <p>Already have an account? <a href="<%=request.getContextPath()+"/customer/SignIn.jsp"%>">SignIn</a> </p>
			
			</footer>

		</article>


	</section>
	
	<article id="loading-indicator" class="loading-indicator hide">
	    
	    <img alt="" src="https://media.lordicon.com/icons/wired/outline/45-clock-time.gif">
	   
	</article>
	
	
<script>


const redirectUrl = '<%=request.getContextPath()+"/customer/SignUp.jsp"%>'


function handleSubmitClick(url)
{
	 
	const code1=$("#code1").val();
	const code2=$("#code2").val();
	const code3=$("#code3").val();
	const code4=$("#code4").val();
	const code5=$("#code5").val();
	const code6=$("#code6").val();
	if(code1==="" || code2==="" || code3==="" || code4===""||code5===""||code6==="")
	{
	 showAlert("Otp must be 6 digit")
	 return;
	}
	
	const email = $("#email").val().trim();
	
	const otpCode = code1+code2+code3+code4+code5+code6;
	
	$("#loading-indicator").removeClass("hide")
	
	fetch("<%=AppProperties.get("SERVER_URL")%>" + url + "?email=" + email + "&code=" + otpCode, {
		  method: "GET",
		})
		  .then((response) => {
		    if (response.ok) {
		      return response.text(); // Convert response to plain text
		    } else {
		      throw new Error("Failed to fetch: " + response.status);
		    }
		  })
		  .then((data) => {
		   
		    if (data === "Success") {
		      window.location.href = redirectUrl+"?email="+email;
		    } else if (data === "Invalid OTP") {
		      showAlert("Invalid OTP");
		    }
		  })
		  .catch((error) => {
		    console.log("Error: " + error.message);
		  })
		  .finally(() => {
		    $("#loading-indicator").addClass("hide");
		  });


	
}


function handleVerificationCLick(url)
{
	
	const email = $("#email").val().trim();
	
	if(email==="")
	{
	 showAlert("Email Required");
	 return;
	}
	
	$("#loading-indicator").removeClass("hide")
	
	fetch("<%=AppProperties.get("SERVER_URL")%>" + url+"?email="+email+"&role=customer", {
		   method: "GET",
		 })
		   .then((response) => {
		     if (response.ok) {
		       return response.text(); // Convert response to plain text
		     } else {
		       throw new Error("Failed to fetch: " + response.status);
		     }
		   })
		   .then((data) => {
			   
			   alert(data)
			  
		     if(data === "Success")
		       {
		    	 showSuccessAlert("OTP sent to "+email)
		    	 $("#email").attr("disabled",true)
		    	 $("#otp-form").removeClass("hide")
		    	 $("#submit-btn").removeClass("hide")
		    	 $("#verify-btn").addClass("hide")
		       }
		     else if (data === "Failed"){
		    	 showAlert("Failed To send OTP")
		     }
		     else if (data === "Exists"){
		    	 showAlert("Email Alredy Exists")
		     }
		   })
		   .catch((error) => {
		     console.log("Error: " + error.message); 
		   }).finally(() => {
			    $("#loading-indicator").addClass("hide");
			  });

}



	
	
$(document).ready(function () {
	$('.code-input').on('input', function () {
		  const $this = $(this);
		  const value = $this.val();

		  // Allow only numbers
		  const numericValue = value.replace(/[^0-9]/g, '');
		  $this.val(numericValue);

		  // Move to the next input only if a valid number is entered
		  if (numericValue && $this.next('.code-input').length) {
		    $this.next('.code-input').focus();
		  }
		});


    $('.code-input').on('keydown', function (e) {
      const $this = $(this);

      // Move to the previous input on backspace
      if (e.key === 'Backspace' && !$this.val() && $this.prev('.code-input').length) {
        $this.prev('.code-input').focus();
      }
    });
  });

  </script>


<%@include file="/utils/Alerts.jsp" %>


</body>
</html>