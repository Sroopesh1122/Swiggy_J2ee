<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

.footer-section-wrapper{
 width: 100%;
 background: #001219;
 padding: 20px;
 color: white;
}

.footer-section{
 display: flex;
 justify-content: space-between;
 align-items: center;
}

.footer-section .info-section
{
 width: 40%;
 height: 100%;
 display: flex;
 justify-content: center;
 align-items: flex-start;
 color: white;
}
.footer-section .info-section .wrapper img{
 width: 90px;
 height: 90px;
}

.footer-section .info-section .wrapper span{
 font-size: 2rem;
}

body{
 padding-bottom: 0px;
}

.footer-section-wrapper h1{
 font-size: 1.2rem;
}

.footer-section-wrapper h1 span{
 display:inline-block;
 cursor: pointer;
 transition:all 0.5s;
}

.footer-section-wrapper h1 span:hover {
	transform:translateY(-5px);
	color: #feb80a;
}

.footer-grid-info{
 display: grid;
 grid-template-columns: repeat(3, 1fr); /* Creates 4 equal columns */
 gap: 20px;
 width: 70%;
 justify-content: center;
}

.footer-link{
 color: white !important;
 transition:all 0.5s;
 display: block;
 font-size: 0.8rem;
 font-weight: 200 !important;
 margin-top: 10px;
 white-space: nowrap;
}

.footer-link:hover{
 color: #feb80a !important;
}

.footer-info-header{
 color: #feb80a;
}

@media (width < 600px) {

.footer-section{
 flex-direction: column;
}

.info-section .wrapper{
 display: flex;
 flex-direction: column;
}
	
}

</style>

<footer class="footer-section-wrapper">
	<section class="footer-section">

		<article class="info-section">
			<div class="wrapper">
				<img alt="" src="<%=request.getContextPath()+"/imgs/emoji.png"%>">
				<span>Swiggy</span>
				<h6>&copy;2025 SR. All rights reserved.</h6>
			</div>

		</article>

		<article class="footer-grid-info">
		   <div>
		     <h5 class="footer-info-header">Company</h5>
		     <a href="#" class="footer-link">About Us</a>
		     
		   </div>
		   <div>
		     <h5 class="footer-info-header">Services</h5>
		     <a href="#" class="footer-link">Restaurant Login</a>
		     <a href="#" class="footer-link">Delivery Login</a>
		   </div>
		   <div>
		     <h5 class="footer-info-header">Swiggy</h5>
		   </div>
		  
		</article>


	</section>
	
	<h1 class="text-center mt-5">Follow us on 
	<span><i class="ri-facebook-circle-fill"></i></span>
	 <span><i class="ri-instagram-fill"></i></span> 
	 <span><i class="ri-twitter-fill"></i></span>
	 <span><i class="ri-linkedin-box-fill"></i></span>
	  </h1>

</footer>

