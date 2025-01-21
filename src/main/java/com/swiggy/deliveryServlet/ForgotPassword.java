package com.swiggy.deliveryServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.swiggy.dao.DeliveryPartnersDAO;
import com.swiggy.dao.impl.DeliveryPartnersDaoImpl;
import com.swiggy.dto.DeliveryPartners;



@WebServlet("/delivery/forgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		DeliveryPartnersDAO deliveryPartnersDAO=new DeliveryPartnersDaoImpl();
		DeliveryPartners deliveryPartners  = deliveryPartnersDAO.getDeliveryPartners(email);
		
		if(deliveryPartners!=null) {
			deliveryPartners.setPassword(confirmPassword);
			
			deliveryPartners =deliveryPartnersDAO.updateDeliveryPartners(deliveryPartners);
			if(deliveryPartners!=null) {
				request.setAttribute("success", "Password Changed Successfully");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/delivery/SignIn.jsp");
				requestDispatcher.forward(request, response);
			}
			else {
				request.setAttribute("failure", "Failed to change Password");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/delivery/ForgotPassword.jsp");
				requestDispatcher.forward(request, response);
			}
			
		}else {
			request.setAttribute("failure", "Invalid Email..");
			  RequestDispatcher rd=request.getRequestDispatcher("/delivery/ForgotPassword.jsp");
			  rd.forward(request, response);
		}
	}

}
