package com.swiggy.deliveryServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.swiggy.dao.DeliveryPartnersDAO;
import com.swiggy.dao.impl.DeliveryPartnersDaoImpl;
import com.swiggy.dto.DeliveryPartners;



@WebServlet("/delivery/resetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public ResetPassword() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String newPassword = request.getParameter("newPassword");
		
		HttpSession session = request.getSession();
		
		DeliveryPartners deliveryPartners = (DeliveryPartners) session.getAttribute("deliveryPartners");
		
		DeliveryPartnersDAO deliveryPartnersDAO=new DeliveryPartnersDaoImpl();
		
		if(deliveryPartners==null) {
			response.sendRedirect(request.getContextPath()+"/delivery/SignIn.jsp");
			return;
		}
		
		if(password.equals(deliveryPartners.getPassword())) {
			if(password.equals(newPassword)) {
				  request.setAttribute("failure", "New password is same as old password");
				  RequestDispatcher rd=request.getRequestDispatcher("/delivery/ResetPin.jsp");
				  rd.forward(request, response);
			}
			else {
				deliveryPartners.setPassword(newPassword);
				deliveryPartners = deliveryPartnersDAO.updateDeliveryPartners(deliveryPartners);
				
				if(deliveryPartners!=null) {
					  session.invalidate();
					  request.setAttribute("success", "Password Updated successfully");
					  RequestDispatcher rd=request.getRequestDispatcher("/delivery/SignIn.jsp");
					  rd.forward(request, response);
				}
				else {
					  request.setAttribute("failure", "Failed to reset password");
					  RequestDispatcher rd=request.getRequestDispatcher("/delivery/ResetPin.jsp");
					  rd.forward(request, response);
				}	
			}
		}
		else {
			  request.setAttribute("failure", "Old password Mismatch");
			  RequestDispatcher rd=request.getRequestDispatcher("/delivery/ResetPin.jsp");
			  rd.forward(request, response);
		}
		

	}

}
