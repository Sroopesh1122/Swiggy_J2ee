<%@page import="com.swiggy.dao.impl.MenuItemsImp"%>
<%@page import="com.swiggy.dao.MenuItemDAO"%>
<%@page import="com.swiggy.dto.MenuItems"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/restaurant/RestaurantSession.jsp" %> 
   
   <%
    if(restaurants == null)
    {
    	response.sendRedirect( request.getContextPath()+"/restaurant/SignIn.jsp");
    	return;
    }
    request.setAttribute("menu", "Menu");
   %>
   
   
   
   <%
    int currentPage = request.getParameter("page")!=null ? Integer.parseInt(request.getParameter("page"))   : 1;
    int limit = request.getParameter("limit")!=null ? Integer.parseInt(request.getParameter("limit"))   : 10;
    String q = (String) request.getParameter("q");
   
    MenuItemDAO menuItemDAO =  new MenuItemsImp();
    List<MenuItems> menuItems = menuItemDAO.getAllItems(restaurants.getRestaurantsId(),q,limit,currentPage);
    int totalCount = menuItemDAO.getMenuItemsCount(restaurants.getRestaurantsId(),q);
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
.section-2{
 padding: 10px 20px;
 display: flex;
 justify-content: flex-end;
 align-items: center;
}

.add-btn{
 border: none;
 background: #feb80a;
 color: black;
 padding: 5px 8px;
 border-radius: 15px;
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
.food-info h2 {
 font-size: 1.2rem;
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



</style>

</head>
<body>
<%@include file="/restaurant/Navbar.jsp"%>

<section class="section-wrapper">
  
  <article class="search-section">
     
     <form action="<%=request.getContextPath()+"/restaurant/Menu.jsp"%>">
       <input type="text" placeholder="Search" name="q">
       <button type="submit"><i class="ri-search-line"></i></button>
     </form>
     
  </article>
  
  <article class="section-2">
    
    <a class="add-btn" href="<%=request.getContextPath()+"/restaurant/AddFood.jsp"%>">Add Food</a>
  
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
  
  
  <section class="menu-item-list-wrapper">
     
     
     
     <article class="food-item-card">
       <span class="cart-btn"><i class="ri-bookmark-line"></i></span>
        <img alt="" class="food-img" src="data:image/jpeg;base64,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">
        
       <div class="food-info">
          <h2>Chapathi nlnd cdnl sdcndkn cndls</h2>
          <div class="mt-1 food-card-footer">
              <span class="price-tag"><i class="ri-money-rupee-circle-fill"></i> 200</span>   
          </div>
       </div>
     </article> 
     
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



</body>
</html>