<%@page import="com.swiggy.dao.impl.UsersDaoImp"%>
<%@page import="com.swiggy.dao.UsersDao"%>
<%@page import="com.swiggy.dto.Reviews"%>
<%@page import="com.swiggy.dao.impl.ReviewDaoImpl"%>
<%@page import="com.swiggy.dao.ReviewDao"%>
<%@page import="com.swiggy.dto.Restaurants"%>
<%@page import="com.swiggy.dao.impl.RestaurantsDaoImp"%>
<%@page import="com.swiggy.dao.impl.MenuItemsImp"%>
<%@page import="com.swiggy.dao.MenuItemDAO"%>
<%@page import="com.swiggy.dto.MenuItems"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/customer/CustomerSession.jsp" %> 
   
   <%
    if(request.getParameter("menu_id") == null)
    {
    	response.sendRedirect( request.getContextPath()+"/customer/Home.jsp");
    	return;
    }
    request.setAttribute("menu", "Menu");
   %>
   
   
   
   <%
    MenuItemDAO menuItemDAO =  new MenuItemsImp();
    MenuItems searchItem = menuItemDAO.getItemById(Integer.parseInt(request.getParameter("menu_id")));
    Restaurants itemRestaurant = new RestaurantsDaoImp().getRestaurant(searchItem.getRestaurantId());
    int currentPage =  1;
    int limit = 10;
    String q = searchItem.getCategory();

    List<MenuItems> similarMenuItems = menuItemDAO.getAllItems(searchItem.getItemId(),limit,currentPage);
   %>
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=searchItem.getName() %></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() + "/Pagination.css"%>"></link>
<style type="text/css">
 body {
	min-height: 100vh;
	width: 100%;
	font-family: "outfit", sans-serif;
	max-width: 1800px;
	margin: 0 auto;
	padding:20px 0px;	
}

.section-wrapper{
 margin-top: 2vh;
 padding: 20px;
 
 width: 98%;
 margin:0 auto;
 max-width: 1200px;
 display: flex;
 justify-content: flex-start;
 align-items: flex-start;
 gap:10px;
}
.img-wrapper img{
 width: 300px;
 height: 300px;
 border-radius: 10px;
}
.review-section ,.similar-section{
 width: 98%;
 margin:0 auto;
 max-width: 1200px;
 
}
.not-review{
 width: 100%;
 display: flex;
 justify-content:center;
 align-items: center;
 height: 10vh;
 border-radius: 20px;
 background: #efefef80;
}
.menu-info{
 flex: 1;
}
.menu-info h2{
 font-size: 1.6rem;
 display: flex;
 justify-content: flex-start;
 align-items: center;
}
.menu-info h2 span{
 font-size: 0.8rem;
}
.menu-info h2 span i{
 color: #feb80a;
 font-size: 1rem;
}

.menu-info .desc{
 font-size: 0.8rem;
 color: graytext;
}

.price-tag{
 font-size: 1.2rem;
 color: black;
}

.unavailable{
 padding: 4px;
 font-size: 0.7rem;
 border: 1px solid red;
 width: fit-content;
 color: red;
 border-radius: 20px;
}

.category{
 font-size: 0.9rem;
}
.cat-tag{
 padding: 1px 5px;
 background: #feb80a;
 font-size: 0.75rem;
 border-radius: 10px;
}

.restaurant-info{
  
  font-size: 0.9rem;
}

.cart-btn{
 border: 1px solid black;
 background: white;
 border-radius: 20px;
 padding: 3px 6px;
}
.buy-btn{
 border: none;
 background: #feb80a;
 border-radius: 20px;
 padding: 3px 9px;
 margin-left: 5px;
}

.review-card{
 width: 100%;
 padding: 10px;
 border-radius: 20px;
 background: white;
 border: 1px solid #efefef;
}

.review-card h6{
 display: flex;
 justify-content: space-between;
 align-items: center;
}
.review-date{
 font-size: 0.75rem;
 color: graytext;
}

