package com.swiggy.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(urlPatterns = "/auth/otp/verify")
public class OTPVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OTPVerification() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		
		if(code!=null && email!=null)
		{
			RequestEmail requestEmail = EmailVerificationStore.getOtp(email);
			if(requestEmail!=null)
			{
				LocalDateTime requestTime = requestEmail.getRequestedAt();
				LocalDateTime currentTime = LocalDateTime.now();

			    // Compare the time difference
			    if (requestTime.plusMinutes(5).isAfter(currentTime)) {
			        
			    	if(requestEmail.getOtp().equals(code))
			    	{
			    		EmailVerificationStore.deleteEmailData(email);
			    		response.getWriter().write("Success");
			    	}else {
			    		response.getWriter().write("Invalid OTP");
			    	}  	
			    } else {
			       response.getWriter().write("Invalid Otp");
			    }
			}			
		}
	
	}


}
