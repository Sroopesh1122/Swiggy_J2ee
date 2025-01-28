<%@page import="com.swiggy.dao.impl.MenuItemsImp"%>
<%@page import="com.swiggy.dto.MenuItems"%>
<%@page import="java.util.List"%>
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
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/imgs/icon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lilita+One&display=swap"
	rel="stylesheet">
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>

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



.section-1{
 width: 100%;
 padding: 20px;
}

.section-1 h1{
 text-align: center;
 font-weight: 700;
 color:#feb80a; 
}

.section-1 h1 i{
 color: black;
}

.feature-wrapper{
 width: 100%;
 max-width: 1200px;
 margin: 0 auto;
 padding:2vh 20px;
 overflow: auto;
 display: flex;
 flex-wrap: nowrap;
 gap:10px;
}


/* Customize the scrollbar */
.feature-wrapper::-webkit-scrollbar {
  width: 0px; /* Width of the vertical scrollbar */
  height: 0px; /* Height of the horizontal scrollbar */
}

/* Track (background of the scrollbar) */
.feature-wrapper::-webkit-scrollbar-track {
  background: #f4f4f4; /* Light gray background */
}

/* Thumb (the draggable part of the scrollbar) */
.feature-wrapper::-webkit-scrollbar-thumb {
  background: #888; /* Gray thumb color */
  border-radius: 6px; /* Rounded edges */
}

/* Thumb hover effect */
.feature-wrapper::-webkit-scrollbar-thumb:hover {
  background: #555; /* Darker gray when hovering */
}


.featured-card{
 width: 300px;
 height: 200px;
 flex-grow: 0;
 flex-shrink: 0;
 border-radius: 20px;
 border:1px solid #efefef;
 padding: 15px;
 display: flex;
 flex-direction: column;
 align-items: center;
 justify-content:flex-start;
 gap:10px;
 cursor: pointer;
 box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
 transition:all 1s;
}

.featured-card:hover{
 transform:scale(1.05)
}

.featured-card h2{
 font-size: 1.1rem;
 text-align: center;
 display: flex;
 justify-content: center;
 align-items: center;
 white-space: nowrap;
 color: orange;
}

.featured-card h2 img{
 width: 40px;
 height: 40px;
}

.featured-card p{
 font-size: 0.8rem;
}
.featured-card img{
 width: 80px;
 height: 80px;
 border-radius: 10px;
}

.section-2{
 width: 100%;
 margin-top: 10vh;
 padding-bottom: 5vh;
}

.section-2 h1{
 text-align: center;
 font-size: 2rem;
 font-weight: 600;
}

.section-2 h1 img{
 width: 50px;
 height: 50px;
}

.top-rated-card{
 width: 200px;
 display: flex;
 flex-direction: column;
 justify-content: center;
 align-items: center;
 position: relative;
 cursor: pointer;
}

.top-rated-card span{
 position: absolute;
 top:1px;
 right:2px;
 background: white;
 width: 30px;
 height: 30px;
 border-radius: 50%;
 display: flex;
 justify-content: center;
 align-items: center;
 border:1px solid #feb80a;
 z-index: 5;
 font-size: 0.9rem;
}

.top-rated-card img{
 width: 180px;
 height: 180px;
 border-radius: 10px;
 
}

