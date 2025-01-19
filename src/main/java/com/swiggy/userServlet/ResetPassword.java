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


@WebServlet("/customer/resetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String newPassword = request.getParameter("newPassword");
		
		HttpSession session = request.getSession();
		
		Users user = (Users) session.getAttribute("users");
		
		UsersDao usersDao=new UsersDaoImp();
		
		if(user==null) {
			response.sendRedirect(request.getContextPath()+"/customer/SignIn.jsp");
			return;
		}
		
		if(password.equals(user.getPassword())) {
			if(password.equals(newPassword)) {
				  request.setAttribute("failure", "New password is same as old password");
				  RequestDispatcher rd=request.getRequestDispatcher("/customer/ResetPin.jsp");
				  rd.forward(request, response);
			}
			else {
				user.setPassword(newPassword);
				user = usersDao.updateUsers(user);
				
				if(user!=null) {
					 session.invalidate();
					  request.setAttribute("success", "Password Updated successfully");
					  RequestDispatcher rd=request.getRequestDispatcher("/customer/SignIn.jsp");
					  rd.forward(request, response);
				}
				else {
					  request.setAttribute("failure", "Failed to reset password");
					  RequestDispatcher rd=request.getRequestDispatcher("/customer/ResetPin.jsp");
					  rd.forward(request, response);
				}	
			}
		}
		else {
			  request.setAttribute("failure", "Old password Mismatch");
			  RequestDispatcher rd=request.getRequestDispatcher("/customer/ResetPin.jsp");
			  rd.forward(request, response);
		}
		
		
	}

}
