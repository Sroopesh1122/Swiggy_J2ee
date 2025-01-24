<%@page import="com.swiggy.dto.MenuItems"%>
<%@page import="com.swiggy.dto.Users"%>
<%@page import="com.swiggy.dao.impl.MenuItemsImp"%>
<%@page import="com.swiggy.dao.MenuItemDAO"%>
<%@page import="com.swiggy.dao.impl.UsersDaoImp"%>
<%@page import="com.swiggy.dao.UsersDao"%>
<%@page import="com.swiggy.dto.Reviews"%>
<%@page import="java.util.List"%>
<%@page import="com.swiggy.dao.impl.ReviewDaoImpl"%>
<%@page import="com.swiggy.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/restaurant/RestaurantSession.jsp" %> 
   
   <%
    if(restaurants == null)
    {
    	response.sendRedirect( request.getContextPath()+"/restaurant/SignIn.jsp");
    	return;
    }
    request.setAttribute("menu", "Reviews"); 
    int currentPage = request.getParameter("page")!=null ? Integer.parseInt(request.getParameter("page")) : 1 ;
    int limit = request.getParameter("limit")!=null ? Integer.parseInt(request.getParameter("limit")) : 10 ;
    
    
    ReviewDao reviewDao =  new ReviewDaoImpl();
    int totalReviews = reviewDao.getReviewsCountByRestautantId(restaurants.getRestaurantsId());
    List<Reviews> yourReviews = reviewDao.getAllReviewsByRestaurantId(restaurants.getRestaurantsId(),currentPage, limit);
    
    
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reviews</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() + "/Pagination.css"%>"></link>

<style type="text/css">
 body {
	font-family: "outfit", sans-serif;
	padding: 20px 0px;
  }
  
  .section-wrapper{
   width: min(95%,1000px);
   padding: 5px;
   margin: 0 auto;
   margin-top: 10px;
  }
  .section-wrapper h1{
   font-size: 1.6rem;
   background: #feb80a;
   padding: 5px 10px;
   border-radius: 10px;
  }
  
  .header-info{
   display: flex;
   justify-content: flex-end;
   padding-right: 10px;
   align-items: center;
  }
  
  .header-info span{
   font-size: 0.8rem;
   margin: 0px 2px;
   padding: 2px 6px;
   border: 1px solid ;
   border-radius: 20px;
  }
  
  .star{
   color: #feb80a;
  }
  
  .empty{
   width: 100%;
   display: flex;
   justify-content: center;
   align-items: center;
   min-height: 60vh;
   flex-direction: column;
  }
  
  .empty p{
   font-size: 1.3rem;
   transform:translateY(-10px);
  }
  
  .review-card{
   box-shadow: 1px 1px 3px #efefef !important;
   border-radius: 10px;
   border:1px solid #efefef;
   margin-bottom: 8px;
   padding: 10px;
  }
  .review-card img{
   width: 80px;
   height: 80px;
  }
  .reviewdItem-details{
   margin-top: 5px;
   color: graytext;
  }
  .reviewdItem-details h6{
   margin-bottom: 2px;
   font-size: 0.8rem;
  }
  
  .reporter-details{
   margin-top: 15px;
   
  }
  
  .reporter-details h6{
   margin-bottom: 3px;
   font-size: 0.9rem;
  }
  .reviwed-date{
   text-align: right;
   font-size: 0.7rem !important;
  }

</style>

</head>
<body>
<%@include file="/restaurant/Navbar.jsp"%>

 <section class="section-wrapper">
  <h1>Reviews</h1>
   
   <article class="header-info">
       <span>Total Reviews : <%=totalReviews %></span> <span>Hotel Rating : <%=restaurants.getRating() %> <i class="ri-star-fill star"></i> </span>
   </article>
   
   <%
    if(totalReviews == 0)
    {
    	%>
    	  <article class="empty">
    	     
    	      <img alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuMcY70CUT6s9z-NcarTvfWhRAzVSNtbtJqg&s">
    	      <p>No Reviews Found!.</p>
    	  
    	  </article>
    	<%
    	return;
    }
   %>
   
   
   
   <main class="reviews-list-wrapper mt-3">
   
      <%
        
         UsersDao usersDao = new UsersDaoImp();
         MenuItemDAO menuItemDAO = new MenuItemsImp();
         for(Reviews itemReview :yourReviews)  	 
         {
        	 Users user =  usersDao.getUser(itemReview.getUserId());
        	 MenuItems menuItem = menuItemDAO.getItemById(itemReview.getMenuId());
        	 %>
        	  
        	  <div class="review-card">
        	    <img alt="" src="<%=menuItem.getImg()%>">
        	    
        	    <div class="reviewdItem-details">
        	       <h6>Menu Item Id : <%=menuItem.getItemId() %></h6>
        	       <h6>Menu Item Name : <%=menuItem.getName() %></h6>
        	    </div>
        	    
        	    <div class="reporter-details">
        	       <h6>Reviwed By : <%=user.getName() %></h6>
        	       <h6>Rating : <%=itemReview.getRating() %> <i class="ri-star-fill star"></i></h6>
        	       <h6>Comment : <%=itemReview.getComment() %></h6>
        	       <h6 class="reviwed-date">Date : <%=itemReview.getCreatedAt().toLocaleString() %></h6>
        	       
        	    </div>
        	    
        	  
        	  </div>
        	 
        	 <%
         }
      %>
   
   
   
   
   
   </main>
   
   <%
		int noOfPages = (int) Math.ceil((double) totalReviews / limit);
		int startPage = Math.max(1, currentPage - 2);
		int endPage = Math.min(noOfPages, currentPage + 2);
	%>
   <div class="pagination center my-4">

			<%
			if (currentPage > 1) {
			%>
			<a class="pagination-btn center" href="<%=request.getContextPath()+"/restaurant/Reviews.jsp?page="+(currentPage-1)+"&limit"+limit%>">Prev</a>
			
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
			           <a class="pagination-btn center" href="<%=request.getContextPath()+"/restaurant/Reviews.jsp?page="+(i)+"&limit"+limit%>"  ><%=i%></a>
			    <%
				}
				

			}
			%>
			<%
			if (currentPage < noOfPages) {
			%>
			<a class="pagination-btn center" href="<%=request.getContextPath()+"/restaurant/Reviews.jsp?page="+(currentPage+1)+"&limit"+limit%>">Next</a>
			<%
			}
			%>
		</div>
   
   
 </section>

</body>
</html>