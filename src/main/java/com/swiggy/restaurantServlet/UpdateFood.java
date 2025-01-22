package com.swiggy.restaurantServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.swiggy.dao.MenuItemDAO;
import com.swiggy.dao.impl.MenuItemsImp;
import com.swiggy.dto.MenuItems;
import com.swiggy.dto.Restaurants;

@WebServlet("/restaurant/updateFood")
public class UpdateFood extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		String description=req.getParameter("description");
		double price=Double.parseDouble(req.getParameter("price"));
		String category=req.getParameter("category");
		String img=req.getParameter("img");
		int itemId=Integer.parseInt(req.getParameter("itemId"));
		
		
		HttpSession session=req.getSession();
		Restaurants restaurants = (Restaurants) session.getAttribute("restaurants");
		
		if(restaurants==null) {
			resp.sendRedirect(req.getContextPath()+"/restaurant/SignIn.jsp");
			return;
		}
		
		MenuItemDAO menuItemDAO=new MenuItemsImp();
		MenuItems mItems= menuItemDAO.getItemById(itemId);
		mItems.setItemId(itemId);
		mItems.setName(name);
		mItems.setDescription(description);
		mItems.setCategory(category);
		mItems.setPrice(price);
		mItems.setImg(img);
		
		mItems.setAvailable(Integer.parseInt(req.getParameter("available")));
		
		mItems.setRestaurantId(restaurants.getRestaurantsId());
		
		
		MenuItems menuItems= menuItemDAO.updateItem(mItems);
		
			if(menuItems!=null) {
				req.setAttribute("success", "Food Updated successfully");
				RequestDispatcher requestDispatcher=req.getRequestDispatcher("/restaurant/UpdateFood.jsp?menu_id="+itemId);
				requestDispatcher.forward(req, resp);
			}
			else{
				req.setAttribute("failure", "Failed to update the food");
				RequestDispatcher requestDispatcher=req.getRequestDispatcher("/restaurant/UpdateFood.jsp");
				requestDispatcher.forward(req, resp);
			}
	}
}
