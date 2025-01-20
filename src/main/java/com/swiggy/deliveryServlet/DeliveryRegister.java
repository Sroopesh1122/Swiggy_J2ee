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

@WebServlet("/delivery/signup")
public class DeliveryRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeliveryRegister() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String vehicleNo = request.getParameter("vehicleNo");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		
		HttpSession session=request.getSession();
		
		DeliveryPartnersDAO deliveryPartnersDAO= new DeliveryPartnersDaoImpl();
		
		DeliveryPartners deliveryPartners=deliveryPartnersDAO.getDeliveryPartners(email);
		
		if(deliveryPartners==null) {
			DeliveryPartners deliveryPartner = new DeliveryPartners();
			deliveryPartner.setName(name);
			deliveryPartner.setEmail(email);
			deliveryPartner.setPassword(confirmPassword);
			deliveryPartner.setPhoneNumber(phone);
			deliveryPartner.setVehicleDetails(vehicleNo);
			
			deliveryPartner = deliveryPartnersDAO.insertDeliveryPartners(deliveryPartner);
			
			if(deliveryPartner!=null) {
				deliveryPartner =deliveryPartnersDAO.getDeliveryPartners(email);
				session.setAttribute("deliveryPartners", deliveryPartner);
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/delivery/Home.jsp");
				requestDispatcher.forward(request, response);
			}
			else {
				request.setAttribute("failure", "Failed to register");
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("/delivery/SignUp.jsp");
				requestDispatcher.forward(request, response);
			}
			
		}
		else {
			request.setAttribute("failure", "Mail id Already exist..");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/delivery/SignUp.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
