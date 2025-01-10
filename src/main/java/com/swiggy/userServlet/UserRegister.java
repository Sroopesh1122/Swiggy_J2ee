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

@WebServlet("/customer/signup")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");
		
		UsersDao userDao=new UsersDaoImp();
		Users findUsers = userDao.getUser(email);
		
		HttpSession session=req.getSession();
		
		if(findUsers==null) {
			Users users=new Users();
			users.setName(name);
			users.setEmail(email);
			users.setAddress(address);
			users.setPassword(confirmPassword);
			users.setPhoneNumber(phone);
			
			users = userDao.insertUsers(users) ;
			
			if(users!=null) {
				Users user=userDao.getUser(users.getUserId());
				session.setAttribute("users", user);
				RequestDispatcher requestDispatcher=req.getRequestDispatcher("/customer/Home.jsp");
				requestDispatcher.forward(req, resp);
			}
			else {
				req.setAttribute("failure", "Failed to register");
				RequestDispatcher requestDispatcher=req.getRequestDispatcher("/customer/SignUp.jsp");
				requestDispatcher.forward(req, resp);
			}
		}else {
			req.setAttribute("failure", "Mail id Already exist.");
			RequestDispatcher requestDispatcher=req.getRequestDispatcher("/customer/SignUp.jsp");
			requestDispatcher.forward(req, resp);
		}
	}

}
