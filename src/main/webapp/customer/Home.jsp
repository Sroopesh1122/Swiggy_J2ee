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
 font-weight: 500;
}

.category-card:hover {
	border: 1px solid #efefef;
	box-shadow: 0px 1px 3px #efefef !important;
}

.category-card:hover .img-wrapper img{
 transform:scale(1.05);
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
	transition:all 0.5s;
}

.promo-section {
  width: 100%;
  max-width: 1000px;
  margin: 0 auto;
  height: 60vh;
  position: relative;
  border-radius: 20px;
  overflow: hidden; /* Ensures content doesn't overflow the section */
}

.promo-section video {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100%;
  height: 100%;
  object-fit: cover; /* Ensures the video covers the entire section while maintaining aspect ratio */
  z-index: 1; /* Ensures it appears above the background */
  
}

.promo-section .vedio-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent overlay */
  z-index: 2; /* Ensures it appears above the video */
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
		<h3 class="mb-4">Our Food Menu</h3>
		<article class="category-list-wrapper">
			<div class="category-card" onclick="handleCategoryClick('chapathi,rice')">

				<div class="img-wrapper">
					<img id="appLogo" alt=""
						src="https://img.freepik.com/premium-photo/plate-with-delicious-vegetable-salad-white-background-top-view_392895-210344.jpg">
				</div>
				<h6>Vegetarian</h6>

			</div>
			
			
			<div class="category-card" onclick="handleCategoryClick('non-veg,rice')">

				<div class="img-wrapper">
					<img id="appLogo" alt=""
						src="https://static.vecteezy.com/system/resources/previews/036/627/269/non_2x/ai-generated-savory-chicken-dish-on-transparent-background-png.png">
				</div>
				<h6>Non-Vegetarian</h6>

			</div>
			
			
			
			<div class="category-card" onclick="handleCategoryClick('non-veg,rice')">

				<div class="img-wrapper">
					<img id="appLogo" alt=""
						src="https://www.shutterstock.com/image-photo/noodles-meat-vegetables-isolated-on-600nw-1026270289.jpg">
				</div>
				<h6>Chinese</h6>

			</div>
			
			
			<div class="category-card" onclick="handleCategoryClick('non-veg,rice')">

				<div class="img-wrapper">
					<img id="appLogo" alt=""
						src="https://thumbs.dreamstime.com/b/italian-food-white-plate-36648641.jpg">
				</div>
				<h6>Italian</h6>

			</div>
			
			
			
			
			<div class="category-card" onclick="handleCategoryClick('non-veg,rice')">

				<div class="img-wrapper">
					<img id="appLogo" alt=""
						src="https://png.pngtree.com/png-clipart/20241028/original/pngtree-top-view-of-fried-egg-on-a-rice-plate-png-image_16536285.png">
				</div>
				<h6>Egg</h6>

			</div>
			
		</article>
		
	</section>
	
	<section class="promo-section"> 
	       <div class="vedio-overlay"></div>
			<video id="checkmarkVideo" autoplay muted playsinline
				src='<%=request.getContextPath() + "/promos/v1.mp4"%>'></video>

	</section>

	
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
	
	
	<script type="text/javascript">
	
	
	  function handleCategoryClick(category)
	  {
	     let url = '<%= request.getContextPath()+"/customer/Menu.jsp?q="%>'+category;
	     
	     window.location.href=url
	  }
	
	</script>
	


</body>
</html>