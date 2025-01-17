<%@page import="com.swiggy.dto.Cart"%>
<%@page import="com.swiggy.dao.impl.CartDaoImp"%>
<%@page import="com.swiggy.dao.CartDAO"%>
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
      
     if(user ==null)
     {
    	 response.sendRedirect(request.getContextPath()+"/customer/SignIn.jsp");
    	 return;
     }
     request.setAttribute("menu", "Cart");
   %>
   
   <%
   
    CartDAO cartDAO =  new CartDaoImp();
    List<Cart> cartItems = cartDAO.getAllCarts(user.getUserId()); 
    int totalCount = cartDAO.getCartItemCountByUser(user.getUserId());
   %>
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@include file="/utils/CommonUtils.jsp"%>
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
 height: fit-content;
}


.menu-item-list-wrapper{
    width:100%; 
    display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap:10px;
	align-content: center;
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

.cart-wrapper{
 width: 100%;
 max-width:1200px;
 margin: 0 auto;
 height: 30vh;
}

.cart-wrapper h2{
 background: #feb80a;
 padding: 10px 20px;
 border-radius: 20px;
 display: flex;
 justify-content: space-between;
 align-items: center;
}
.cart-wrapper h2 span:last-child {
	font-size: 0.98rem;
	padding: 4px 8px;
	background: white;
	border-radius: 10px;
}

.cart-info-wrapper{
 display: flex;
 justify-content: center;
 align-items: flex-start;
 padding: 20px;
}

.cart-list{
 flex: 1;

}

.cart_item{
 display: flex;
 justify-content: space-between;
 align-items: center;
 padding: 10px;
  border: 1px solid #feb80a;
 border-radius: 20px;
 margin-top: 5px;
 position: relative;
 
}
.item-info{
 display: flex;
 justify-content: center;
 align-items: center; 
 gap:4px;
}

.item-info img{
 width: 80px;
 height: 80px;
 border-radius: 15px;
}

.cart-info{
 width: 300px;
 margin-left: 10px;
 padding: 10px;
 
 border:1px solid  #feb80a91;
 box-shadow: 1px 1px 4px  #feb80a91 !important;
 border-radius: 10px;
 
 
}

.cart-info footer{
 display: flex;
 justify-content: center;
 align-items: center;
}

.desc{
 display: flex;
 justify-content: center;
 align-items: flex-start;
 flex-direction: column;
}

.quantity{
 width: 40px;
 text-align: center;
}

.shifter-btn{
 cursor: pointer;
}

.checkout-title{
 font-size: 1.6rem;
}

.quantity-info{
 font-size: 0.9rem;
}
.total-price-info{
 font-size: 1.1rem;
}
.checkout-btn{
 width: 80%;
 background:  #feb80a;
 border: none;
 padding: 4px 6px;
 border-radius: 20px;
}

.mobile-cart-info{
 position: fixed;
 bottom: 0;
 left: 50%;
 transform:translateX(-50%);
 width: 80%;
 
 display: none;
 
}
.mobile-cart-info footer{
 display: flex;
 justify-content: center;
 align-items: center;
}

.cart-item-remove-btn{
 position: absolute;
 bottom: 5px;
 right: 10px;
 cursor: pointer;
}

.confirm-modal{
 display: none;
 position: fixed;
 top:0;
 left:0;
 width: 100%;
 height: 100vh;
 background: #0000006e;
 justify-content: center;
 align-items: center;
 z-index: 1000;
 
}



.modal-wrapper{
 padding: 20px;
 background: white;
 border-radius: 20px;
 min-width: 300px;
}
.modal-wrapper footer{
 display: flex;
 justify-content: flex-start;
 align-items: center;
 gap:10px;
}
.modal-wrapper footer button {
	border: none;
	padding: 5px;
	border-radius: 10px;
}
.modal-wrapper footer button:first-child {
	background: #feb80a;
	
	
}

.modal-wrapper footer button:last-child {
	background: white;
	border: 1px solid #feb80a;
	
}

.modal-open{
 display: flex;
}

@media (width <770px) {
 
  .cart-info{
   width: 250px;
  }
	
}

@media (width <610px) {
 
  .cart-info{
   display: none;
  }
  
  .mobile-cart-info{
   display: block;
   padding: 10px; 
   z-index: 50;
   box-shadow: 2px 4px 5px #efefef !important;
  }
  
  .section-wrapper{
 margin-top: 2vh;
 padding: 8px;
 height: fit-content;
}
	
}

@media (width <450px)
{
  .mobile-cart-info{
   width: 99%;
   padding: 3px;
  }
  
}



</style>

</head>
<body>
<%@include file="/customer/Navbar.jsp"%>

<section class="section-wrapper">
  
  
  
  
  <%
    if(totalCount == 0)
    {
    	%>
    	 
    	 <section class="not-found">
    	    
    	     <p>&#128532; Your  Cart is Empty </p> 
    	 
    	 </section>
    	
    	<%
    	return;
    }
  
  %>
  

  
  <section class="cart-wrapper">
     <h2><span>My Cart</span> <span>Total Items : <%=totalCount %></span></h2>
     
     
     <article class="cart-info-wrapper">
        
        <form id="checkout-form" class="cart-list" method="post" action="<%=request.getContextPath()+"/customer/Checkout.jsp"%>">
           
        <%
          MenuItemDAO menuItemDAO =  new MenuItemsImp();  
          for(Cart cart :cartItems)
          {
             MenuItems  menuItem = menuItemDAO.getItemById(cart.getMenuId());
        	 
             %>
               
                 <div class="cart_item">
                    
                     <i class="ri-delete-bin-line cart-item-remove-btn" onclick=" handleCartRemoveClick('<%=request.getContextPath()+"/user/cart/delete?cartId="+cart.getCartId()%>')"></i>
              
                       <div class="item-info">
                              
                              <img alt="" src="<%=menuItem.getImg() %>">
                               <div class="desc">
                                   <span><%=menuItem.getName() %></span>
                                    <span><i class="ri-money-rupee-circle-fill"></i> <%= menuItem.getPrice() %></span>
                               </div>
                        </div>
               
                        <div class="cart-quantity">
                         <i class="ri-subtract-fill shifter-btn" onclick="handleQuantityDecrease('<%=menuItem.getItemId()%>')"></i>
		                      <input name="<%=menuItem.getItemId()%>" id="<%=menuItem.getItemId()%>" class="quantity" type="number" min=1 data-price="<%=menuItem.getPrice()%>" value=1>
		                 <i class="ri-add-line shifter-btn" onclick="handleQuantityIncrease('<%=menuItem.getItemId()%>')"></i>
		                  </div>
           
                   </div>
            
        
                
             
             <%
          }
        
        %>
        </form>
        <div class="cart-info">
         <h1 class="checkout-title">Checkout Details</h1>
	     
	     <h5 class="quantity-info"> Qunatity : <span id="totalQuantity"></span> </h5>
	      <h5 class="total-price-info" >Total Amount = <span id="totalAmount"></span> </h5>
	      
	      <footer class="mt-5">
	        
	        <button class="checkout-btn" type="button" onclick="openModal()">Checkout</button>
	      
	      </footer>
        
        </div>
     </article>

  </section>
  
  
  
  <article class="mobile-cart-info">
     
         <h1 class="checkout-title">Checkout Details</h1>
	     
	     <h5 class="quantity-info"> Qunatity : <span id="mobiletotalQuantity"></span> </h5>
	      <h5 class="total-price-info" >Total Amount = <span id="mobiletotalAmount"></span> </h5>
	      
	      <footer class="mt-5">
	        
	        <button class="checkout-btn" type="button" onclick="openModal()">Checkout</button>
	      
	      </footer>
        
       
  
  </article>
  
</section>



<section class="confirm-modal" onclick="closeModal()">

    <article class="modal-wrapper" onclick="stopPropagationToParent(event)">
     <p>Confirm Checkout .</p>
     
      <footer>
          <button onclick="handleCheckoutClick()">Checkout</button>
          <button onclick="closeModal()">Cancel</button>
      </footer>
      
    </article>
  

</section>



<%@include file="/utils/Alerts.jsp" %>

<script type="text/javascript">
   
   
  
   function handleMenuItemClick(url)
   {
	   window.location.href = url;
   }
   
   function handleFoodSavedClick()
   {
	   event.stopPropagation();
   }
   
   function handleCartRemoveClick(url)
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
			  
		     if(data === "success")
		       {
		    	 showSuccessAlert("Item Removed from cart")
		     	setTimeout(()=>{
		     	  window.location.reload() 
		     	},500)
		       }
		     else{
		    	 showAlert("Failed To Remove Item")
		     }
		   })
		   .catch((error) => {
		     console.log("Error: " + error.message); 
		   });
 
	   
   }
   
   
   $(document).ready(function() {

		$(".quantity").each((index, ele) => {

			calculateTotalQuantityAndPrice()
			$(ele).on("keydown", (e) => {
				const allowedKeys = [
					"Backspace",
					"Delete",
				];
				if (
					!(e.key >= "0" && e.key <= "9") &&
					!allowedKeys.includes(e.key)
				) {
					e.preventDefault();
				}
			});
		});
		


		$(".quantity").each((index, ele) => {
			$(ele).on("input", (e) => {
				calculateTotalQuantityAndPrice()
			});
		});



	})

	function handleQuantityIncrease(ele) {
		const inputElement = $('#' + ele);
		const prevVal = parseInt(inputElement.val(), 10) || 1;

		inputElement.val(prevVal + 1);
		calculateTotalQuantityAndPrice()
	}

	function handleQuantityDecrease(ele) {

		const inputElement = $('#' + ele);
		const prevVal = parseInt(inputElement.val(), 10) || 1;

		if (prevVal > 1) {
			inputElement.val(prevVal - 1);
			calculateTotalQuantityAndPrice();
		}
	}

	function calculateTotalQuantityAndPrice() {
		let totalQuantity = 0;
		let totalPrice = 0;

		$(".quantity").each((index, ele) => {
			totalQuantity += parseInt($(ele).val())
			totalPrice += parseInt($(ele).val()) * parseInt($(ele).data("price"))
		});


		$("#totalQuantity").text(totalQuantity)
		$("#mobiletotalQuantity").text(totalQuantity)
		$("#totalAmount").html('<i class="ri-money-rupee-circle-line"></i>' + totalPrice)
		$("#mobiletotalAmount").html('<i class="ri-money-rupee-circle-line"></i>' + totalPrice)
	}
	
	
	function closeModal(){
		$(".confirm-modal").removeClass("modal-open")
		
	}
	
	function openModal(){
		$(".confirm-modal").addClass("modal-open")
		
	}
	
	
	function stopPropagationToParent(event)
	{
		event.stopPropagation()
	}
	
	
	function  handleCheckoutClick(){
		 
		$("#checkout-form").submit();
		
	}

</script>

</body>
</html>