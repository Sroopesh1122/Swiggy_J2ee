<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ordered</title>

<style type="text/css">
  
  body{
   min-height: 100vh;
   display: flex;
   justify-content: center;
   align-items: center;
  }
   

  
</style>

</head>
<body>
   
    
   <video
    id="checkmarkVideo"
    autoplay
    muted
    playsinline
    src='<%=request.getContextPath()+"/imgs/v1.mp4" %>'
  ></video>
   
   <script>
   const videoElement = document.getElementById("checkmarkVideo");

   videoElement.addEventListener("ended", () => {
     
	   setTimeout(()=>{
		   
		   window.location.href= '<%=request.getContextPath()+"/customer/Cart.jsp"%>'
		   
	   },500)
	   
   });
  </script>
   
</body>
</html>