<%@page import="com.swiggy.dto.Restaurants"%>
<%@page import="com.swiggy.dao.impl.RestaurantsDaoImp"%>
<%@page import="com.swiggy.dao.RestaurantsDao"%>
<%@page import="com.swiggy.dao.impl.MenuItemsImp"%>
<%@page import="com.swiggy.dao.MenuItemDAO"%>
<%@page import="com.swiggy.dto.MenuItems"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/customer/CustomerSession.jsp" %> 
   
   <%
   request.setAttribute("menu", "Menu");
   %>
   
   <%
    int currentPage = request.getParameter("page")!=null ? Integer.parseInt(request.getParameter("page"))   : 1;
    int limit = request.getParameter("limit")!=null ? Integer.parseInt(request.getParameter("limit"))   : 10;
    String q = (String) request.getParameter("q");
   
    MenuItemDAO menuItemDAO =  new MenuItemsImp();
    List<MenuItems> menuItems = menuItemDAO.getAllItems(q,limit,currentPage);
    int totalCount = menuItemDAO.getMenuItemsCount(q);
   %>
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
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

}
.search-section{
 padding: 10px 0px;
 display: flex;
 justify-content: center;
 align-items: center;
}

.search-section form{
 padding: 4px 8px;
 border: 1px solid #efefef;
 width: 400px;
 border-radius: 20px;
 display: flex;
 justify-content: flex-start;
 align-items: center;
}

.search-section form input{
 border: none !important;
 outline:none !important;
 flex: 1;
 display: flex;
 padding-right: 10px;
}

.search-section form button {
	border: none;
	background: white;

}


.add-btn:hover{
 color: black;
}

.menu-item-list-wrapper{
    width:100%; 
    display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap:10px;
	align-content: center;
}

.food-item-card{
 background: white;
 position: relative;
 cursor: pointer;
}

.food-item-card:hover
{
 box-shadow: 0px 2px 4px graytext !important;
}

.food-item-card .food-img{
 width: 100%;
 height: 250px;
 border-radius: 10px 10px 0px 0px;
 z-index: -1;
}

.food-info{
 width: 100%;
 background: white;
 border-radius:0px 0px 5px 5px;
 border: 1px solid #efefef;
 box-shadow: 0px 1px 1px graytext !important;
}

.cart-btn{
 position: absolute;
 top: 10px;
 right: 10px;
 background: white;
 z-index: 10;
 padding: 2px;
 border-radius: 50%;
 width: 20px;
 height: 20px;
 display: flex;
 justify-content: center;
 align-items: center;
}
.food-info{
 padding: 5px;
}
.food-title {
 font-size: 1.01rem;
 overflow: hidden;
 white-space: nowrap;
 text-overflow: ellipsis;
}
.food-card-footer{
 display: flex;
 justify-content: flex-end;
 align-items: center;
}

.price-tag
{
  padding: 2px 4px;
  border-radius: 10px;
  font-size: 0.8rem;
  background: #feb80a;
  display: flex;
  justify-content: center;
  align-items: center;
  gap:2px;
}


.not-found{
 width: 100%;
 height: 60vh;
 display: flex;
 justify-content: center;
 align-items: center;
}

.not-found p {
 font-size: 1.5rem;
}

.not-avaiable-overlay{
 position: absolute;
 width: 100%;
 height: 100%;
 display: flex;
 justify-content: center;
 align-items: center;
 top:0;
 left: 0;
 background: #f9f7f7a6;
 color: red;
 font-size: 1.2rem;
}

.section-2{
 padding: 10px 20px;
 display: flex;
 justify-content: flex-end;
 align-items: center;
}

.total-Count{
 border: none;
 background: #feb80a;
 color: black;
 padding: 5px 8px;
 border-radius: 15px;
}

