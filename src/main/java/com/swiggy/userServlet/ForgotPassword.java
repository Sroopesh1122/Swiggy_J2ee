package com.swiggy.userServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.swiggy.dao.UsersDao;
import com.swiggy.dao.impl.UsersDaoImp;
import com.swiggy.dto.Users;

@WebServlet("/customer/forgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		UsersDao usersDao=new UsersDaoImp();
		Users users  = usersDao.getUser(email);
		
		if(users!=null) {
			users.setPassword(confirmPassword);
			
			users =usersDao.updateUsers(users);
			if(users!=null) {
				request.setAttribute("success", "Password Changed Successfully");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/customer/SignIn.jsp");
				requestDispatcher.forward(request, response);
			}
			else {
				request.setAttribute("failure", "Failed to change Password");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/customer/ForgotPassword.jsp");
				requestDispatcher.forward(request, response);
			}
			
		}else {
			request.setAttribute("failure", "Invalid Email..");
			  RequestDispatcher rd=request.getRequestDispatcher("/customer/ForgotPassword.jsp");
			  rd.forward(request, response);
		}
	}

}
