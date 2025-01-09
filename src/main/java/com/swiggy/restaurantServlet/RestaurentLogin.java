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

@WebServlet("/restaurant/signin")
public class RestaurentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email= req.getParameter("email");
		String password= req.getParameter("password");
		
		RestaurantsDao restaurantsDao=new RestaurantsDaoImp();
		Restaurants restaurants=restaurantsDao.getRestaurant(email);
		
		HttpSession session=req.getSession();
		
		if(restaurants!=null) {
			if(password.equals(restaurants.getPassword())) {
				session.setAttribute("restaurants", restaurants);
				RequestDispatcher requestDispatcher=req.getRequestDispatcher("/restaurant/Home.jsp");
				requestDispatcher.forward(req, resp);
			}
			else {
				req.setAttribute("failure", "Invalid password");
				RequestDispatcher requestDispatcher=req.getRequestDispatcher("/restaurant/SignIn.jsp");
				requestDispatcher.forward(req, resp);
			}
		}
		else {
			req.setAttribute("failure", "Email does not exists...");
			RequestDispatcher rd=req.getRequestDispatcher("/restaurant/SignIn.jsp"); 
			rd.forward(req, resp);
		}
	}


}
