<%@page import="com.app.utils.AppProperties"%>
<%@page import="com.swiggy.dto.Deliveries"%>
<%@page import="com.swiggy.dto.DeliveryPartners"%>
<%@page import="com.swiggy.dao.impl.DeliveryPartnersDaoImpl"%>
<%@page import="com.swiggy.dao.DeliveryPartnersDAO"%>
<%@page import="com.swiggy.dao.impl.DeliveryDAOImp"%>
<%@page import="com.swiggy.dao.DeliveryDAO"%>
<%@page import="com.swiggy.dto.Users"%>
<%@page import="com.swiggy.dao.impl.UsersDaoImp"%>
<%@page import="com.swiggy.dao.UsersDao"%>
<%@page import="com.swiggy.dto.MenuItems"%>
<%@page import="com.swiggy.dto.OrderItems"%>
<%@page import="com.swiggy.dao.MenuItemDAO"%>
<%@page import="com.swiggy.dao.impl.MenuItemsImp"%>
<%@page import="com.swiggy.dao.impl.OrderItemImpl"%>
<%@page import="com.swiggy.dao.IOrderItemDao"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.swiggy.dto.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.swiggy.dao.impl.OrderDAOImp"%>
<%@page import="com.swiggy.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/restaurant/RestaurantSession.jsp" %> 
   
   <%
    if(restaurants == null)
    {
    	response.sendRedirect( request.getContextPath()+"/restaurant/SignIn.jsp");
    	return;
    }
    request.setAttribute("menu", "Orders");
    
    
    int currentPage = request.getParameter("page")!=null ? Integer.parseInt(request.getParameter("page")) : 1 ;
    int limit = request.getParameter("limit")!=null ? Integer.parseInt(request.getParameter("limit")) : 10 ;
    
    //Filter for pending , delivered amd all
    String filter = request.getParameter("filter")!=null ? request.getParameter("filter") : "Pending";
    
    OrderDAO orderDAO= new OrderDAOImp();
    List<Orders> yourOrders = orderDAO.getOrderByRestaurantId(restaurants.getRestaurantsId(),currentPage, limit , filter);
    int yourTotalOrders = orderDAO.getOrderByRestaurantId(restaurants.getRestaurantsId(),filter);
    
    
    //All Filters
    
   Map<String,String> filters = new HashMap();
   
   
   filters.put("All", "All"); 
   filters.put("Delivered", "Delivered");
   filters.put("Out for Delivery", "Out for Delivery");
   filters.put("Prepared", "Prepared");
   filters.put("Preparing", "Preparing");
   filters.put("Pending", "Pending"); 
   
   
   List<String> status = Arrays.asList("Pending","Preparing","Prepared","Out For Delivery","Delivered");
   List<String> status1 = Arrays.asList("Pending","Get For Preparation","Mark as Prepared","Ready To Pick","Order Delivered");
       
   %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath() + "/Pagination.css"%>"></link>
<style type="text/css">
body {
	font-family: "outfit", sans-serif;
	padding: 20px 0px;
}

