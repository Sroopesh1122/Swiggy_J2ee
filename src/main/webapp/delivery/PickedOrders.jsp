<%@page import="com.app.utils.AppProperties"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.swiggy.dto.Deliveries"%>
<%@page import="com.swiggy.dao.impl.DeliveryDAOImp"%>
<%@page import="com.swiggy.dao.DeliveryDAO"%>
<%@page import="com.swiggy.dto.MenuItems"%>
<%@page import="com.swiggy.dto.OrderItems"%>
<%@page import="com.swiggy.dto.Restaurants"%>
<%@page import="com.swiggy.dao.impl.RestaurantsDaoImp"%>
<%@page import="com.swiggy.dao.RestaurantsDao"%>
<%@page import="com.swiggy.dao.UsersDao"%>
<%@page import="com.swiggy.dao.impl.UsersDaoImp"%>
<%@page import="com.swiggy.dto.Users"%>
<%@page import="com.swiggy.dao.impl.MenuItemsImp"%>
<%@page import="com.swiggy.dao.MenuItemDAO"%>
<%@page import="com.swiggy.dao.impl.OrderItemImpl"%>
<%@page import="com.swiggy.dao.IOrderItemDao"%>
<%@page import="com.swiggy.dao.impl.OrderDAOImp"%>
<%@page import="com.swiggy.dao.OrderDAO"%>
<%@page import="com.swiggy.dto.Orders"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/delivery/DeliveryPartnerSession.jsp" %>    
 <%
  request.setAttribute("menu", "My Orders");
  
  if(deliveryPartners == null)
  {
	  response.sendRedirect(request.getContextPath()+"/delivery/SignIn.jsp");
	  return;
  }
 
  String status = request.getParameter("status")!=null ? request.getParameter("status") : "Out For Delivery";
  int currentPage = request.getParameter("page")!=null ? Integer.parseInt(request.getParameter("page"))   : 1;
  int limit = request.getParameter("limit")!=null ? Integer.parseInt(request.getParameter("limit"))   : 10;
  
  OrderDAO orderDAO =  new OrderDAOImp();
  List<Orders> ordersToDeliver = orderDAO.getOrderdByStatus(status, deliveryPartners.getPartnerId(),currentPage, limit);
  int totalOrderCount = orderDAO.getOrderdCountByStatus(status, deliveryPartners.getPartnerId());
  
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp" %>

<style type="text/css">
body {
	font-family: "outfit", sans-serif;
	padding: 20px 0px;
	width: 100%;
	max-width: 1800px;
	margin: 0 auto;
}

.section-wrapper{
 width: min(95%,1000px);
 margin: 0 auto;
}

.category-section {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	width: 100%;
}

.category-section span{
 font-size: 0.8rem;
}

.category-tag{
 padding: 2px 5px;
 font-size: 0.75rem;
 margin: 0px 2px;
 border: 1px solid #ff933a;
 border-radius: 20px;
 cursor: pointer;
 color: black !important;
}

.category-tag-active{
 background: #ff933a;
 color: white !important;
}


.error-section-1 {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 80vh;
	flex-direction: column;
}
.detective-dog{
 width: 120px;
 height: 120px;
}

.error-section-1 p{
 font-size: 1.3rem;
}

.order-list-wrapper{
 width: min(95%,1000px);
 padding: 5px;
 margin: 0 auto;
 margin-top: 20px;
}

.order-item
{
  padding: 10px;
  border: 1px solid #efefef;
  box-shadow: 1px 1px 2px #efefef !important;
  border-radius: 10px;
  position: relative; 
}

.pick-btn
{
 position: absolute;
 top:10px;
 right: 10px;
 font-size: 0.8rem;
 padding: 3px 9px;
 border-radius: 20px;
 border: none;
 outline: none;
 background: white;
 border: 1px solid #ff933a;
}

.delivered-done{
  position: absolute;
 top:10px;
 right: 10px;
 font-size: 0.7rem;
 padding: 3px 9px;
 border-radius: 20px;
 background: white;
 color: green;
 border: 1px solid green;
}

.pick-btn:hover{
 background: #ff933a;
 color: white;
}

h6{
 margin-bottom: 2px;
}