.comment-card h6{
 font-size: 0.8rem;
}

.comment-card .comment{
 background: #ededed80;
 padding: 10px;
 width: 100%;
 border-radius: 10px;
}

.similar-section article{
 width: 100%;
 overflow: auto;
 padding: 5px;
 display: flex;
 justify-content: flex-start;
 align-items: center;
 gap:5px;
}

.similar-food-card{
 padding: 5px;
 border-radius:10px;
 width: 200px;
 cursor: pointer;
 
}

.similar-food-card:hover{
 box-shadow: 1px 1px 5px graytext !important;
}


.similar-food-card img{
 width: 100%;
 height: 200px;
 border-radius:10px 10px 0px 0px;
}

.similar-food-card .info h4{
 display: flex;
 justify-content: flex-start;
 align-items: center;
 gap:5px;
 font-size:1rem;
}

.similar-img-wrapper{
 position: relative;
}

.img-overlay
{
 position: absolute;
 left: 0;
 bottom: 0;
 background: rgb(255,255,255);
background: linear-gradient(180deg, rgba(255,255,255,0.36740633753501406) 0%, rgba(0,0,0,0.7091430322128851) 67%);
 height: 30px;
 width: 100%;
 display: flex;
 justify-content: flex-end;
 align-items: center;
}

.similar-price-tag{
 padding: 2px 5px ;
 border-radius: 20px;
 background: #feb80a;
 font-size: 0.7rem;
}


@media (width<800px) {
 body {
   padding: 20px 5px;	
 }	 
}

@media (width<450px) {
 	 .section-wrapper{
 	  flex-direction: column;
 	  align-items: center;
 	 }
 	 .menu-info{
 	  justify-content: flex-start;
 	  width: 100%;
 	  display: flex;
 	  flex-direction: column;
 	  align-items: flex-start;
 	 }
}



</style>

