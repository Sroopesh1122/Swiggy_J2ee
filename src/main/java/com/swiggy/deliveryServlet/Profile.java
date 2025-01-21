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



@WebServlet("/delivery/profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Profile() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name= request.getParameter("name");
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String vehicleNo = request.getParameter("vehicleNo");
		
		HttpSession session = request.getSession();
		DeliveryPartners deliveryPartners=(DeliveryPartners)session.getAttribute("deliveryPartners");
		
		if(deliveryPartners==null) {
			response.sendRedirect(request.getContextPath()+"/delivery/SignIn.jsp");
			return;
		}
		
		deliveryPartners.setName(name);
		deliveryPartners.setVehicleDetails(vehicleNo);
		deliveryPartners.setPhoneNumber(phone);
		
		DeliveryPartnersDAO deliveryPartnersDAO = new DeliveryPartnersDaoImpl();
		deliveryPartners= deliveryPartnersDAO.updateDeliveryPartners(deliveryPartners);
		
		if(deliveryPartners!=null) {
			request.setAttribute("success", "Profile updated successfully");
			  request.getSession().setAttribute("deliveryPartners",deliveryPartners);
			  RequestDispatcher rd=request.getRequestDispatcher("/delivery/Profile.jsp");
			  rd.forward(request, response);
		  }else {
			  request.setAttribute("failure", "Profile failed to update");
			  RequestDispatcher rd=request.getRequestDispatcher("/delivery/Profile.jsp");
			  rd.forward(request, response);
		}
}
}