.order-item img{
 width: 80px;
 height: 80px;
 border-radius: 10px;
}
.food-details{
 margin: 5px 0px;
 width: fit-content;
 padding: 3px;
 border-radius: 10px;
 background: #efefef;
}
.food-details h6
{
 font-size: 0.7rem;
}

.ordered-details{
 margin-top: 10px;
 background: white;
 border: 1px solid #ededed;
 padding: 3px;
 border-radius: 10px;
}

.ordered-details h6{
 font-size: 0.85rem;
}

/* CSS fo pagination */

.pagination{
  gap:10px;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
}

.pagination .pagination-btn{
 padding: 3px;
 width:40px;
 font-size: 0.89rem;
 border: 0.1rem solid #efefef;
 background: #efefef;
 border-radius: 8px;
 color: black;;
 cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
}

.pagination .active{
 background: #ff933a;
 color: black !important;
}




  /* Modal Css */
  
  
   .confirm-modal{
   position: fixed;
   top: 0;
   left: 0;
   background: rgba(0,0,0,0.5);
   width: 100%;
   height: 100%;
   display: flex;
   justify-content: center;
   align-items: center;
  }
  
  .modal-wrapper{
   padding: 20px;
   background: white;
   border-radius: 10px;
   width: 300px;
  }
  
  .modal-footer button{
   border: none;
   font-size: 0.8rem;
   padding: 5px;
   border-radius: 10px;
  }
  
  .close{
   display: none;
  }
  .confirm-btn{
   background: #feb80a;
   
  }
  
  .modal-input{
   width: 100%;
   border-radius: 20px;
   border: 1px solid #efefef;
   box-shadow: 1px 1px 2px #efefef !important;
   
  }
  .modal-input input{
   border: none;
   outline: none;
   font-size: 0.85rem;
  }


