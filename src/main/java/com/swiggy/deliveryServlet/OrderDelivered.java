package com.swiggy.deliveryServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Timestamp;

import com.swiggy.dao.DeliveryDAO;
import com.swiggy.dao.OrderDAO;
import com.swiggy.dao.impl.DeliveryDAOImp;
import com.swiggy.dao.impl.OrderDAOImp;
import com.swiggy.dto.Deliveries;
import com.swiggy.dto.Orders;


@WebServlet(urlPatterns = "/food/delivered")
public class OrderDelivered extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public OrderDelivered() {
        super();
        // TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (session.getAttribute("deliveryPartners") == null) {
			response.getWriter().write("login");
			return;
		}

		int orderId = request.getParameter("orderId") != null ? Integer.parseInt(request.getParameter("orderId")) : -1;
		String deliveryCode = request.getParameter("code");
		
		
		
		if (orderId != -1 && deliveryCode != null) {
			DeliveryDAO deliveryDAO = new DeliveryDAOImp();
			Deliveries delivery = deliveryDAO.getDeliveryByOrderId(orderId);
			
			if(!delivery.getDeliveryCode().equals(deliveryCode))
			{
				response.getWriter().write("Invalid Code");
				return;
			}
			
			OrderDAO orderDAO =  new OrderDAOImp();
			Orders order =  orderDAO.getOrderById(orderId);
			order.setStatus("Delivered");
			if(orderDAO.updateOrder(order))
			{
				delivery.setDeliveryStatus("Delivered");
				delivery.setDeliveredAt(new Timestamp(System.currentTimeMillis()));
				deliveryDAO.updateDelivery(delivery);
				response.getWriter().write("Success");
			}else {
				 response.getWriter().write("Failed");
			}
			
		}
		
	}

	
}