.top-rated-card h2{
 font-size: 1.2rem;
 white-space: nowrap;
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
	
	.section-1 h1{
	 font-size: 1rem;
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
			<div class="category-card" onclick="handleCategoryClick('veg')">

				<div class="img-wrapper">
					<img id="appLogo" alt=""
						src="https://img.freepik.com/premium-photo/plate-with-delicious-vegetable-salad-white-background-top-view_392895-210344.jpg">
				</div>
				<h6>Vegetarian</h6>

			</div>
			
			
			<div class="category-card" onclick="handleCategoryClick('nonveg')">

				<div class="img-wrapper">
					<img id="appLogo" alt=""
						src="https://static.vecteezy.com/system/resources/previews/036/627/269/non_2x/ai-generated-savory-chicken-dish-on-transparent-background-png.png">
				</div>
				<h6>Non-Vegetarian</h6>

			</div>
			
			
			
			<div class="category-card" onclick="handleCategoryClick('chinese')">

				<div class="img-wrapper">
					<img id="appLogo" alt=""
						src="https://www.shutterstock.com/image-photo/noodles-meat-vegetables-isolated-on-600nw-1026270289.jpg">
				</div>
				<h6>Chinese</h6>

			</div>
			
			
			<div class="category-card" onclick="handleCategoryClick('italian')">

				<div class="img-wrapper">
					<img id="appLogo" alt=""
						src="https://thumbs.dreamstime.com/b/italian-food-white-plate-36648641.jpg">
				</div>
				<h6>Italian</h6>

			</div>
			
			
			
			
			<div class="category-card" onclick="handleCategoryClick('egg')">

				<div class="img-wrapper">
					<img id="appLogo" alt=""
						src="https://png.pngtree.com/png-clipart/20241028/original/pngtree-top-view-of-fried-egg-on-a-rice-plate-png-image_16536285.png">
				</div>
				<h6>Egg</h6>

			</div>
			
		
			
		</article>
		
	</section>
	
	
	<section class="section-1">
	  <h1>----- <i class="ri-sparkling-2-fill"></i> Feature For You <i class="ri-sparkling-2-fill"></i> -----</h1>
	
	   <article class="feature-wrapper mt-3">
	       
	       <div class="featured-card">
	             <h2>Top-Rated Restaurants<img alt="" src="https://i.pinimg.com/736x/9c/0e/de/9c0edef80de1893774c8a74883a916f9.jpg"> </h2>
	             <p>Only the best for you! Explore meals prepared by highly-rated restaurants with top-notch quality and hygiene.</p>
	       </div>
	       
	       <div class="featured-card">
	       
	         <h2>Lightning-Fast Delivery<img alt="" src="https://thumbs.dreamstime.com/b/silhouette-food-delivery-rider-scooter-location-icon-utensils-silhouette-food-delivery-rider-scooter-328752333.jpg"> </h2>
	         <p>Fresh food delivered to your doorstep in no time. Never let hunger wait!.</p>
	       
	       </div>
	       <div class="featured-card">
	         <h2>Trending Dishes<img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRRuxYgg6CagdCExdULWQqcB4C03viEBfH3A&s"> </h2>
	         <p>Don’t miss out on what’s trending! Try the most popular dishes loved by our customers.</p>
	       </div>
	       <div class="featured-card">
	         <h2>Curated Just for You<img alt="" src="https://static.vecteezy.com/system/resources/previews/000/568/432/original/menu-icon-vector.jpg"> </h2>
	         <p>Personalized recommendations based on your tastes. Discover something new today!.</p>
	       </div>
	       <div class="featured-card">
	         <h2>Farm-to-Table Freshness <img alt="" src="https://media.istockphoto.com/id/1256188089/vector/fruits-and-vegetables-black-glyph-icon.jpg?s=612x612&w=0&k=20&c=aSXDG4T2kMk-4uvTypEvJv6aKvw2t1n2GNe4Guu4Ne4="> </h2>
	         <p>Our partner restaurants use only the freshest ingredients to ensure every bite delights.</p>
	       </div>
	   
	   </article>
	
	</section>
	
	
	
	<!-- Trending Foos Section -->
	
	<%
	 
	  List<MenuItems> topTrendingFoods = new MenuItemsImp().getTrendingFoodItems();
	  
	  if(topTrendingFoods.size()>0)
	  {
		  %>

	<section class="section-2">
		<h1>
			Top Trending <img alt="" src="https://icon-library.com/images/trending-icon/trending-icon-2.jpg">
		</h1>
         <article class="feature-wrapper mt-3">
      <%
         int trendingBadge=1; 
         for(MenuItems item :topTrendingFoods)
         { 
        	 %>
		

			<div class="top-rated-card" onclick="handleTrendingCardClick(<%=item.getItemId()%>)">
			    <span><%="#"+trendingBadge %></span>
				<img alt="" src="<%=item.getImg()%>">
				<h2>
					<%=item.getName() %>
				</h2>

			</div>

		

		<%
		trendingBadge++;
		}
		%>
      
         </article>
	</section>



	<%
	}
	%>
	
	<%@include file="/customer/Footer.jsp" %>

	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
	
	
	<script type="text/javascript">
	  
	gsap.registerPlugin(ScrollTrigger);
	
	  function handleCategoryClick(category)
	  {
	     let url = '<%= request.getContextPath()+"/customer/Menu.jsp?q="%>'+category;
	     
	     window.location.href=url
	  }
	  
	  function handleTrendingCardClick(menuId)
	  {
		  let url = '<%= request.getContextPath()+"/customer/FoodItem.jsp?menu_id="%>'+menuId;
		   window.location.href=url 
	  }
	  
	  
	  
	  const t1 = gsap.timeline();

	// Check if the animation has already been played in this session
	if (!sessionStorage.getItem("animationPlayed")) {
	  // Run animation
	  t1.from(".large-cicle", {
	    duration: 1,
	    x: -2000,
	    scrub: true,
	  })
	    .from(".img-plate", {
	      duration: 0.5,
	      opacity: 0,
	      scrub: true,
	    })
	    .from(".info-wrapper", {
	      duration: 0.7,
	      opacity: 0,
	      scrub: true,
	    })
	    .from(".desktop-navbar", {
	      duration: 1,
	      opacity: 0,
	      y: -20,
	      scrub: true,
	    });

	  // Set the flag in sessionStorage so the animation doesn't run again
	  sessionStorage.setItem("animationPlayed", "true");
	}
	
	
	gsap.from(".category-section",{
	      scrollTrigger: {
	          trigger: '.category-section',
	          start: 'top 80%', // When the top of the element hits the bottom of the viewport
	          end: 'top 40%', // When the top of the element reaches the top of the viewport
	          scrub: true, // Smoothly scrubs the animation with scroll
	      },
	        opacity: 0, 
	        duration: 1,
	       
	      })
	      
	 gsap.from(".category-card",{
	      scrollTrigger: {
	          trigger: '.category-section',
	          start: 'top 80%', // When the top of the element hits the bottom of the viewport
	          end: 'top 40%', // When the top of the element reaches the top of the viewport
	          scrub: true, // Smoothly scrubs the animation with scroll 
	      },
	        opacity: 0, 
	        y:50,
	        duration: 0.5,
	        stagger:0.3
	       
	      })
	      
	     
	      	      
	    

	  
	  
	
	</script>
	


</body>
</html>