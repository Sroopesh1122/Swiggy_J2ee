<%@page import="com.swiggy.dao.impl.MenuItemsImp"%>
<%@page import="com.swiggy.dao.MenuItemDAO"%>
<%@page import="com.swiggy.dto.MenuItems"%>
<%@page import="com.swiggy.dto.OrderItems"%>
<%@page import="com.swiggy.dao.impl.OrderItemImpl"%>
<%@page import="com.swiggy.dao.IOrderItemDao"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.swiggy.dto.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.swiggy.dao.impl.OrderDAOImp"%>
<%@page import="com.swiggy.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/customer/CustomerSession.jsp" %> 
   
   <% 
      
     if(user ==null)
     {
    	 response.sendRedirect(request.getContextPath()+"/customer/SignIn.jsp");
    	 return;
     }
     request.setAttribute("menu", "Orders");
     
     int currentPage = request.getParameter("page")!=null ? Integer.parseInt(request.getParameter("page")) : 1 ;
     int limit = request.getParameter("limit")!=null ? Integer.parseInt(request.getParameter("limit")) : 10 ;
     
     //Filter for pending , delivered amd all
     String filter = request.getParameter("filter")!=null ? request.getParameter("filter") : "Pending,Dispatched";
     
     OrderDAO orderDAO= new OrderDAOImp();
     List<Orders> yourOrders = orderDAO.getOrderByUserId(user.getUserId(),currentPage, limit , filter);
     int yourTotalOrders = orderDAO.getOrderByUserId(user.getUserId(),filter);
     
     
     //All Filters
     
    Map<String,String> filters = new HashMap();
    filters.put("Pending", "Pending,Dispatched"); 
    filters.put("Delivered", "Delivered");
    filters.put("All", "All"); 
     
     
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Orders</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>
<style type="text/css">
 
   body 
   {
	min-height: 100vh;
	width: 100%;
	font-family: "outfit", sans-serif;
	max-width: 1800px;
	margin: 0 auto;
	padding:20px 0px;	
   }
   
   .not-found{
    min-height: 70vh;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
   }
   
   .not-found img{
    width: 300px;
    height: 300px;
   }
   
   .shop-now{
    font-size: 0.8rem;
    color: black !important;
   }
   
   .order-wrapper{
    width: min(90%,1100px);
    margin: 0 auto;
   }
   
   .order-wrapper .title{
    font-size: 1.8rem;
    background:  #feb80a;
    padding: 10px;
    border-radius: 20px;
   }
   
   .category-section{
    display: flex;
    justify-content: flex-end;
    align-items: center;
    margin-top: 10px;
   }
   
   .delivery-cat-tag{
    margin: 0 3px;
    padding: 2px 8px;
    border-radius: 10px;
    box-shadow: 1px 1px 2px graytext !important;
    font-size: 0.75rem;
    cursor: pointer;
    color: black !important;
   }
   
   .delivery-cat-tag-active{
    background: #feb80a;
   }
   
   .category-section span{
    font-size: 0.8rem;
   }
   
   .order-list-wrapper{
    margin-top: 10px;
   }
   .order-item{
    padding: 5px 10px;
    box-shadow: 1px 2px 5px graytext !important;
    border-radius: 20px;
    margin-bottom: 5px;
   }
   .order-item .content{
    display: flex;
    justify-content: space-between;
    align-items:center;
    
   }
   
   .content img{
     
     width: 180px;
     height: 120px;
     border-radius: 10px;
     
   }
   
   .order-item footer{
    display: flex;
    justify-content: flex-end;
    align-items: center;
   }
   
   .review-btn{
    outline: none;
    border: none;
    padding: 4px 8px;
    border-radius: 20px;
    font-size: 0.7rem;
    border:1px solid  #feb80a;
    background: white;
   }
   
   .details{
    font-size: 0.8rem;
    min-width: 200px;
   }
   
   .item-title{
    font-size: 0.9rem;
    margin-bottom: 5px !important;
   }
   .price
   {
   font-size: 0.85rem;
   }
   
   
   @media (width <475px) {
   
    .content img{
     
     width: 120px;
     height: 80px;
     
   }
   
   .item-title{
    font-size: 0.8rem;
    margin-bottom: 5px !important;
   }
   .price
   {
   font-size: 0.75rem;
   }
   
   .details{
    font-size: 0.7rem;
    min-width: 150px;
   }
     
	
   }

</style>

</head>
<body>
<%@include file="/customer/Navbar.jsp"%>

   
   <section class="order-wrapper">
     
     <h2 class="title">Your Orders</h2>
   
     <article class="category-section">
        
         <span class="me-1">Filters :</span>
         
         <%
          
          for(Entry entry : filters.entrySet()) {
        	  %>
      	    <a href="<%=request.getContextPath()+"/customer/Orders.jsp?filter="+entry.getValue() %>" class="delivery-cat-tag <%=filter.equalsIgnoreCase(entry.getValue().toString()) ? "delivery-cat-tag-active" : ""%> "><%=entry.getKey() %></a>
      	  <%
        }
          
         
         %>
      
     </article>

		<%
		if (yourTotalOrders == 0) {
		%>

		<section class="not-found">

			<img alt=""
				src="https://img.freepik.com/premium-photo/cartoon-dog-with-tongue-sticking-out-from-wall-generative-ai_955925-4511.jpg">
			<h4>Your Order Table is Empty.</h4>
			<a class="shop-now"
				href="<%=request.getContextPath() + "/customer/Menu.jsp"%>">Shop
				Now</a>

		</section>

		<%
		 return;
		}
		%>
		
		
		<article class="order-list-wrapper">
		
		   <%
		    IOrderItemDao orderItemDao =  new OrderItemImpl();
		    MenuItemDAO menuItemDAO =  new MenuItemsImp();
		    for(Orders order : yourOrders)
		    {
		    	OrderItems orderItem  = orderItemDao.getById(order.getOrderId());
		    	MenuItems menuItem = menuItemDAO.getItemById(orderItem.getItemId());
		    	
		    	%>

			<div class="order-item">

				<%
				 if(order.getStatus().equalsIgnoreCase("Delivered") && order.getReveiwed()==0)
				 {
					 %>
				<footer>

					<button class="review-btn" onclick="handleReviewBtnClick('<%=request.getContextPath()+"/customer/Review.jsp?orderId="+order.getOrderId()%>')">
						Leave Review <i class="ri-arrow-right-fill"></i>
					</button>

				</footer>

				<%
				 }
				%>


				<div class="content">
					<img alt="" src="<%=menuItem.getImg()%>">


					<div class="details">
						<h6 class="mb-0 item-title"><%=menuItem.getName() %></h6>
						<h6 class="mb-0 price">Total : <%=orderItem.getQuantity() %> * <%=orderItem.getPrice() %> = <%=order.getTotalAmount() %></h6>
						<span>Status : <%=order.getStatus() %></span>
					</div>
				</div>





			</div>


			<%
		    }
		   
		   %>
		    
		 
		
		</article>
		

	</section>

	<script type="text/javascript">
	  
	   function handleReviewBtnClick(url)
	   {
		   window.location.href= url;
	   }
	
		
	</script>

</body>
</html>