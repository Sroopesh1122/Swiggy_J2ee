<%@page import="com.swiggy.dto.Deliveries"%>
<%@page import="com.swiggy.dto.DeliveryPartners"%>
<%@page import="com.swiggy.dao.impl.DeliveryPartnersDaoImpl"%>
<%@page import="com.swiggy.dao.impl.DeliveryDAOImp"%>
<%@page import="com.swiggy.dao.DeliveryPartnersDAO"%>
<%@page import="com.swiggy.dao.DeliveryDAO"%>
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
     String filter = request.getParameter("filter")!=null ? request.getParameter("filter") : "Pending,Preparing,Out for delivery";
     
     OrderDAO orderDAO= new OrderDAOImp();
     List<Orders> yourOrders = orderDAO.getOrderByUserId(user.getUserId(),currentPage, limit , filter);
     int yourTotalOrders = orderDAO.getOrderByUserId(user.getUserId(),filter);
     
     
     //All Filters
     
    Map<String,String> filters = new HashMap();
    filters.put("Pending", "Pending,Preparing,Out for delivery"); 
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
<link rel="stylesheet" href="<%=request.getContextPath() + "/Pagination.css"%>"></link>
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
   .order-item-wrapper{
    padding: 5px 10px;
    box-shadow: 1px 1px 2px #efefef !important;
    border-radius: 20px;
    margin-bottom: 5px;
    border:1px solid #efefef;
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
     cursor: pointer;
     
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
   
   .picker-details {
    padding: 0px;
    margin-top: 2px;
    overflow: hidden;
    height: 0px;
    transition: all 0.5s; /* Changed duration to 1 second */
}

   .picker-details-open {
    height: 100px;
   }

   
   .picker-details h4 ,.picker-details h6{
    margin-bottom: 2px;
   }
   
    .picker-details h4{
     font-size: 0.9rem;
     color: graytext;
    }
    
    .picker-details h6{
     font-size: 0.7rem;
    }
    
    .picker-show-btn-wrapper{
     display: flex;
     justify-content: flex-end;
     align-items: center;
    }
    
    .picker-show-btn-wrapper span{
     font-size: 0.85rem;
     cursor: pointer;
    }
    
    .picker-icon{
     display: inline-block;
     transition:all 0.5s;
    
    }
    
    .picker-icon-rotate{
     transform:rotate(180deg);
    }
    
    .text-green{
     color: green;
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
			<article class="order-item-wrapper">
				<div class="order-item">

					<%
					if (order.getStatus().equalsIgnoreCase("Delivered") && order.getReveiwed() == 0) {
					%>
					<footer>

						<button class="review-btn"
							onclick="handleReviewBtnClick('<%=request.getContextPath() + "/customer/Review.jsp?orderId=" + order.getOrderId()%>')">
							Leave Review <i class="ri-arrow-right-fill"></i>
						</button>

					</footer>

					<%
					}
					%>


					<div class="content">
						<img alt="" src="<%=menuItem.getImg()%>" onclick="handleOrderClick('<%=request.getContextPath()+"/customer/FoodItem.jsp?menu_id="+menuItem.getItemId()%>')">


						<div class="details">
							<h6 class="mb-0 item-title"><%=menuItem.getName()%></h6>
							<h6 class="mb-0 price">
								Total :
								<%=orderItem.getQuantity()%>
								*
								<%=orderItem.getPrice()%>
								=
								<%=order.getTotalAmount()%></h6>
							<span>Status :
							 <%
							  if(order.getStatus().equals("Delivered"))
							  {
								  %>
								    <i class="ri-checkbox-circle-fill text-green"></i>
								  <%
							  }
							 %>
							
							 <%=order.getStatus()%></span>
						</div>
					</div>







				</div>




				<%
				if (order.getPickedBy() != 0) {
					DeliveryDAO deliveryDAO = new DeliveryDAOImp();
					DeliveryPartnersDAO deliveryPartnersDAO = new DeliveryPartnersDaoImpl();
					DeliveryPartners deliveryPartners = deliveryPartnersDAO.getDeliveryPartners(order.getPickedBy());
					Deliveries delivery = deliveryDAO.getDeliveryByOrderId(order.getOrderId());
				%>
                
                <div class="picker-show-btn-wrapper mt-2">
                  <span onclick="handlePickerShowBtnClick('<%=order.getOrderId() %>')" >Picker Details <i id="<%=order.getOrderId()+"icon" %>" class="ri-arrow-down-s-fill picker-icon "></i></span>
                </div>
				<div class="picker-details " id="<%=order.getOrderId()%>">
					<h4>Delivery Agent</h4>
					<h6>
						<i class="ri-user-fill"></i><%=deliveryPartners.getName()%></h6>
					
					<h6>
						<i class="ri-motorbike-fill"></i>
						<%=deliveryPartners.getVehicleDetails()%></h6>
					<h6>
						<i class="ri-phone-fill"></i>
						<%=deliveryPartners.getPhoneNumber()%></h6>
				    <h6>
						Picked At :
						<%=delivery.getAssignedAt().toString()%></h6>
					<h6>
						Delivery Code :
						<%=delivery.getDeliveryCode()%></h6>	
				</div>

				<%
				}
				%>


			</article>




			<%
			}
			%>
		    
		 
		
		</article>
		
		
		 <%
		int noOfPages = (int) Math.ceil((double) yourTotalOrders / limit);
		int startPage = Math.max(1, currentPage - 2);
		int endPage = Math.min(noOfPages, currentPage + 2);
	%>
  <div class="pagination center my-4">

			<%
			if (currentPage > 1) {
			%>
			<a class="pagination-btn center" href="<%=request.getContextPath()+"/customer/Orders.jsp?page="+(currentPage-1)+"&limit="+limit+"&filter="+filter%>">Prev</a>
			
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
			           <a class="pagination-btn center" href="<%=request.getContextPath()+"/customer/Orders.jsp?page="+(i)+"&limit="+limit+"&filter="+filter%>" ><%=i%></a>
			    <%
				}
				

			}
			%>
			<%
			if (currentPage < noOfPages) {
			%>
			<a class="pagination-btn center" href="<%=request.getContextPath()+"/customer/Orders.jsp?page="+(currentPage+1)+"&limit="+limit+"&filter="+filter%>">Next</a>
			<%
			}
			%>
		</div>
		

	</section>

	<script type="text/javascript">
	  
	   function handleReviewBtnClick(url)
	   {
		   window.location.href= url;
	   }
	   
	   
	   function handlePickerShowBtnClick(com)
	   {
		   $("#"+com).toggleClass("picker-details-open");
		   $("#"+com+"icon").toggleClass("picker-icon-rotate")
	   }
	   
	   function handleOrderClick(url)
	   {
		   window.location.href= url;
	   }
	
		
	</script>

</body>
</html>