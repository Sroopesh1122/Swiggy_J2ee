package com.swiggy.deliveryServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

import com.swiggy.dao.DeliveryDAO;
import com.swiggy.dao.OrderDAO;
import com.swiggy.dao.impl.DeliveryDAOImp;
import com.swiggy.dao.impl.OrderDAOImp;
import com.swiggy.dto.Deliveries;
import com.swiggy.dto.DeliveryPartners;
import com.swiggy.dto.Orders;

/**
 * Servlet implementation class PickOrder
 */

@WebServlet(urlPatterns = "/food/order/pick")
public class PickOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PickOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DeliveryPartners deliveryPartners = (DeliveryPartners) request.getSession().getAttribute("deliveryPartners");
		
		if(deliveryPartners ==null)
		{
			response.getWriter().write("login");
			return;
		}
		
		int orderId=  request.getParameter("orderId")!=null ? Integer.parseInt(request.getParameter("orderId")) : -1;
		if(orderId != -1)
		{
			OrderDAO orderDAO  = new OrderDAOImp();
			DeliveryDAO deliveryDAO =  new DeliveryDAOImp();
			Orders order = orderDAO.getOrderById(orderId);
			
			if(order!=null)
			{
				if(order.getPickedBy()!=0)
				{
					response.getWriter().write("Order Already Picked");
					return;
				}
				
				order.setPickedBy(deliveryPartners.getPartnerId());
				order.setStatus("Out For Delivery");
				Deliveries delivery = new Deliveries();
				delivery.setOrderId(orderId);
				delivery.setPartnerId(deliveryPartners.getPartnerId());
				delivery.setDeliveryStatus("Out For Delivery");
				delivery.setAssignedAt(new Timestamp(System.currentTimeMillis()));
				
				delivery = deliveryDAO.addDelivery(delivery);
				
				if(delivery==null)
				{
					response.getWriter().write("Failed");
					return;
				}
				
				if(!orderDAO.updateOrder(order))
				{
					response.getWriter().write("Failed");
					return;
				}
				
				response.getWriter().write("Success");
				return;
				
			}else {
				
				response.getWriter().write("Failed");
				return;
			}
		  	
		}
		
	}


}
