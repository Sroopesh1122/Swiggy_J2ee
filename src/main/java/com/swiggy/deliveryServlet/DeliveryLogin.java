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

@WebServlet("/delivery/signin")
public class DeliveryLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeliveryLogin() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HttpSession session=request.getSession();
		
		DeliveryPartnersDAO deliveryPartnersDAO= new DeliveryPartnersDaoImpl();
		
		DeliveryPartners deliveryPartner=deliveryPartnersDAO.getDeliveryPartners(email);
		
		if(deliveryPartner!=null) {
			
			if(password.equals(deliveryPartner.getPassword())) {
				deliveryPartner =deliveryPartnersDAO.getDeliveryPartners(email);
				session.setAttribute("deliveryPartners", deliveryPartner);
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/delivery/Home.jsp");
				requestDispatcher.forward(request, response);
			}else {
				request.setAttribute("failure", "Invalid Password");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/delivery/SignIn.jsp");
				requestDispatcher.forward(request, response);
			}
			
		}
		else {
			request.setAttribute("failure", "Email does not exists..");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/delivery/SignIn.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
