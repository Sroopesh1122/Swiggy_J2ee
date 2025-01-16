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

@WebServlet("/restaurant/profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String restaurantName= request.getParameter("name");
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String restaurantAddress= request.getParameter("address");
		
		HttpSession session = request.getSession();
		Restaurants restaurants= (Restaurants) session.getAttribute("restaurants");
		
		if(restaurants==null) {
			response.sendRedirect(request.getContextPath()+"/restaurant/SignIn.jsp");
			return;
		}
		
		restaurants.setName(restaurantName);
		restaurants.setPhoneNumber(phone);
		restaurants.setAddress(restaurantAddress);
		
		System.out.println(restaurants);
		
		RestaurantsDao restaurantsDao=new RestaurantsDaoImp();
		restaurants = restaurantsDao.updateRestaurant(restaurants);
		
		if(restaurants!=null) {
			request.setAttribute("success", "Profile updated successfully");
			  request.getSession().setAttribute("restaurants",restaurants);
			  RequestDispatcher rd=request.getRequestDispatcher("/restaurant/Profile.jsp");
			  rd.forward(request, response);
		  }else {
			  request.setAttribute("failure", "Profile failed to update");
			  RequestDispatcher rd=request.getRequestDispatcher("/restaurant/Profile.jsp");
			  rd.forward(request, response);
		  }	
		
	}

}
