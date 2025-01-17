package com.swiggy.userServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.swiggy.dao.UsersDao;
import com.swiggy.dao.impl.UsersDaoImp;
import com.swiggy.dto.Users;

@WebServlet("/customer/profile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName= request.getParameter("name");
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String userAddress= request.getParameter("address");
		
		HttpSession session = request.getSession();
		Users user=(Users)session.getAttribute("users");
		
		if(user==null) {
			response.sendRedirect(request.getContextPath()+"/customer/SignIn.jsp");
			return;
		}
		
		user.setName(userName);
		user.setAddress(userAddress);
		user.setPhoneNumber(phone);
		
		UsersDao usersDao = new UsersDaoImp();
		user= usersDao.updateUsers(user);
		
		if(user!=null) {
			request.setAttribute("success", "Profile updated successfully");
			  request.getSession().setAttribute("users",user);
			  RequestDispatcher rd=request.getRequestDispatcher("/customer/Profile.jsp");
			  rd.forward(request, response);
		  }else {
			  request.setAttribute("failure", "Profile failed to update");
			  RequestDispatcher rd=request.getRequestDispatcher("/customer/Profile.jsp");
			  rd.forward(request, response);
		  
		}
		
	}

}
