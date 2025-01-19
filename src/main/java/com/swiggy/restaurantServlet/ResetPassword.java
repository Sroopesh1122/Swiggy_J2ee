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



@WebServlet("/restaurant/resetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String newPassword = request.getParameter("newPassword");
		
		HttpSession session = request.getSession();
		
		Restaurants restaurants = (Restaurants) session.getAttribute("restaurants");
		
		RestaurantsDao restaurantsDao = new RestaurantsDaoImp();
		
		if(restaurants==null) {
			response.sendRedirect(request.getContextPath()+"/restaurant/SignIn.jsp");
			return;
		}
		
		if(password.equals(restaurants.getPassword())) {
			if(password.equals(newPassword)) {
				  request.setAttribute("failure", "New password is same as old password");
				  RequestDispatcher rd=request.getRequestDispatcher("/restaurant/ResetPin.jsp");
				  rd.forward(request, response);
			}
			else {
				restaurants.setPassword(newPassword);
				restaurants = restaurantsDao.updateRestaurant(restaurants);
				
				if(restaurants!=null) {
					 session.invalidate();
					  request.setAttribute("success", "Password Updated successfully");
					  RequestDispatcher rd=request.getRequestDispatcher("/restaurant/SignIn.jsp");
					  rd.forward(request, response);
				}
				else {
					  request.setAttribute("failure", "Failed to reset password");
					  RequestDispatcher rd=request.getRequestDispatcher("/restaurant/ResetPin.jsp");
					  rd.forward(request, response);
				}	
			}
		}
		else {
			  request.setAttribute("failure", "Old password Mismatch");
			  RequestDispatcher rd=request.getRequestDispatcher("/restaurant/ResetPin.jsp");
			  rd.forward(request, response);
		}
		
		
	}

}
