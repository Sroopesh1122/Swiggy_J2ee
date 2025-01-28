<%@page import="com.swiggy.dto.Restaurants"%>
<%@page import="com.swiggy.dao.impl.RestaurantsDaoImp"%>
<%@page import="com.swiggy.dao.RestaurantsDao"%>
<%@page import="com.swiggy.dao.impl.MenuItemsImp"%>
<%@page import="com.swiggy.dao.MenuItemDAO"%>
<%@page import="com.swiggy.dto.MenuItems"%>
<%@page import="com.swiggy.dto.OrderItems"%>
<%@page import="com.swiggy.dao.impl.OrderItemImpl"%>
<%@page import="com.swiggy.dao.IOrderItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/customer/CustomerSession.jsp" %> 
   
   <% 
      
     if(user ==null)
     {
    	 response.sendRedirect(request.getContextPath()+"/customer/SignIn.jsp");
    	 return;
     }
    int  orderId = request.getParameter("orderId")!=null ? Integer.parseInt(request.getParameter("orderId")) : -1;
    if(orderId ==-1)
    {
    	response.sendRedirect(request.getContextPath()+"/customer/Home.jsp");
   	    return;
    }
    MenuItemDAO menuItemDAO =  new MenuItemsImp();
    IOrderItemDao orderItemDao =  new OrderItemImpl();
    RestaurantsDao restaurantsDao =  new RestaurantsDaoImp();
    
    OrderItems orderItem = orderItemDao.getById(orderId);
    MenuItems menuItem = menuItemDAO.getItemById(orderItem.getItemId());
    Restaurants restaurant =  restaurantsDao.getRestaurant(menuItem.getRestaurantId());
    
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/imgs/icon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>

<style type="text/css">
   
   body {
	 min-height: 100vh;
	 display: flex;
	 justify-content: center;
	 align-items: center;
	 font-family: "outfit",sans-serif;
	 max-width: 1800px;
	 margin: 0 auto;
  }
  
  .wrapper{
   width: min(90%,400px);
   margin: 0 auto;
   box-shadow: 1px 2px 5px #efefef !important;
   border: 1px solid #efefef ;
   padding: 10px;
   border-radius: 10px;
  }
  .section-title{
   font-size: 1.5rem;
   padding: 5px;
   background: #feb80a;
   border-radius: 10px;
  }
  
  .review-item-details img{
   width: 80px;
   height: 80px;
   border-radius: 10px;
  }
  #coment-input{
   width: 100%;
   border: 1px solid #efefef;
   outline: none;
   font-size: 0.8rem;
   padding: 5px;
  }
  
  footer{
   display: flex;
   justify-content: center;
   align-items: center;
   width: 100%;
   margin-top: 10px;
  }
  
  .submit-btn{
   width: 90%;
   border: none;
   outline: none;
   background: #feb80a;
   font-size: 0.95rem;
   padding: 5px 0px;
   border-radius: 10px;
  
  }
  
  
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

</style>

</head>
<body >

   <aside class="confirm-modal close" onclick="handleModalClose()">
      
       <div class="modal-wrapper" onclick="stopPropagationToParent(event)">
         <p>Are your sure want to submit review?</p>
          
          <div class="modal-footer">
             
             <button class="confirm-btn" onclick="handleSubmitConfirm()">Submit</button>
             <button class="cancel-btn" onclick="handleModalClose()"> Cancel</button>
             
          </div> 
        
         
       </div>
   
   </aside>

   <form class="wrapper" id="review-form" method="post" action="<%=request.getContextPath()+"/user/review"%>">
     
     <h3 class="section-title">Leave Your Review</h3>
     <input type="hidden" name="orderId" value="<%=orderId%>">
     <input type="hidden" name="rating" id="rating">
     <article class="review-item-details">
       <img alt="" src="<%=menuItem.getImg()%>">
        <h6><%=menuItem.getName() %></h6>
        <h6>Restaurant : <%=restaurant.getName() %></h6>
     </article>
     
     <article>
       <h6>Comment : </h6>
       
       <textarea rows="" id="coment-input" name="comment"></textarea>
       
       <h6 class="mt-1">Rating:</h6>
       <%@include file="/utils/Rating.jsp" %>
       
        <%@include file="/utils/Alerts.jsp" %>
        
     
     </article>
     
     <footer>
     
            <button class="submit-btn" type="button" onclick="handleModalOpen(this)">Submit</button>
      
     </footer>
     
   
   </form>


	<script type="text/javascript">
		function stopPropagationToParent(event) {
			event.stopPropagation()
		}
		function handleModalClose() {
			$(".confirm-modal").addClass("close");
		}

		function handleModalOpen(event) {
			$(".confirm-modal").removeClass("close");
		}
		
		function handleSubmitConfirm()
		{
			if($("#rating").val() === "0" || $("#rating").val()==="" )
		     {
			   showAlert("Rating must be greater than 0");
			   return;
			 }
			
			if($("#coment-input").val().trim() === "")
		     {
			   showAlert("Comment is Required");
			   return;
			 }
			
			 $("#review-form").submit();
			
		}
	</script>

</body>
</html>






