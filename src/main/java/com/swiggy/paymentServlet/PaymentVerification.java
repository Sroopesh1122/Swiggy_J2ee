package com.swiggy.paymentServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import org.json.JSONObject;
import com.app.utils.AppProperties;
import com.razorpay.Utils;
import com.swiggy.dao.CartDAO;
import com.swiggy.dao.OrderDAO;
import com.swiggy.dao.impl.CartDaoImp;
import com.swiggy.dao.impl.OrderDAOImp;
import com.swiggy.dto.Users;

@WebServlet(urlPatterns = "/order/payment/verify")
public class PaymentVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PaymentVerification() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String razorpayPaymentId = request.getParameter("razorpay_payment_id");
	    String razorpayOrderId = request.getParameter("razorpay_order_id");
	    String razorpaySignature = request.getParameter("razorpay_signature");
        String source = request.getParameter("source");
	    String secret = AppProperties.get("RAZORPAY_SECRET_KEY");
	    
	    HttpSession session = request.getSession();
	    Users user = (Users)  session.getAttribute("users");
	    
	    if(user==null)
	    {
	    	response.sendRedirect(request.getContextPath()+"/customer/SignIn.jsp");
	    	return;
	    }

	    try {
	    	JSONObject params = new JSONObject();
            params.put("razorpay_payment_id", razorpayPaymentId);
            params.put("razorpay_order_id", razorpayOrderId);
            params.put("razorpay_signature", razorpaySignature);

	        // Verify the payment signature
	        boolean isValid = Utils.verifyPaymentSignature(params, secret);

	        if (isValid) {
	        	if(source.equals("cart"))
	        	{
	        		CartDAO cartDAO =  new CartDaoImp();
	        		cartDAO.deleteByUserId(user.getUserId());
	        		System.out.println("Cart item removed");
	        	}
	        	
	        	RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/OrderPlaced.jsp");
	   	        requestDispatcher.forward(request, response);
	        	
	        } else {
	        	if(source.equals("cart"))
	        	{
	        		OrderDAO orderDAO =  new OrderDAOImp();
	        		orderDAO.deleteOrdersByRazorPayId(razorpayOrderId);
	        		System.out.println("Failed Orders removed");
	        	}
	        	
	        	System.out.println("Payment Verification Failed Successfull");
	        	response.sendRedirect(request.getContextPath()+"/customer/PaymentFailed.jsp");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	       
	    }
	}

	

}
