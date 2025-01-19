<%@page import="com.swiggy.dto.Users"%>
<%@page import="com.swiggy.dao.impl.CartDaoImp"%>
<%@page import="com.swiggy.dao.CartDAO"%>
<%
 
String selectedMenu = request.getAttribute("menu")!=null ? (String) request.getAttribute("menu")  : "none";

CartDAO cartDAO1 =  new CartDaoImp();

Users customer = (Users) session.getAttribute("users");

int cartItemCount = customer!=null ?cartDAO1.getCartItemCountByUser(customer.getUserId()) :0;

%>

<style type="text/css">

 .desktop-navbar{
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 5px 15px;;
 }
 
 li{
  list-style: none;
 } 
 
 .desktop-navbar .menu{
  display: flex;
  justify-content: flex-end;
  align-items: center;
  gap:10px;
 }
 
 .desktop-navbar .menu li a{
  color: black;
  padding: 4px 10px;
  border-radius: 8px;
 }
 
 .desktop-menu-active{
  background: #feb80a;
  color: white black;
 }
 
 .desktop-navbar .nav-brand{
  display: flex;
  justify-content: flex-start;
  align-items: center;
  gap:10px;
 }
 .desktop-navbar .nav-brand img{
  width: 50px;
  height: 50px;
 }
 
 .desktop-navbar .nav-brand .nav-title
 {
  font-size: 2rem;
 }
 
 .menu-sider{
  z-index: 999;
 }
 
 #menu-btn , .menu-sider{
  display: none;
 }
 .menu-sider .menu li{
  width: 100%;
  text-align: center;
  margin-top: 20px;
 }
 .menu-sider .menu li a{
   color: black;
   padding: 8px 10px;
   border-radius: 15px;
   position: relative;
 }
 
 .cart-nav-item{
   position: relative;
  
 }
 
 .cart-badge{
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 5px;
  position: absolute;
  top:-10px;
  right:-5px;
  background:white;
  border:1px solid #feb80a;
  font-size: 0.7rem;
  width: 18px;
  height: 18px;
  color: black;
  border-radius: 50%;
  box-shadow: 0px 1px 2px black !important;
 }  
 
 @media (width < 830px) {
 
  #menu-btn{
  display: block;
 }
 
 .desktop-navbar .menu{
  display: none;
 }
 
 .menu-sider{
  display: block;
  position: fixed;
  top: 0;
  right: 0;
  height: 100vh;
  width: 300px;
  background: white;
  padding: 20px;
  transition: all 1s;
  border-left: 1px solid #efefef;
 }
 
 .menu-sider-close
 {
  right: -100%
 }
 
 .menu-close-btn{
  position: absolute;
  top: 5px;
  left: 5px;
 }
 
	
}


</style>


<nav class="desktop-navbar">
 
  <div class="nav-brand">
    <img alt="" src="<%=request.getContextPath()+"/imgs/cheif.png"%>"> <span class="nav-title">FooD</span>
  </div>
  
  <ul class="menu">
     
     <li><a href="<%=request.getContextPath()+"/customer/Home.jsp"%>" class="<%= selectedMenu.equals("Home") ? "desktop-menu-active" : ""%>"><i class="ri-home-4-line"></i> Home</a></li>
     <li><a href="<%=request.getContextPath()+"/customer/Menu.jsp"%>" class="<%= selectedMenu.equals("Menu") ? "desktop-menu-active" : ""%>"><i class="ri-restaurant-line"></i> Menu</a></li>
     
     <%
      if(session.getAttribute("users")!=null)
      {
    	  %>
    	  <li><a href="<%= request.getContextPath()+"/customer/Profile.jsp"%>"><i class="fa-regular fa-user"></i> Profile</a></li>
    	  
    	  
    	     <li><a href="<%= request.getContextPath()+"/customer/Cart.jsp"%>" class="cart-nav-item <%= selectedMenu.equals("Cart") ? "desktop-menu-active" : ""%>"><i class="ri-shopping-cart-line"></i>Cart
    	      <% 
                 if(cartItemCount > 0)
                  {
                     %>
                        <span class="cart-badge"><%=cartItemCount > 99 ? "99+" : cartItemCount %></span>
                      <%	
                   }
               %>
    	     
    	     </a></li>
          <li><a href="#" class="<%= selectedMenu.equals("Orders") ? "desktop-menu-active" : ""%>"><i class="ri-shopping-bag-line"></i> Orders</a></li>
          <li><a href="#"><i class="ri-logout-box-line"></i> Logout</a></li>
    	  <%
    	  
      }else{
    	  %>
    	    <li><a href="<%= request.getContextPath()+"/customer/SignIn.jsp"%>" class=""><i class="ri-login-box-line"></i>Sign In</a></li>
    	  <% 
      }
     
     %>
     
  
  </ul>
  <span id="menu-btn" onclick="handleMenuBarClick()"><i class="ri-menu-line"></i></span>
</nav>
  
  <div class="menu-sider menu-sider-close ">
     
     <span id="menu-close-btn" onclick="handleMenuCloseClick()"> <i class="ri-close-line"></i></span>
     
     <ul class="menu">
     <li><a href="#" class="desktop-menu-active"><i class="ri-home-4-line"></i> Home</a></li>
     <li><a href="<%= request.getContextPath()+"/customer/Profile.jsp"%>"><i class="fa-regular fa-user"></i> Profile</a></li>
     <li><a href="#"><i class="ri-restaurant-line"></i> Menu</a></li>
     <li><a href="#" class="cart-nav-item"><i class="ri-shopping-cart-line"></i> Cart
     <% 
        if(cartItemCount > 0)
        {
        %>
          <span class="cart-badge"><%=cartItemCount > 99 ? "99+" : cartItemCount %></span>
        <%	
        }
      %>
     
     </a></li>
     
     <li><a href="#"><i class="ri-shopping-bag-line"></i> Orders</a></li>
     <li><a href="#"><i class="ri-logout-box-line"></i> Logout</a></li>
  
    </ul> 
  
 
  </div>
  
  <script type="text/javascript">
      
      function handleMenuBarClick()
      {
    	  $(".menu-sider").removeClass("menu-sider-close")
      }
      
      function handleMenuCloseClick()
      {
    	  $(".menu-sider").addClass("menu-sider-close") 
      }
      
  
  </script>


