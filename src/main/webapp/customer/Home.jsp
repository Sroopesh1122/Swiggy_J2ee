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

.large-cicle {
	position: absolute;
	width: 1200px;
	height: 1200px;
	border-radius: 50%;
	background: #feb80a;
	top: -50%;
	right: -40%;
	z-index: -1;
}

.info-1 {
	font-family: "Lilita One", serif;
	font-size: 3.5rem;
}

.info-2 {
	font-size: 1.5rem;
}

.info-3 {
	font-size: .98rem;
}

.img-plate, .info-1 {
	z-index: 5
}

.info-wrapper {
	margin-left: 20px;
}

.text-yellow {
	color: #feb80a;
}

.arrow-btn {
	background: black;
	color: white;
	padding: 8px;
	border-radius: 50%;
	margin-left: 10px;
	cursor: pointer;
}



/*Category Section*/
.category-section {
	width: 80%;
	margin: 0 auto;
	margin-bottom: 5vh;
	
}

.category-list-wrapper {
   padding: 10px;
	overflow: auto;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	gap: 10px;
}

.category-list-wrapper::-webkit-scrollbar {
    width: 2px !important; /* Hide scrollbar */
  } 

.category-card {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	padding: 10px;
	border: 1px solid white;
	border-radius: 20px;
}

.category-card h6{
 white-space: nowrap;
}

.category-card:hover {
	border: 1px solid #efefef;
	box-shadow: 0px 1px 3px graytext !important;
}

.category-card .img-wrapper {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	overflow: hidden;
}

.category-card .img-wrapper img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

@media ( width < 1024px) {
	.large-cicle {
		width: 800px;
		height: 800px;
		right: -50%;
		top: -20%;
	}
}

@media ( width > 1800px) {
	.large-cicle {
		width: 2000px;
		height: 2000px;
		right: -50%;
		top: -20%;
	}
}

@media ( width < 700px) {
	.img-plate {
		width: 300px;
		height: 300px;
	}
	.category-section {
	width: 100%;
	margin: 0 auto;
	margin-bottom: 5vh;
	padding: 10px;
	
}
}

@media ( width < 500px) {
	.hero-section {
		flex-direction: column;
	}
	.img-plate {
		width: 280px;
		height: 280px;
	}
	.text-yellow {
		color: black;
	}
}

</style>

</head>
<body>
	<%@include file="/customer/Navbar.jsp"%>


	<section class="hero-section">
		<div class="large-cicle"></div>

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

		<img alt="" class="img-plate"
			src="<%=request.getContextPath() + "/imgs/foodplate.png"%>">

	</section>



	<section class="category-section">
		<h3 class="mb-4">Food Categories</h3>
		<article class="category-list-wrapper">
			<div class="category-card">

				<div class="img-wrapper">
					<img id="appLogo" alt=""
						src="https://media.istockphoto.com/id/1340043045/photo/salad-with-quinoa-spinach-broccoli-tomatoes-cucumbers-and-carrots.jpg?s=612x612&w=0&k=20&c=IYXhejyXIfdFykJe8PQsuENXwpGaJ2P9YQvGNNHXCTU=">
				</div>
				<h6>Vegetarian</h6>

			</div>
			<div class="category-card">

				<div class="img-wrapper">
					<img alt=""
						src="https://media.istockphoto.com/id/1340043045/photo/salad-with-quinoa-spinach-broccoli-tomatoes-cucumbers-and-carrots.jpg?s=612x612&w=0&k=20&c=IYXhejyXIfdFykJe8PQsuENXwpGaJ2P9YQvGNNHXCTU=">
				</div>
				<h6>Vegetarian</h6>

			</div>
			<div class="category-card">

				<div class="img-wrapper">
					<img alt=""
						src="https://media.istockphoto.com/id/1340043045/photo/salad-with-quinoa-spinach-broccoli-tomatoes-cucumbers-and-carrots.jpg?s=612x612&w=0&k=20&c=IYXhejyXIfdFykJe8PQsuENXwpGaJ2P9YQvGNNHXCTU=">
				</div>
				<h6>Vegetarian</h6>

			</div>
			<div class="category-card">

				<div class="img-wrapper">
					<img alt=""
						src="https://media.istockphoto.com/id/1340043045/photo/salad-with-quinoa-spinach-broccoli-tomatoes-cucumbers-and-carrots.jpg?s=612x612&w=0&k=20&c=IYXhejyXIfdFykJe8PQsuENXwpGaJ2P9YQvGNNHXCTU=">
				</div>
				<h6>Vegetarian</h6>

			</div>
			<div class="category-card">

				<div class="img-wrapper">
					<img alt=""
						src="https://media.istockphoto.com/id/1340043045/photo/salad-with-quinoa-spinach-broccoli-tomatoes-cucumbers-and-carrots.jpg?s=612x612&w=0&k=20&c=IYXhejyXIfdFykJe8PQsuENXwpGaJ2P9YQvGNNHXCTU=">
				</div>
				<h6>Vegetarian</h6>

			</div>
			<div class="category-card">

				<div class="img-wrapper">
					<img alt=""
						src="https://media.istockphoto.com/id/1340043045/photo/salad-with-quinoa-spinach-broccoli-tomatoes-cucumbers-and-carrots.jpg?s=612x612&w=0&k=20&c=IYXhejyXIfdFykJe8PQsuENXwpGaJ2P9YQvGNNHXCTU=">
				</div>
				<h6>Vegetarian</h6>

			</div>
			<div class="category-card">

				<div class="img-wrapper">
					<img alt=""
						src="https://media.istockphoto.com/id/1340043045/photo/salad-with-quinoa-spinach-broccoli-tomatoes-cucumbers-and-carrots.jpg?s=612x612&w=0&k=20&c=IYXhejyXIfdFykJe8PQsuENXwpGaJ2P9YQvGNNHXCTU=">
				</div>
				<h6>Vegetarian</h6>

			</div>
			<div class="category-card">

				<div class="img-wrapper">
					<img alt=""
						src="https://media.istockphoto.com/id/1340043045/photo/salad-with-quinoa-spinach-broccoli-tomatoes-cucumbers-and-carrots.jpg?s=612x612&w=0&k=20&c=IYXhejyXIfdFykJe8PQsuENXwpGaJ2P9YQvGNNHXCTU=">
				</div>
				<h6>Vegetarian</h6>

			</div>
		</article>

	</section>
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
	


</body>
</html>