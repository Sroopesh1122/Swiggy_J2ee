<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Submitted</title>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/imgs/icon.ico">
<%@include file="/utils/CommonUtils.jsp"%>
<style type="text/css">
  
  body{
   min-height: 100vh;
   display: flex;
   justify-content: center;
   align-items: center;
   flex-direction: column;
  }
  
  #checkmarkVideo{
  height: 300px;
  }
  
  .hide{
   display: none;
  }
  h4{
   font-family: "outfit",sans-serif;
  }
  
  img{
   position: absolute;
   z-index: -1;
   width: 250px;
   height: 200px;
   top:10%;
   left: 50%;
   transform:translateX(-50%);
  }
  
   

  
</style>

</head>
<body>
   
   <video
    id="checkmarkVideo"
    autoplay
    muted
    playsinline
    src='<%=request.getContextPath()+"/utils/Done.mp4" %>'
  ></video>
  <h4 class="hide">Review Submitted Successfully!   </h4>
   
   <script>
   const videoElement = document.getElementById("checkmarkVideo");

   videoElement.addEventListener("ended", () => {
     
	   setTimeout(()=>{
		   
		   
		 $("h4").show();
		 
		 setTimeout(()=>{
			 window.location.href= '<%=request.getContextPath()+"/customer/Orders.jsp"%>'
		 },500)
		   
	   },200)
	   
   });
  </script>
   
</body>
</html>