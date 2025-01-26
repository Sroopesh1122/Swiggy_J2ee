
<%
 
String selectedMenu = request.getAttribute("menu")!=null ? (String) request.getAttribute("menu")  : "none";

%>


<!-- #ff933a -->

<style type="text/css">

 .desktop-navbar{
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 5px 15px;
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
  background: #ff933a;
  color: black;
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
 
 
  .logout-btn {
	cursor: pointer;
}

.logout-modal {
	position: fixed;
	top: 0;
	left: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100vh;
	background: rgba(0, 0, 0, 0.7);
	z-index: 1000;
}

.logout-modal-wrapper {
	background: white;
	padding: 20px;
	border-radius: 20px;
	min-width: 290px;
}

.logout-modal-wrapper footer {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	gap: 10px;
}

.logout-modal-wrapper footer button {
	border: none;
	padding: 5px;
	font-size: 0.8rem;
	border-radius: 10px;
}

.logout-modal-wrapper footer button:first-child{
 
 background: #ff933a;
 
}

.remove-overflow {
	overflow: hidden;
}

.hide {
	display: none;
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
    <img alt="" src="https://i.pinimg.com/474x/28/1f/b2/281fb27c747c2cf1cc41819356978801.jpg"> <span class="nav-title">Delivery</span>
  </div>
  
  <ul class="menu">
     
     <li><a href="<%=request.getContextPath()+"/delivery/Home.jsp"%>" class="<%= selectedMenu.equals("Home") ? "desktop-menu-active" : ""%>"><i class="ri-home-4-line"></i> Home</a></li>
     <%
      if(session.getAttribute("deliveryPartners")!=null)
      {
    	  %>
    	  <li><a href="<%= request.getContextPath()+"/delivery/Profile.jsp"%>" class="cart-nav-item <%= selectedMenu.equals("Profile") ? "desktop-menu-active" : ""%>" ><i class="ri-user-line"></i> Profile</a></li>
    	  <li><a href="<%= request.getContextPath()+"/delivery/Orders.jsp"%>" class="<%= selectedMenu.equals("Orders") ? "desktop-menu-active" : ""%>"><i class="ri-search-line"></i>Orders</a></li>
    	  <li><a href="<%= request.getContextPath()+"/delivery/PickedOrders.jsp"%>" class="<%= selectedMenu.equals("My Orders") ? "desktop-menu-active" : ""%>"><i class="ri-shopping-bag-line"></i>My Orders</a></li>
    	   <li><a id="logout-btn" class="logout-btn" data-url ="<%= request.getContextPath()+"/delivery/logout"%>"  onclick="handleLogoutClick()"><i class="ri-logout-box-line"></i> Logout</a></li>
    	 
    	  <%
    	  
      }else{
    	  %>
    	    <li><a href="<%= request.getContextPath()+"/delivery/SignIn.jsp"%>" class=""><i class="ri-login-box-line"></i>Sign In</a></li>
    	  <% 
      }
     
     %>
     
  
  </ul>
  <span id="menu-btn" onclick="handleMenuBarClick()"><i class="ri-menu-line"></i></span>
</nav>
  
  <div class="menu-sider menu-sider-close ">
     
     <span id="menu-close-btn" onclick="handleMenuCloseClick()"> <i class="ri-close-line"></i></span>
     
     <ul class="menu">
    <li><a href="<%=request.getContextPath()+"/delivery/Home.jsp"%>" class="<%= selectedMenu.equals("Home") ? "desktop-menu-active" : ""%>"><i class="ri-home-4-line"></i> Home</a></li>
     <%
      if(session.getAttribute("deliveryPartners")!=null)
      {
    	  %>
    	  <li><a href="<%= request.getContextPath()+"/delivery/Profile.jsp"%>" class="cart-nav-item <%= selectedMenu.equals("Profile") ? "desktop-menu-active" : ""%>" ><i class="ri-user-line"></i> Profile</a></li>
    	  <li><a href="<%= request.getContextPath()+"/delivery/Orders.jsp"%>" class="<%= selectedMenu.equals("Orders") ? "desktop-menu-active" : ""%>"><i class="ri-search-line"></i>Orders</a></li>
    	  <li><a href="<%= request.getContextPath()+"/delivery/PickedOrders.jsp"%>" class="<%= selectedMenu.equals("My Orders") ? "desktop-menu-active" : ""%>"><i class="ri-shopping-bag-line"></i>My Orders</a></li>
           <li><a  class="logout-btn" data-url ="<%= request.getContextPath()+"/delivery/logout"%>"  onclick="handleLogoutClick()"><i class="ri-logout-box-line"></i> Logout</a></li>
    	 <%
    	  
      }else{
    	  %>
    	    <li><a href="<%= request.getContextPath()+"/delivery/SignIn.jsp"%>" class=""><i class="ri-login-box-line"></i>Sign In</a></li>
    	  <% 
      }
     
     %>
  
    </ul> 
  
 
  </div>
  
  
   <section class="logout-modal hide" id="logout-modal" onclick="handleLogoutCancelClick()">
      
      <article class="logout-modal-wrapper" onclick="stopPropagation(event)">
          
          <p>Are you sure want to logout?</p>
          
          <footer>
             <button onclick="handleConfirmLogoutClick()">Logout</button>
             <button onclick="handleLogoutCancelClick()">Cancel</button>
          </footer>
          
      
      </article>
  
  </section>
  
  <script type="text/javascript">
      
      function handleMenuBarClick()
      {
    	  $(".menu-sider").removeClass("menu-sider-close")
      }
      
      function handleMenuCloseClick()
      {
    	  $(".menu-sider").addClass("menu-sider-close") 
      }
      
      function handleLogoutClick(url)
      {
    	  //alert(url)
    	  $("#logout-modal").removeClass("hide");
    	  $("body").addClass("remove-overflow");
      }
      
      function handleLogoutCancelClick()
      {  
    	  $("#logout-modal").addClass("hide");
    	  $("body").removeClass("remove-overflow");
      }
      
      
      function stopPropagation(event)
      {
    	  event.stopPropagation();
    	  
      }
      
      
      function handleConfirmLogoutClick()
      {
    	  window.location.href = $("#logout-btn").data("url");
      }
      
  
  </script>