.empty {
	min-height: 60vh;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.empty img {
	width: 300px;
	height: 300px;
}

.empty p {
	transform: translateY(-50px);
	font-size: 1.5rem;
}

.order-wrapper {
	width: min(95%, 1000px);
	margin: 0 auto;
}

.section-title {
	font-size: 1.8rem;
    background:  #feb80a;
    padding: 10px;
    border-radius: 20px;
}

.category-section {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	margin-top: 10px;
	
}

.category-tags-wrapper{
    display:flex;
    overflow: auto;
	padding: 5px 0px;
	flex-wrap: nowrap;
	justify-content: flex-start;
	align-items: center;
}

.delivery-cat-tag {
	margin: 0 3px;
	padding: 2px 8px;
	border-radius: 10px;
	box-shadow: 1px 1px 2px graytext !important;
	font-size: 0.75rem;
	cursor: pointer;
	color: black !important;
	white-space: nowrap;
}

.delivery-cat-tag-active {
	background: #feb80a;
}

.category-section span {
	font-size: 0.8rem;
	white-space: nowrap;
}

.order-item{
 width: 100%;
 padding: 5px;
 border-radius: 10px;
 box-shadow: 1px 1px 5px #efefef !important;
 border:1px solid #efefef;
 position: relative;
 margin-bottom: 5px;
}

.order-item .quantity{
 padding: 2px 5px;
 font-size: 0.8rem;
 background: #feb80a;
 border-radius: 10px;
}

.order-item img{
 width: 100px;
 height: 100px;
 border-radius: 10px;
}
.menu-details{
 margin-top: 5px;
}
.item-name{
 font-size: 0.95rem;
}
.item-price{
 font-size: 0.85rem;
}

.shiping-details{
 margin-top: 5px;
}
.shiping-details h4{
 font-size: 1.2rem;
 color: graytext;
 text-decoration: underline;
}
.shiping-details h6{
 font-size: 0.75rem;
 margin-bottom: 2px;
}

.order-item-footer{
 position: absolute;
 top: 5px;
 right: 5px;
 padding: 2px 5px;
}

.status{
 border: none;
 font-size: 0.8rem;
 padding: 2px 6px;
 border-radius: 10px;
}
.picker-details{
 padding: 4px;
 background: #efefef;
 border-radius: 10px;
}
.picker-details h4{
 font-size: 1.3rem;
 margin-bottom: 2px;
}
.picker-details h6{
 font-size: 0.8rem;
 margin-bottom: 2px;
}
</style>

</head>
<body>
<%@include file="/restaurant/Navbar.jsp"%>


  <section class="order-wrapper">
    <h1 class="section-title">Your Orders</h1>
    
    <article class="category-section">
        
         <span class="me-1">Filters :</span>
         
         <div class="category-tags-wrapper">
				<%
				for (Entry entry : filters.entrySet()) {
				%>
				<a
					href="<%=request.getContextPath() + "/restaurant/Orders.jsp?filter=" + entry.getValue()%>"
					class="delivery-cat-tag <%=filter.equalsIgnoreCase(entry.getValue().toString()) ? "delivery-cat-tag-active" : ""%> "><%=entry.getKey()%></a>
				<%
				}
				%>

			</div>
      
     </article>

		<%
		if(yourTotalOrders == 0) {
		%>

		<section class="empty">

			<img alt="" src="<%=request.getContextPath() + "/imgs/dog3.jpg"%>">
			<p>No Orders Yet.</p>

		</section>


		<%
		return;
		}
		%>
		
		
		<!-- Display Orders -->
		
		
		<section class="order-list-wrapper mt-3">
		   
		    
		    <%
		    IOrderItemDao orderItemDao =  new OrderItemImpl();
		    MenuItemDAO menuItemDAO =  new MenuItemsImp();
		    UsersDao usersDao =  new UsersDaoImp();
		    for(Orders order : yourOrders)
		    {
		    	OrderItems orderItem  = orderItemDao.getById(order.getOrderId());
		    	MenuItems menuItem = menuItemDAO.getItemById(orderItem.getItemId());
		    	Users user = usersDao.getUser(order.getUserId());
		    	
		    	  %>
		    	   
		    	   <div class="order-item">
		    	        
		    	       <%
		    	         int nextStatus = status.indexOf(order.getStatus()) +1;
		    	         
		    	       %> 
		    	   
		    	      <div class="order-item-footer">
		    	         <%
		    	          if(order.getStatus().equalsIgnoreCase("delivered") || order.getStatus().equalsIgnoreCase("out for delivery") || order.getStatus().equalsIgnoreCase("Prepared"))
		    	          {
		    	        	  %>
		    	        	   <button class="status"><%=order.getStatus() %></button>
		    	        	  <%
		    	        	   
		    	          }else{
		    	        	  %>
		    	        	   <button class="status" onclick="handleStuatusBtnClick('<%=request.getContextPath()+"/order/status?status="+status.get(nextStatus)+"&orderId="+order.getOrderId()%>')"><%=status1.get(nextStatus) %></button>
		    	        	  <%
		    	          }
		    	         %>
		    	      
		    	        <span class="quantity">Quantity: <%=orderItem.getQuantity() %></span>
		    	      </div>
		    	    
		    	      <img alt="" src="<%=menuItem.getImg()%>">
		    	      <div class="menu-details">
		    	        <h6 class="item-name"><%=menuItem.getName() %></h6>
		    	        <h6 class="item-price"><i class="ri-money-rupee-circle-fill"></i> <%=orderItem.getPrice() %></h6>
		    	      </div>
		    	      
		    	      <div class="shiping-details">
		    	        <h4>Shipping Details</h4>
		    	        <h6>Ordered By :<%=user.getName()%> </h6>
		    	        <h6>Total Amount : <%=order.getTotalAmount() %></h6>
		    	         <h6>Payment Mode : <%=order.getPay_mode().toUpperCase() %></h6>
		    	        <h6>Delivery Address : <%=order.getDeliveryAddress() %></h6>
		    	        
		    	      </div>
		    	      
		    	      <%
		    	        if(order.getPickedBy()!=0)
		    	        {
		    	        	DeliveryDAO deliveryDAO =  new DeliveryDAOImp();
		    	        	DeliveryPartnersDAO deliveryPartnersDAO =  new DeliveryPartnersDaoImpl();
		    	        	DeliveryPartners deliveryPartners =  deliveryPartnersDAO.getDeliveryPartners(order.getPickedBy());
		    	        	Deliveries delivery = deliveryDAO.getDeliveryByOrderId(order.getOrderId());
		    	        	%>
		    	        	
		    	        	 <div class="picker-details">
		    	        	   <h4>Delivery Agent</h4>
		    	        	   <h6><i class="ri-user-fill"></i><%=deliveryPartners.getName() %></h6>
		    	        	   <h6>Picked At : <%=delivery.getAssignedAt().toString() %></h6>
		    	        	   <h6><i class="ri-motorbike-fill"></i> <%=deliveryPartners.getVehicleDetails() %></h6>
		    	        	   <h6><i class="ri-phone-fill"></i> <%=deliveryPartners.getPhoneNumber() %></h6>
		    	        	 </div>
		    	        	
		    	        	<%
		    	        }
		    	      %>
		    	   
		    	   </div>
		    	  
		    	  
		    	  <%
		      }
		    
		    %>

		</section>
		
		<%
		int noOfPages = (int) Math.ceil((double) yourTotalOrders / limit);
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
	
	<%@include file="/utils/Alerts.jsp" %>
	
	<script type="text/javascript">
	
	
	function handleStuatusBtnClick(url)
	{
		event.stopPropagation();
		   
		 //  window.location.href = "http://localhost:8080"+url
		   fetch("<%=AppProperties.get("SERVER_URL")%>" + url, {
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
			    	 window.location.href =  "<%=AppProperties.get("SERVER_URL")%>/Swiggy/restaurant/SignIn.jsp";
			       }
			     else if(data === "success")
			       {
			    	 showSuccessAlert("Status updated successfully")
			     	setTimeout(()=>{
			     	  window.location.reload() 
			     	},1000)
			       }
			     else{
			    	 showAlert("Failed to update status ")
			     }
			   })
			   .catch((error) => {
			     console.log("Error: " + error.message); 
			   });
	}
	
	
	
	</script>

</body>
</html>










