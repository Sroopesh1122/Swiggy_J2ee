package com.swiggy.restaurantServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.swiggy.dao.RestaurantsDao;
import com.swiggy.dao.impl.RestaurantsDaoImp;
import com.swiggy.dto.Restaurants;

@WebServlet("/restaurant/signup")
public class RestaurantRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String restaurantName= request.getParameter("name");
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String restaurantAddress= request.getParameter("address");
		String password= request.getParameter("password");
		String confirmPassword= request.getParameter("confirmPassword");
	
		HttpSession session=request.getSession();
		
		RestaurantsDao restaurantsDao=new RestaurantsDaoImp();
		Restaurants findRestaurants=restaurantsDao.getRestaurant(email);
		
		if(findRestaurants==null ) {
			Restaurants restaurants=new Restaurants();
			restaurants.setName(restaurantName);
			restaurants.setEmail(email);
			restaurants.setPhoneNumber(phone);
			restaurants.setAddress(restaurantAddress);
			restaurants.setPassword(confirmPassword);
			restaurants.setRating(0.0);
			restaurants =restaurantsDao.insertRestaurant(restaurants);
			
			if(restaurants!=null) {
				Restaurants restaurant=restaurantsDao.getRestaurant(email);
				session.setAttribute("restaurants", restaurant);
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/restaurant/Home.jsp");
				requestDispatcher.forward(request, response);
			}
			else {
				request.setAttribute("failure", "Failed to register");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/restaurant/SignUp.jsp");
				requestDispatcher.forward(request, response);
			}
		}else {
			request.setAttribute("failure", "Mail id Already exist");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/restaurant/SignUp.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