</head>
<body>
<%@include file="/customer/Navbar.jsp"%>

  <section class="section-wrapper">
    
      <div class="img-wrapper">
          <img alt="<%=searchItem.getName() %>" src="<%= searchItem.getImg()%>">
          
      </div>
      
      
      <article class="menu-info">
         <h2><%=searchItem.getName() %> <span class="food-rating"><i class="ri-star-fill"></i> <%=searchItem.getRating() %></span></h2>
          <p class="mb-1 desc">Description : <%=searchItem.getDescription() %></p>
           <div class="mt-">
              <span class="price-tag"><i class="ri-money-rupee-circle-fill"></i> <%=searchItem.getPrice() %></span>   
          </div>
          
          <%
           if(searchItem.getAvailable() ==0)
           {
        	   %>
        	     <div class="unavailable">
                    <span>Currently Not Available</span>
                 </div>
        	   <% 
           }
          
          %>
          
          <div class="category mt-3">
           Category :  
           <%
             for(String cat : searchItem.getCategory().split(","))
             {
            	 %>
            	   <span class="cat-tag"><%=cat %></span>
            	 <% 
             }
           %>
          </div>
          
          <p class="mt-2 restaurant-info">Restaurant : <%=itemRestaurant.getName() %> </p>
          
          
          <div>
           
            <%
              boolean isSaved = user !=null   ? new CartDaoImp().lookCart(Integer.parseInt(request.getParameter("menu_id")), user.getUserId())  : false;
              
            if(isSaved)
            {
            	%>
            	 <button class="cart-btn">Saved <i class="ri-checkbox-circle-fill"></i></button>
            	<% 
            }else{
            	%>
            	  <button class="cart-btn" onclick="handleFoodCartClick('<%=request.getContextPath()%>/customer/cart/add?foodId=<%=searchItem.getItemId()%>')">Add To cart <i class="ri-shopping-cart-line"></i></button>
            
            	<%
            }
             
            %>
            
             
             <button class="buy-btn" type="button" onclick="handleBuyBtnClick('<%=request.getContextPath()+"/customer/BuyFood.jsp?foodId="+searchItem.getItemId()%>')">Buy <i class="ri-currency-fill"></i></button>
          </div>
          
      </article>
  </section>
  
   <!-- Review Section   --> 
   
   <%
    ReviewDao reviewDao =  new ReviewDaoImpl();
    List<Reviews> reviews =  reviewDao.getAllReviewsByFoodId(searchItem.getItemId());
    int reviewCount = reviewDao.getReviewsCount(searchItem.getItemId());
   
   %>
  <section class="review-section">
     <h2>Recent Reviews</h2>
      <article>



			<%
			if(reviewCount == 0)
			  			{
			%>
			<div class="not-review">
				<span>No Reviews &#128064;</span>
			</div>
			<%
			} else {
            
			UsersDao usersDao =  new UsersDaoImp();
			for (Reviews itemReview : reviews) {
				
				Users reviewedUser =  usersDao.getUser(itemReview.getUserId());
				
			%>
			<div class="review-card">
				<h6>
					<span><%=reviewedUser.getName() %></span> <span class="review-date">Reviewed on :<%=itemReview.getCreatedAt().toLocaleString() %> </span>
				</h6>
				<div class="comment-card">
					<h6>Comment :</h6>
					<div class="comment"><%=itemReview.getComment() %></div>
				</div>
			</div>
			<%
			}

			}
			%>

		</article>
  
  </section>
  
  
  <!--Similar Category Menu Items -->
  
 <%
   if (similarMenuItems.size() > 0) {
   %> 
	     <section class="similar-section mt-3">
          <h3>Similar Food</h3>
    
            <article class="mt-2">
         
              <%
               for(MenuItems similarFood :similarMenuItems)
               {
            	   %> 
            	   <div class="similar-food-card" onclick="handleMenuItemClick('<%=request.getContextPath()+"/customer/FoodItem.jsp?menu_id="+similarFood.getItemId()%>')">
                       <div class="similar-img-wrapper">
                          <img alt="" src="<%=similarFood.getImg()%>">
                          <div class="img-overlay">
                            <span class="similar-price-tag"><i class="ri-money-rupee-circle-fill"></i> <%=similarFood.getPrice() %></span>
                          </div>
                       </div>
                       <div class="info">
                        <h4> <span><%=similarFood.getName() %></span> <span><i class="ri-star-fill"></i> <%=similarFood.getRating() %></span> </h4>
                       </div>
                   </div>
            	   <% 
               }
              %>
     
           </article>
  
         </section>
	   
	  <%
  }
 
 %>
  
  
  
  
<%@include file="/utils/Alerts.jsp" %>  

<script type="text/javascript">

   function handleMenuItemClick(url)
   {
	   window.location.href = url;
   }
   
   function handleFoodCartClick(url)
   {
	   event.stopPropagation();
	   
	 //  window.location.href = "http://localhost:8080"+url
	   fetch("http://localhost:8080" + url, {
		   method: "GET",
		 })
		   .then((response) => {
		     if (response.ok) {
		       return response.text(); // Convert response to plain text
		     } else {
		       throw new Error("Failed to fetch: " + response.status);
		     }
		   })
		   .then((data) => {
			  
		     if(data === "login")
		       {
		    	 window.location.href =  "http://localhost:8080/Swiggy/customer/SignIn.jsp";
		       }
		     else if(data === "success")
		       {
		    	 showSuccessAlert("Item addded to cart successfully")
		     	setTimeout(()=>{
		     	  window.location.reload() 
		     	},1000)
		       }
		     else{
		    	 showAlert("Failed to add to cart")
		     }
		   })
		   .catch((error) => {
		     console.log("Error: " + error.message); 
		   });
 
	   
   }
   
   
   function handleBuyBtnClick(url)
   {
	   window.location.href=url;
   }

</script>

</body>
</html>