package com.swiggy.cartServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.swiggy.dao.CartDAO;
import com.swiggy.dao.impl.CartDaoImp;

@WebServlet("/user/cart/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cartId = request.getParameter("cartId")!=null ? Integer.parseInt(request.getParameter("cartId"))   :-1;
		if(cartId != -1)
		{
			CartDAO  cartDAO = new CartDaoImp();
		if(cartDAO.deleteById(cartId)) {
			response.getWriter().write("success");
		}else {
			response.getWriter().write("failed");
		}
		}
	}

	

}
