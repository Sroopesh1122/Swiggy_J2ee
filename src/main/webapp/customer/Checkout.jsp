<%@page import="com.swiggy.dao.impl.MenuItemsImp"%>
<%@page import="com.swiggy.dao.MenuItemDAO"%>
<%@page import="com.swiggy.dto.MenuItems"%>
<%@page import="com.swiggy.dto.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/customer/CustomerSession.jsp" %> 
   
   <% 
      
     if(user ==null)
     {
    	 response.sendRedirect(request.getContextPath()+"/customer/SignIn.jsp");
    	 return;
     }
     request.setAttribute("menu", "");
     
     
     CartDAO cartDAO =  new CartDaoImp();
     List<Cart> cartItems = cartDAO.getAllCarts(user.getUserId()); 
     if(cartItems.size() == 0)
     {
    	 response.sendRedirect(request.getContextPath()+"/customer/Cart.jsp");
    	 return;
     }
   %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout </title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>

<style type="text/css">
    body {
	width: 100%;
	font-family: "outfit", sans-serif;
	max-width: 1800px;
	margin: 0 auto;
	padding:20px 0px;	
}

.checkout-wrapper{
  display: flex;
  justify-content:flex-start;
  align-items: flex-start; 
  flex-direction: column;
}

.checkout-list {
  width: min(80%, 600px); 
  margin: 0 auto; /* Centers the element horizontally */
  background: white;
  display: grid;
  padding: 10px;
  box-shadow: 1px 2px 5px #efefef !important;
  
}

.checkout-list-item{
  padding:5px;
  display: grid;
  grid-template-columns: repeat(4, 1fr); /* Creates 4 equal-width columns */
  gap: 16px; /* Adds spacing between grid items */
  place-items:center;
  border-bottom: 1px solid #efefef !important;
 
}

.list-header{
 
 background: #feb80a;
 border-radius: 10px;
 
}

.cart-img{
 width: 60px;
 height: 60px;
 border-radius: 10px;
}

.cart-item-name{
 font-size: 0.8rem;
}

.shipping-details{
 width: min(80%, 600px); 
  margin: 0 auto; /* Centers the element horizontally */
  
}

.shipping-details textarea {
	width: 100%;
	outline: none;
	border: 0.1rem solid #efefef;
	border-radius: 10px;
	padding: 10px;
}
.shipping-details span{
 font-size: 0.8rem;
}

.shipping-details-wrapper{
 display: flex;
 justify-content: flex-start;
 align-items: center;
}

.custom-checkbox{
 width: 20px;
 height: 20px;
 border: 1px solid #efefef;
 margin-left: 2px;
 cursor: pointer;
 border-radius: 5px;
 overflow: hidden;
 position: relative;
}
.check-box-i{
 position: absolute;
 width: 100%;
 height: 100%;
 display: flex;
 justify-content: center;
 align-items: center;
 color: #feb80a;
}

.close-check{
 display: none;
}

.payment-option-select{
 width: 100%;
 outline: none;
 padding: 5px 2px;
 border-radius: 8px;
 border: 1px solid #efefef;
}

.payment-footer{
 width: 100%;
 display: flex;
 justify-content: center;
 align-items: center;
}

#place-order-btn{
 border: none;
 padding: 5px 10px;
 border-radius: 10px;
 font-size: 0.85rem;
 background: #feb80a;
}




</style>
</head>
<body>
 <%@include file="/customer/Navbar.jsp"%>
 
 <form class="checkout-wrapper" action="<%=request.getContextPath()+"/user/cart/order" %>" id="checkout-form" method="post">
   
      <article class="checkout-list">
         
         <h3>Checkout Details</h3>
         
         <div class="checkout-list-item list-header">
           <span>Product</span>
           <span>Quantity</span>
           <span>Price</span>
           <span>Total</span>
         </div>
         
         
         
         <%
         
         MenuItemDAO menuItemDAO = new MenuItemsImp();
         
         int totalQuantity = 0;
         double totalPrice=0;
         
         for(Cart cart : cartItems)
         {
        	 MenuItems item = menuItemDAO.getItemById(cart.getMenuId());
        	 totalQuantity+=Integer.parseInt(request.getParameter(item.getItemId()+""));
        	 totalPrice += Integer.parseInt(request.getParameter(item.getItemId()+"")) * item.getPrice();
        	 %>
        	     <div class="checkout-list-item">
        	      <input type="hidden" name="<%=item.getItemId()%>" value="<%=Integer.parseInt(request.getParameter(item.getItemId()+""))%>">
                   <span>
                     <img alt="" src="<%=item.getImg()%>" class="cart-img">
                     <h6 class="cart-item-name"><%=item.getName() %></h6>
                   </span>
                   <span><%=request.getParameter(item.getItemId()+"") %></span>
                   <span><%=item.getPrice() %></span>
                   <span><%=Integer.parseInt(request.getParameter(item.getItemId()+"")) * item.getPrice()  %></span>
                  </div>  
        	 <%
         }
         
         %>
         
         <div class="checkout-list-item ">
                   <span>
                   </span>
                   <span></span>
                   <span>Q <%=totalQuantity %></span>
                   <span><i class="ri-money-rupee-circle-fill"></i> <%=totalPrice  %></span>
                  </div> 
          
      </article>
      
      <article class="shipping-details mt-3 p-2">
       <h6>Shipping Details</h6>
       <textarea rows="" cols="" name="address" placeholder="Delivery Address" id="delivery-address"></textarea>
        <%
         if(user.getAddress()!=null)
         {
        	 %>
        	   <article class="shipping-details-wrapper">
                 <div class="custom-checkbox" onclick="handleCheckBoxClick()">
                      <i class="ri-checkbox-fill check-box-i close-check " id="address-checkbox"></i>  
                 </div>
                 <span class="ms-1" id="defaultAddress"><%=user.getAddress() %></span>
               </article>
        	 <%
         }
        %>
        
        
        <h6 class="mt-4">Payment Options</h6>
        <select class="payment-option-select" name="payment-option" id="payment-option">
          
           <option value="cod">COD</option>
           <option value="bank">Online Bank</option>
        
        </select>
        
         
         <footer class="payment-footer mt-3">
           
             <button type="button" id="place-order-btn" onclick="handleOrderClick()"> Place Order </button>
         
         </footer> 
       
        
      </article>
 
 
 </form>
 
  <%@include file="/utils/Alerts.jsp" %>
  
 <script type="text/javascript">
 
 function handleCheckBoxClick()
 {
	 $("#address-checkbox").toggleClass("close-check");
if ($("#address-checkbox").hasClass("close-check")) {
		 
		 $("#delivery-address").show();
		 $("#delivery-address").val('')
		 
	  } else {
		    
		  $("#delivery-address").hide();
		  $("#delivery-address").val($("#defaultAddress").text())
		  
	 }
 }
 
 
 function handleOrderClick()
 {
	 
	 let paymentType  = $("#payment-option").val();
	 if(paymentType === "cod")
	  {
		 if($("#delivery-address").val().trim() === "")
		 {
			 showAlert("Delivery Address Required!");
			 return;
			 
		 }
		 
		 $("#checkout-form").submit();
	  }
 }
 
 
 
 
 </script>

</body>
</html>