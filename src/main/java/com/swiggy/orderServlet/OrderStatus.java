package com.swiggy.orderServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.swiggy.dao.OrderDAO;
import com.swiggy.dao.impl.OrderDAOImp;
import com.swiggy.dto.Orders;
import com.swiggy.dto.Restaurants;



@WebServlet(urlPatterns = "/order/status")
public class OrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public OrderStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Restaurants restaurants = (Restaurants)  request.getSession().getAttribute("restaurants");
		
		if(restaurants ==null)
		{
			response.getWriter().write("login");
			return;
		}
		
		int orderId = request.getParameter("orderId")!=null ? Integer.parseInt(request.getParameter("orderId")):-1;
		String status = request.getParameter("status");
		if(orderId != -1 && status!=null)
		{
			OrderDAO orderDAO =  new OrderDAOImp();
			Orders order = orderDAO.getOrderById(orderId);
			if(order!=null)
			{
				order.setStatus(status);
				if(orderDAO.updateOrder(order))
				{
					response.getWriter().write("success");
				}else {
					response.getWriter().write("failed");
				}
					
			}
		}else {
			response.getWriter().write("failed");
		}
		
		
	}

}
