package com.swiggy.cartServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.swiggy.dao.CartDAO;
import com.swiggy.dao.impl.CartDaoImp;
import com.swiggy.dto.Cart;
import com.swiggy.dto.Users;

@WebServlet("/customer/cart/add")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Integer userId=request.getParameter("userId")!=null?Integer.parseInt(request.getParameter("userId")):-1;
//		Integer menuId=request.getParameter("menuId")!= null?Integer.parseInt(request.getParameter("menuId")):-1 ;
		Users user =(Users) request.getSession().getAttribute("users");
		if(user == null) {
			response.getWriter().write("login");
			return;
		}
		
		
		
		int productId = request.getParameter("foodId")!=null ? Integer.parseInt(request.getParameter("foodId")): -1;
		System.out.println(productId);
		if(productId != -1) {
			Cart cart = new Cart();
            cart.setUserId(user.getUserId());
            cart.setMenuId(productId);
            CartDAO cartDAO = new CartDaoImp();

            cart = cartDAO.addCart(cart);
            if (cart != null) {
                response.getWriter().write("success");
            } else {
                response.getWriter().write("failed");
            }
		}
	}

	

}
