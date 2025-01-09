<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	justify-content: flex-start;
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

</style>

</head>
<body>
	<%@include file="/restaurant/Navbar.jsp"%>


	<section class="hero-section">
		

		<div class="info-wrapper">
			<h1 class="info-1">
				<span class="text-yellow">Bringing</span> You the Best of Food,
			</h1>
			<h3 class="info-2">Straight from the Kitchen to Your Door</h3>
			<h2 class="info-3">
				Fresh, Fast, and Full of Love! <span class="arrow-btn"><i
					class="ri-arrow-right-fill"></i></span>
			</h2>
		</div>

		<article class="hero-section-img-wrapper">
		   <div class="large-cicle"></div>
		   <img alt="" class="home_cheif" src="<%=request.getContextPath() + "/imgs/home_cheif.png"%>">
		</article>

	</section>



	
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
	


</body>
</html>