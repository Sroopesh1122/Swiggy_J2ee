package com.swiggy.deliveryServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

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
		
		
	}

}