.food-desc {
  font-size: 0.8rem;
  color: graytext;
  display: -webkit-box; 
  -webkit-line-clamp: 3; 
  -webkit-box-orient: vertical; 
  overflow: hidden;
  text-overflow: ellipsis; 
}
.food-rating{
 font-size: 0.95rem;
}
.food-rating i{
 color: #feb80a;
 font-size: 1.1rem;
}

.food-hotel-info{
 font-size: 0.7rem;
 color: #14213d;
 overflow: hidden;
 white-space: nowrap;
 text-overflow: ellipsis;
}




</style>

</head>
<body>
<%@include file="/customer/Navbar.jsp"%>

<section class="section-wrapper">
  
  <article class="search-section">
     
     <form action="<%=request.getContextPath()+"/customer/Menu.jsp"%>">
       <input type="text" placeholder="Search" name="q" value="<%=request.getParameter("q")!=null ? request.getParameter("q")  : ""%>">
       <button type="submit"><i class="ri-search-line"></i></button>
     </form>
     
  </article>
  
  
  
  <%
    if(menuItems.size() == 0)
    {
    	%>
    	 
    	 <section class="not-found">
    	    
    	     <p>&#128532; Your  Menu is Empty </p> 
    	 
    	 </section>
    	
    	<%
    	return;
    }
  
  %>
  
  <section class="section-2">
    <span class="total-Count">Result Count : <%=totalCount %></span>  
  </section>
  
  <section class="menu-item-list-wrapper">
     
     
     
     <%
     RestaurantsDao restaurantsDao = new RestaurantsDaoImp();
     for(MenuItems menuItem : menuItems)
     {
    	 Restaurants restaurant = restaurantsDao.getRestaurant(menuItem.getRestaurantId());
    	 %>
    	  
      <article class="food-item-card" onclick="handleMenuItemClick('<%=request.getContextPath()+"/restaurant/UpdateFood.jsp?menu_id="+menuItem.getItemId()%>')">
       
       <%
        if(menuItem.getAvailable() ==0)
        {
        	%>
        	  <div class="not-avaiable-overlay">
                Not Available
              </div> 
        	<% 
        }
       %>
       
       <span class="cart-btn"><i class="ri-bookmark-line"></i></span>
        <img alt="" class="food-img" src="<%=menuItem.getImg()%>"/>
       <div class="food-info">
          <h2 class="food-title"><%=menuItem.getName() %> <span class="food-rating"><i class="ri-star-fill"></i> <%=menuItem.getRating() %></span> </h2>
          <p class="mb-1 food-desc"><%=menuItem.getDescription() %></p>
          <p class="food-hotel-info" class="mb-1">Restaurant : <%=restaurant.getName() %></p>
          <div class="mt-1 food-card-footer">
              <span class="price-tag"><i class="ri-money-rupee-circle-fill"></i> <%=menuItem.getPrice() %></span>   
          </div>
       </div>
     </article> 
    	 
    	 <%
     }
     
     %>
     
  </section>
  
  <%
		int noOfPages = (int) Math.ceil((double) totalCount / limit);
		int startPage = Math.max(1, currentPage - 2);
		int endPage = Math.min(noOfPages, currentPage + 2);
	%>
  <div class="pagination center my-4">

			<%
			if (currentPage > 1) {
			%>
			<a class="pagination-btn center" href="#">Prev</a>
			
			<%
			}
			%>
			<%
			for (int i = startPage; i <=endPage; i++) {
				
				if(i== currentPage)
				{
					%>
					   <a class="pagination-btn center active "  ><%=i%></a>
					<% 
				}else{
				  %>
			           <a class="pagination-btn center" href="#"  ><%=i%></a>
			    <%
				}
				

			}
			%>
			<%
			if (currentPage < noOfPages) {
			%>
			<a class="pagination-btn center" href="#">Next</a>
			<%
			}
			%>
		</div>
  
</section>

<script type="text/javascript">

   function handleMenuItemClick(url)
   {
	   window.location.href = url;
   }

</script>

</body>
</html>