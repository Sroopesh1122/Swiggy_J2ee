<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

.footer-section-wrapper{
 width: 100%;
 height: 80vh;
 background: #001219;
 padding: 20px;
 color: white;
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

		<article>
		
		</article>


	</section>
	
	<h1 class="text-center">Social Links <span><i class="ri-facebook-circle-fill"></i></span> <span><i class="ri-instagram-fill"></i></span> <span><i class="ri-twitter-fill"></i></span> </h1>

</footer>