</style>
</head>
<body>
<%@include file="/delivery/Navbar.jsp" %>
 
 <section class="section-wrapper">
 
    <article class="category-section">
      <span> Filter : </span>
       <a href="<%=request.getContextPath()+"/delivery/PickedOrders.jsp?status=Out For Delivery" %>" class="category-tag <%=status.equalsIgnoreCase("Out for delivery") ? "category-tag-active" : ""%>">Pending</a>
       <a href="<%=request.getContextPath()+"/delivery/PickedOrders.jsp?status=Delivered" %>" class="category-tag <%=status.equalsIgnoreCase("Delivered") ? "category-tag-active" : ""%>">Delivered</a>
    </article> 
   
   
   <%
    
   if(totalOrderCount == 0)
   {
	   %>
	     
	     <article class="error-section-1">
	      
	       <img class="detective-dog" alt="" src="<%=request.getContextPath()+"/imgs/detective-dog.png"%>">
	        	  
	        	   <p>No Orders Found .</p>   
	        	  
	                       
	     </article>
	     
	   
	   <%
	   return;
   }
   
   %>
   
   
   
   <section class="order-list-wrapper">
      
      <%
      IOrderItemDao orderItemDao =  new OrderItemImpl();
	  MenuItemDAO menuItemDAO =  new MenuItemsImp();
	  UsersDao usersDao =  new UsersDaoImp();
	  RestaurantsDao restaurantsDao =  new RestaurantsDaoImp();
	  
      
      for(Orders order :ordersToDeliver)
      {
    	  Restaurants restaurant = restaurantsDao.getRestaurant(order.getRestaurantId());
    	  Users user  = usersDao.getUser(order.getUserId());
    	  OrderItems orderItem = orderItemDao.getById(order.getOrderId());
    	  MenuItems menuItem = menuItemDAO.getItemById(orderItem.getItemId());
    	  DeliveryDAO deliveryDAO = new DeliveryDAOImp();
    	  Deliveries delivery = deliveryDAO.getDeliveryByOrderId(order.getOrderId());
    	  SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy, hh:mm:ss a");
    	  %>

			<article class="order-item">

               <%
                if(!order.getStatus().equals("Delivered"))
                {
                	%>
                	  <button class="pick-btn" onclick=" handleModalOpen('<%=request.getContextPath()+"/food/delivered?orderId="+order.getOrderId()%>')">Mark As Delivered</button>
                	  
                	<% 
                }else{
                	%>
                	 
                	 <span class="delivered-done"><i class="ri-checkbox-circle-fill"></i> Delivered On : <%=dateFormat.format(delivery.getDeliveredAt()) %></span>
                	 
                	<%
                }
               %>
				
				<img alt=""
					src="<%=menuItem.getImg()%>">

				<div class="food-details">
					<h6><%=menuItem.getName() %></h6>
					<h6>
						<i class="ri-money-rupee-circle-fill"></i> <%=orderItem.getPrice() %>
					</h6>
					<h6>
						<i class="ri-hotel-line"></i> <%=restaurant.getName() %>
					</h6>
				</div>
				<div class="ordered-details">
					<h6><i class="ri-user-line"></i> <%=user.getName() %></h6>
					<h6>
						<i class="ri-map-pin-line"></i> <%=order.getDeliveryAddress() %>
					</h6>
					<h6>
						<i class="ri-phone-line"></i> <%=user.getPhoneNumber() %>
					</h6>
					<h6>Payment_mode : <%=order.getPay_mode() %></h6>
					
				</div>


			</article>


			<%
			}
			%>
      
   
   </section>
   <%-- <%
		int noOfPages = (int) Math.ceil((double) totalOrderCount/ limit);
		int startPage = Math.max(1, currentPage - 2);
		int endPage = Math.min(noOfPages, currentPage + 2);
	%>
  <div class="pagination center my-4">

			<%
			if (currentPage > 1) {
			%>
			<a class="pagination-btn center" href="<%=request.getContextPath()+"/delivery/Orders.jsp?page="+(currentPage-1)+"&limit="+limit+"&q="+q%>">Prev</a>
			
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
			           <a class="pagination-btn center" href="<%=request.getContextPath()+"/delivery/Orders.jsp?page="+(i)+"&limit="+limit+"&q="+q%>" ><%=i%></a>
			    <%
				}

			}
			%>
			<%
			if (currentPage < noOfPages) {
			%>
			<a class="pagination-btn center" href="<%=request.getContextPath()+"/delivery/Orders.jsp?page="+(currentPage+1)+"&limit="+limit+"&q="+q%>">Next</a>
			<%
			}
			%>
		</div> --%>
		
		<%@include file="/utils/Alerts.jsp" %>		
   
   

 </section>


	<aside class="confirm-modal close" onclick="handleModalClose()">
		<div class="modal-wrapper" onclick="stopPropagationToParent(event)">
			<p>Enter the delivery Code</p>
			<div class="modal-input">
				<input placeholder="Delivey Code" id="delivery-code" type="text">
			</div>
			<div class="modal-footer mt-4">
				<button class="confirm-btn" onclick="handleSubmitConfirm()"> Submit </button>
				<button class="cancel-btn" onclick="handleModalClose()"> Cancel </button>
			</div>
		</div>
	</aside>


	<%@include file="/utils/Alerts.jsp" %>
 
 <script type="text/javascript">
 
    let url = "";
 
    function stopPropagationToParent(event) {
		event.stopPropagation()
	}
	function handleModalClose() {
		$(".confirm-modal").addClass("close");
		 url=""
		 $("#delivery-code").val("")
	}

	function handleModalOpen(val) {
		$(".confirm-modal").removeClass("close");
	    url=val;
	}
	
	function handleSubmitConfirm()
	{
		if($("#delivery-code").val().trim() === "" )
	     {
		   showAlert("Delivery Code Required!");
		   return;
		 }
	
		
		fetch("<%=AppProperties.get("SERVER_URL")%>" + url+"&code="+$("#delivery-code").val(), {
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
				  
			     if(data === "Success")
			       {
			    	 showSuccessAlert("Order Delivered Successfully")
			     	setTimeout(()=>{
			     	  window.location.reload() 
			     	},500)
			       }
			     else if(data === "login")
			       {
			    	  
			    	 showAlert("Please Login")
			    	 
			       }
			     else if(data === "Invalid Code")
			       {
			    	  
			    	 showAlert("Invalid Delivery Code")
			    	 
			       }
			     else{
			    	 showAlert("Failed To Add Order")
			     }
			   })
			   .catch((error) => {
			     console.log("Error: " + error.message); 
			   }); 
		
		 
				
	}
	
 
 
 
 function handlePickBtnClick(url)
 {
	 event.stopPropagation();
	 
	//  window.location.href = "http://localhost:8080"+url
	
	 
	  
 }
 

 </script>
 
 
 
</body>
</html> 