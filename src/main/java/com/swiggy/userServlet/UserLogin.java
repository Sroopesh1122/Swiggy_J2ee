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

@WebServlet("/customer/signin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email= req.getParameter("email");
		String password= req.getParameter("password");
		
		UsersDao userDao=new UsersDaoImp();
		Users users = userDao.getUser(email);
		
		HttpSession session=req.getSession();
		
		if(users!=null) {
			if(password.equals(users.getPassword())) {
				session.setAttribute("users", users);
				RequestDispatcher requestDispatcher=req.getRequestDispatcher("/customer/Home.jsp");
				requestDispatcher.forward(req, resp);
			}
			else {
				req.setAttribute("failure", "Invalid password");
				RequestDispatcher requestDispatcher=req.getRequestDispatcher("/customer/SignIn.jsp");
				requestDispatcher.forward(req, resp);
			}
		}else {
			req.setAttribute("failure", "Email does not exists...");
			RequestDispatcher rd=req.getRequestDispatcher("/customer/SignIn.jsp"); 
			rd.forward(req, resp);
		}
	}

}
