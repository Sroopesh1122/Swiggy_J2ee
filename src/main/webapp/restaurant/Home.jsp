<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
 request.setAttribute("menu", "Home");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lilita+One&display=swap"
	rel="stylesheet">

<style type="text/css">
body {
	min-height: 100vh;
	width: 100%;
	font-family: "outfit", sans-serif;
	max-width: 1800px;
	margin: 0 auto;
	padding: 20px 0px;
}

.hero-section {
	width: 100%;
	height: 90vh;
	overflow: hidden;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.hero-section-img-wrapper{
  position: relative;
}

.hero-section-img-wrapper  .large-cicle {
  width: 500px;
  height: 500px;
  border-radius: 50%;
  background: #feb80a;
  position: absolute;
  top: -10%;
  left:15%;
  z-index: -1;
  filter:blur(10px);
}

.home_cheif{
 width: 800px;
 height: 500px;
}

.info-1{
 font-size: 3.5rem;
 color: #feb80a;
 font-weight: 800;
}
.info-2{
 font-size: 1.5rem;
 
}

.info-3 {
	font-size: .98rem;
}

.arrow-btn {
	background: black;
	color: white;
	padding: 8px;
	border-radius: 50%;
	margin-left: 10px;
	cursor: pointer;
}



.footer {
  background-color: #333;
  color: #fff;
  padding: 15px 0;
  font-family: Arial, sans-serif;
}

.footer-container {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 15px;
}

.footer-section {
  flex: 1;
  min-width: 200px;
  margin: 10px 0;
}

.footer-section h4 {
  margin-bottom: 10px;
  font-size: 18px;
  border-bottom: 2px solid #555;
  padding-bottom: 5px;
}

.footer-section p,
.footer-section ul {
  margin: 0;
  font-size: 14px;
}

.footer-section ul {
  list-style: none;
  padding: 0;
 
}

.footer-section ul li {
  margin: 5px 0;
}

.footer-section ul li a {
  text-decoration: none;
  color: #7272ff;
  transition: color 0.3s;
}

.footer-section ul li a:hover {
  color: #fff;
}

.footer-section .social-media a {
  margin-right: 10px;
  color: #ddd;
  font-size: 20px;
  transition: color 0.3s;
}

.footer-section .social-media a:hover {
  color: #fff;
}

.footer-bottom {
  text-align: center;
  padding-top: 1px;
  border-top: 1px solid #555;
  font-size: 14px;
}




.add-btn{
  background: white;
  padding: 10px 20px;
  border: none;
  border-radius: 10px;
}

@media (width < 1240px) {
	
	.home_cheif{
        width: 600px;
        height: 400px;
     }
     
     .hero-section-img-wrapper  .large-cicle {
        width: 300px;
        height: 300px;
      }
	
}

@media (width < 900px) {
	
	.home_cheif{
        width: 500px;
        height: 300px;
     }
     
     .hero-section-img-wrapper  .large-cicle {
        width: 3000px;
        height: 3000px;
        filter:blur(0);
        top:-300%;
        left:0;
      }
      
      .info-wrapper{
       padding-left: 10px;
      }
	
}

@media (width < 750px) {
	
	.home_cheif{
        width: 700px;
        height: 400px;
        transform:scale(0.8)
     }
     .hero-section{
        background: #feb80a;
        flex-direction: column;
        justify-content: flex-start;
        padding-top: 5vh;
     }
     
     .hero-section-img-wrapper  .large-cicle {
        display: none;
      }
      
      .info-wrapper{
       padding-left: 10px;
      }
      .info-1{
       color: white;
      }
	
}


</style>

</head>
<body>
	<%@include file="/restaurant/Navbar.jsp"%>


	<section class="hero-section">
		

		<div class="info-wrapper">
			<h1 class="info-1">Hey, Chef! </h1>
			<h2 class="info-2">The Kitchen Awaits Your Magic Touch!</h2>
			<h2 class="info-3">
				Fresh, Fast, and Full of Love! <span class="arrow-btn"><i class="ri-arrow-right-fill"></i></span>
			</h2>
		</div>

		<article class="hero-section-img-wrapper">
		   <div class="large-cicle"></div>
		   <img alt="" class="home_cheif" src="<%=request.getContextPath() + "/imgs/home_cheif.png"%>">
		</article>

	</section>
	
	
	<%--<section  class="home-info-section"> 
	</section> --%>
	 
	  
	   <footer class="footer">
  <div class="footer-container">
    <div class="footer-section">
      <h4>About Us</h4>
      <p>We are a team of passionate developers creating innovative solutions.</p>
    </div>
    <div class="footer-section">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="#home">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#services">Services</a></li>
        <li><a href="#contact">Contact</a></li>
      </ul>
    </div>
    <div class="footer-section">
      <h4>Contact Us</h4>
      <p><i class="fa-solid fa-envelope"></i> : shivroopesh@gmail.com</p>
      <p><i class="fa-solid fa-phone"></i> : +91 6362379895</p> 
    </div>
    <div class="footer-section social-media">
      <h4>Follow Us</h4>
      <a href="https://www.facebook.com/"><i class="fab fa-facebook"></i></a>
      <a href="https://x.com/?lang=en-in&mx=2"><i class="fab fa-twitter"></i></a>
      <a href="https://www.linkedin.com/feed/"><i class="fab fa-linkedin"></i></a>
      <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
    </div>
  </div>
  <div class="footer-bottom">
    <p>@copy: .</p>
  </div>
</footer>

	
	
	
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
	


</body>
</html>