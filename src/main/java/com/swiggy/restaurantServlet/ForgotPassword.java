package com.swiggy.restaurantServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.swiggy.dao.RestaurantsDao;
import com.swiggy.dao.impl.RestaurantsDaoImp;
import com.swiggy.dto.Restaurants;



@WebServlet("/restaurant/forgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		RestaurantsDao restaurantsDao=new RestaurantsDaoImp();
		Restaurants restaurants=restaurantsDao.getRestaurant(email);
		if(restaurants!=null) {
			restaurants.setPassword(confirmPassword);
			
			restaurants =restaurantsDao.updateRestaurant(restaurants);
			
			if(restaurants!=null) {
				request.setAttribute("success", "Password Changed Successfully");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/restaurant/SignIn.jsp");
				requestDispatcher.forward(request, response);
			}
			else {
				request.setAttribute("failure", "Failed to change Password");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/restaurant/ForgotPassword.jsp");
				requestDispatcher.forward(request, response);
			}
			
		}else {
			request.setAttribute("failure", "Invalid Email..");
			  RequestDispatcher rd=request.getRequestDispatcher("/restaurant/ForgotPassword.jsp");
			  rd.forward(request, response);
		}
	}

}
