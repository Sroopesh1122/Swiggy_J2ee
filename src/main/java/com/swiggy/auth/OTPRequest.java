package com.swiggy.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

import javax.mail.MessagingException;

import com.app.utils.EmailUtil;
import com.app.utils.OTPGenerator;
import com.swiggy.dao.DeliveryDAO;
import com.swiggy.dao.RestaurantsDao;
import com.swiggy.dao.UsersDao;
import com.swiggy.dao.impl.DeliveryDAOImp;
import com.swiggy.dao.impl.RestaurantsDaoImp;
import com.swiggy.dao.impl.UsersDaoImp;

@WebServlet(urlPatterns = "/auth/otp")
public class OTPRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OTPRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
        String role = request.getParameter("role");
		
		
		boolean error = false;

		if (email != null) {
			
			if(role.equals("customer"))
			{
				UsersDao usersDao =  new UsersDaoImp();
				if(usersDao.getUser(email)!=null)
				{
					response.getWriter().write("Exists");
					return;
				}
			}else if(role.equals("restaurant"))
			{
				RestaurantsDao restaurantsDao =  new RestaurantsDaoImp();
				if(restaurantsDao.getRestaurant(email)!=null)
				{
					response.getWriter().write("Exists");
					return;
				}
			}else if(role.equals("delivery"))
			{
				DeliveryDAO deliveryDAO =  new DeliveryDAOImp();
				//Email column if not there in deliveries table
			}
			
			
			
			
			String generatedOtp = OTPGenerator.generateRandomString(6);
			String toEmail = email; // Replace with recipient email
			String subject = "Email Verification";
			String body = "Hi Dear.\nYour OTP for Signup is " + generatedOtp+"\n Note: This Otp is valid for 5 minutes\n\nWith Regards : SR";

			try {
				EmailUtil.sendEmail(toEmail, subject, body);
				RequestEmail requestEmail = new RequestEmail();
				requestEmail.setEmail(email);
				requestEmail.setOtp(generatedOtp);
				requestEmail.setRequestedAt(LocalDateTime.now());
				EmailVerificationStore.addEmail(requestEmail);
				error=false;
			} catch (MessagingException e) {
				e.printStackTrace();
				error = true;
			}
			
			if (!error) {
				response.getWriter().write("Success");
			} else {
				response.getWriter().write("Failed");
			}

		}

	}
}
