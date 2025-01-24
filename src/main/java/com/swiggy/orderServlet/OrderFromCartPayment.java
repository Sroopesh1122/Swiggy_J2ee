package com.swiggy.orderServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import org.json.JSONObject;

import com.app.utils.AppProperties;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.swiggy.dao.CartDAO;
import com.swiggy.dao.IOrderItemDao;
import com.swiggy.dao.MenuItemDAO;
import com.swiggy.dao.OrderDAO;
import com.swiggy.dao.impl.CartDaoImp;
import com.swiggy.dao.impl.MenuItemsImp;
import com.swiggy.dao.impl.OrderDAOImp;
import com.swiggy.dao.impl.OrderItemImpl;
import com.swiggy.dto.Cart;
import com.swiggy.dto.MenuItems;
import com.swiggy.dto.OrderItems;
import com.swiggy.dto.Orders;
import com.swiggy.dto.Users;


@WebServlet(urlPatterns = "/cart/order/payment")
public class OrderFromCartPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RazorpayClient razorpayClient;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderFromCartPayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Users user = (Users) request.getSession().getAttribute("users");
		 if(user ==null)
		 {
			 response.sendRedirect(request.getContextPath()+"/customer/Cart.jsp");
			 return;
		 }
		 CartDAO cartDAO =  new CartDaoImp();
	     List<Cart> cartItems = cartDAO.getAllCarts(user.getUserId());
	     if(cartItems.size() ==0)
		 {
			 response.sendRedirect(request.getContextPath()+"/customer/Cart.jsp");
			 return;
		 }
	     
	     OrderDAO orderDAO =  new OrderDAOImp();
	     MenuItemDAO menuItemDAO =  new MenuItemsImp();
	     IOrderItemDao orderItemDao = new OrderItemImpl();
	     String pay_mode = request.getParameter("payment-option");
	     
	     
	    
	     String razorpayKeyId = AppProperties.get("RAZORPAY_API_KEY");
    	 String razorpayKeySecret =AppProperties.get("RAZORPAY_SECRET_KEY");
	    	 try {
				 razorpayClient = new RazorpayClient(razorpayKeyId, razorpayKeySecret);
			} catch (RazorpayException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	 
	    	
	    	 double totalPaymentAmount = cartItems.stream()
	    			    .mapToDouble(cartItem -> {
	    			        MenuItems menuItem = menuItemDAO.getItemById(cartItem.getMenuId());
	    			        double totalPrice = Integer.parseInt(request.getParameter(menuItem.getItemId() + "")) * menuItem.getPrice();
	    			        return totalPrice;
	    			    })
	    			    .sum();

	    	
	    	 
	    	 
	    	 JSONObject orderRequest = new JSONObject();
             orderRequest.put("amount", (int) (totalPaymentAmount * 100)); // Amount in paise
             orderRequest.put("currency", "INR");
             
             // Call Razorpay API to create order
             Order razorpayOrder=null;
             try {
 				 razorpayOrder= razorpayClient.orders.create(orderRequest);
 				request.setAttribute("razorpay_order_id", razorpayOrder.get("id").toString());
 				request.setAttribute("total_amount", totalPaymentAmount);
 				request.setAttribute("source","cart");

 			} catch (RazorpayException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
	     
	     
	     for(Cart cartItem :cartItems)
	     {
	    	 MenuItems menuItem = menuItemDAO.getItemById(cartItem.getMenuId());
	    	 
	    	
	    	 
	    	 Orders order = new Orders();
	    	 order.setUserId(user.getUserId());
	    	 order.setRestaurantId(menuItem.getRestaurantId());
	    	 double totalPrice =  Integer.parseInt(request.getParameter(menuItem.getItemId()+"")) * menuItem.getPrice();
	    	 order.setPay_mode(pay_mode);
	    	 order.setTotalAmount(totalPrice);
	    	 order.setDeliveryAddress(request.getParameter("address"));
	    	 order.setRayzorpay_id(razorpayOrder.get("id").toString());
	    	 
	    	 
	    	 order = orderDAO.insertOrder(order);
	    	 
	    	 if(order!=null)
	    	 {
	 
	    		  OrderItems orderItems = new OrderItems();
	    		  orderItems.setOrderId(order.getOrderId());
	    		  orderItems.setItemId(cartItem.getMenuId());
	    		  orderItems.setQuantity(Integer.parseInt(request.getParameter(menuItem.getItemId()+"")));
	    		  orderItems.setPrice(menuItem.getPrice());
	    		  orderItems = orderItemDao.addItem(orderItems);
	    	 }
	     	 
	     }
	     
	     RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/Payment.jsp");
	     requestDispatcher.forward(request, response);
	}

}
