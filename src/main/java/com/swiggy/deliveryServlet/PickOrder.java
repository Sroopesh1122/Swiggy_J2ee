package com.swiggy.deliveryServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

import javax.mail.MessagingException;

import com.app.utils.AppProperties;
import com.app.utils.CaptchRenerator;
import com.app.utils.EmailUtil;
import com.swiggy.dao.DeliveryDAO;
import com.swiggy.dao.IOrderItemDao;
import com.swiggy.dao.OrderDAO;
import com.swiggy.dao.UsersDao;
import com.swiggy.dao.impl.DeliveryDAOImp;
import com.swiggy.dao.impl.MenuItemsImp;
import com.swiggy.dao.impl.OrderDAOImp;
import com.swiggy.dao.impl.OrderItemImpl;
import com.swiggy.dao.impl.UsersDaoImp;
import com.swiggy.dto.Deliveries;
import com.swiggy.dto.DeliveryPartners;
import com.swiggy.dto.MenuItems;
import com.swiggy.dto.OrderItems;
import com.swiggy.dto.Orders;
import com.swiggy.dto.Users;

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
				String deliveryCode = CaptchRenerator.generateRandomString(6);
				
				
				//To get Customer id
				UsersDao usersDao =  new UsersDaoImp();
				
				Users user = usersDao.getUser(order.getUserId());
				OrderItems orderItems = new OrderItemImpl().getById(orderId);
			    MenuItems menuItem =  new MenuItemsImp().getItemById(orderItems.getItemId());
				
				String subject = "Your Order Out for Delivery";
				StringBuilder bodyBuilder = new StringBuilder();
				bodyBuilder.append("Dear ").append(user.getName()).append(",\n\n")
				           .append("We are pleased to inform you that your order for '").append(menuItem.getName())
				           .append("' is now out for delivery. Please note your delivery code: ")
				           .append(deliveryCode).append(". Kindly share this code with the delivery agent upon receipt.\n\n")
				           .append("Delivery Agent Details:\n")
				           .append("---------------------------\n")
				           .append("Name: ").append(deliveryPartners.getName()).append("\n")
				           .append("Vehicle Number: ").append(deliveryPartners.getVehicleDetails()).append("\n")
				           .append("Contact Number: ").append(deliveryPartners.getPhoneNumber()).append("\n\n")
				           .append("If you have any questions or concerns, please feel free to reach out to us.\n\n")
				           .append("Best regards,\n")
				           .append("SR Team\n")
				           .append("Email: ").append(AppProperties.get("EMAIL"));

				String body = bodyBuilder.toString();

				
				
				
				try {
					EmailUtil.sendEmail(user.getEmail(), subject, body);
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				delivery.setDeliveryCode(deliveryCode);
				
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
