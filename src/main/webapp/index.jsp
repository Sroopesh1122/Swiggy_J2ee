<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food</title>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/imgs/icon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>
<style type="text/css">
body {
	min-height: 80vh;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: "outfit",sans-serif;
	max-width: 1800px;
	overflow: hidden;
}
.home-bg-wrapper{
  padding: 20px;
  background: black;
  height: 100vh;
  width: 100%;
  position: relative;
}
.home-bg-wrapper img{
 object-fit:cover;
 height: 100%;
 width: 100%;
}

.home-info-wrapper{
  position: absolute;
  top: 40%;
  left:10%;
  width: 500px;
  color: white;
}

.home-info-footer{
 display: flex;
 justify-content: center;
 align-items: center;
 gap:10px;
 padding: 10px 0px;
}

.home-btn{
 padding: 5px 10px;
 border-radius: 20px;
 background: #feb80a;
 color: black !important;
 cursor: pointer;
 font-size: 0.9rem;
 white-space: nowrap;
}
.home-info h1{
 font-size: 3rem;
 display: flex;
 justify-content: flex-start;
 align-items: center;
 color: #feb80a;
}

@media (max-width:900px) {

 .mob-tag{
  color: white;
  margin-left: 10px;
 }
 
 .home-info-wrapper{
  width: 300px;
  left: 5%;
  top: 60%;
 }
 .home-info h1{
  font-size: 2rem;
 }
	
}

@media (max-width:400px) {

 .mob-tag{
  color: white;
  margin-left: 10px;
 }
 .home-bg-wrapper{
  padding: 0px;
 }
 
 .home-info-wrapper{
  width: 280px;
  left: 3%;
  top: 60%;
 }
 .home-info h1{
  font-size: 1.4rem;
 }
	
}

</style>
</head>
<body>
   
   <div class="home-bg-wrapper">
       <img alt="" id="plate" src="<%=request.getContextPath()+"/imgs/home-bg.jpeg"%>">
       <section class="home-info-wrapper" id="info">
          <article class="home-info">
              <h1>Deliciousness <span class="mob-tag"> Awaits</span> &#128523; </h1>
              <h3>– Start Your Food Journey with Us!</h3>
          </article>
          <article class="home-info-footer">
               <a class="home-btn" href="<%=request.getContextPath()+"/customer/AuthEmail.jsp"%>"><i class="fa-solid fa-users"></i> Customer Login</a>
               <a class="home-btn" href="<%=request.getContextPath()+"/restaurant/AuthEmail.jsp"%>"><i class="fa-solid fa-building"></i> Restaurant Login</a>
          </article>
       </section>
   </div>
   
 <script type="text/javascript">
 gsap.registerPlugin(ScrollTrigger);
 const t1 = gsap.timeline();

//Adding both animations to the timeline
t1.from("#plate", {
  duration: 0.5,
  opacity: 0,
  rotate:180,
  delay:1
})
.from("#info", {
  duration: 0.5,
  x: -200,
  opacity:0
}).from(".home-info-footer a",{
	duration:0.2,
	opacity:0,
	y:+20,
	stagger: 0.1
});

 
 
 
 </script>  
  

</body>
<html>