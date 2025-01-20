package com.swiggy.reviewServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.swiggy.dao.IOrderItemDao;
import com.swiggy.dao.MenuItemDAO;
import com.swiggy.dao.OrderDAO;
import com.swiggy.dao.RestaurantsDao;
import com.swiggy.dao.ReviewDao;
import com.swiggy.dao.impl.MenuItemsImp;
import com.swiggy.dao.impl.OrderDAOImp;
import com.swiggy.dao.impl.OrderItemImpl;
import com.swiggy.dao.impl.RestaurantsDaoImp;
import com.swiggy.dao.impl.ReviewDaoImpl;
import com.swiggy.dto.MenuItems;
import com.swiggy.dto.OrderItems;
import com.swiggy.dto.Orders;
import com.swiggy.dto.Restaurants;
import com.swiggy.dto.Reviews;
import com.swiggy.dto.Users;

@WebServlet("/user/review")
public class AddReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Users user = (Users) request.getSession().getAttribute("users");
		
		if(user ==null)
		{
			response.sendRedirect(request.getContextPath()+"/customer/SignIn.jsp");
			return;
		}
		
		
	   int orderId = request.getParameter("orderId")!=null ? Integer.parseInt(request.getParameter("orderId")) :-1;
	   int rating = request.getParameter("rating")!=null ? Integer.parseInt(request.getParameter("rating")) :-1;
	   String comment= request.getParameter("comment") ;
	   if(orderId != -1 && rating != -1 && comment !=null)
	   {
		   //Getting MenuItem Id by using OrderData;
		   OrderDAO orderDAO =  new OrderDAOImp();
		   IOrderItemDao orderItemDao =  new OrderItemImpl();
		   RestaurantsDao restaurantsDao =  new RestaurantsDaoImp();
		   MenuItemDAO menuItemDAO =  new MenuItemsImp();
		   
		   Orders order = orderDAO.getOrderById(orderId);
		   OrderItems orderItem = orderItemDao.getById(orderId);
		   MenuItems menuItem = menuItemDAO.getItemById(orderItem.getItemId());
		   Restaurants restaurants =  restaurantsDao.getRestaurant(order.getRestaurantId());
		   
		   ReviewDao reviewDao =  new ReviewDaoImpl();
		   Reviews reviews = new Reviews();
		   reviews.setUserId(user.getUserId());
		   reviews.setRestaurantId(order.getRestaurantId());
		   reviews.setRating(rating);
		   reviews.setComment(comment);
		   reviews.setMenuId(orderItem.getItemId());
		   
		   //setting revied to 1
		   order.setReveiwed(1);
		   
		   //Updating food Rating;
		   menuItem.setReviewCount(menuItem.getReviewCount() + 1);
		   menuItem.setRating((menuItem.getRating() + rating )/menuItem.getReviewCount());
		  
		   //Updatting Restaurant Rating;
		   restaurants.setReviewsCount(restaurants.getReviewsCount()+1);
		   restaurants.setRating((restaurants.getRating() + rating) / restaurants.getReviewsCount());
		   
		   reviews =reviewDao.addReview(reviews);
		   
		   if(reviews !=null)
		   {
			   if(orderDAO.updateOrder(order))
			    {
				   
				   menuItem = menuItemDAO.updateItem(menuItem);
				   restaurants = restaurantsDao.updateRestaurant(restaurants);
				   
				   request.getRequestDispatcher("/customer/RatingSubmitted.jsp").forward(request, response);
			    	
			    }
			   
		   }
		      
		   
	   }
		
	}

}
