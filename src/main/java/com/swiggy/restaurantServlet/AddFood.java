package com.swiggy.restaurantServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.app.utils.CloudinaryUploader;
import com.swiggy.dao.MenuItemDAO;
import com.swiggy.dao.impl.MenuItemsImp;
import com.swiggy.dto.MenuItems;
import com.swiggy.dto.Restaurants;

@WebServlet("/restaurant/addfood")
@MultipartConfig
public class AddFood extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String description=req.getParameter("description");
		double price=Double.parseDouble(req.getParameter("price"));
		String category=req.getParameter("category");
		Part imgPart  = req.getPart("img");
		
		String filename = imgPart.getSubmittedFileName();
		String uploadPath = getServletContext().getRealPath("/imges");

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			boolean dirsCreated = uploadDir.mkdirs();

		}

		String filePath = uploadPath + File.separator + filename;

		imgPart.write(filePath);

		File file = new File(filePath);
		String imgUrl = CloudinaryUploader.upload(filePath);
		
		MenuItems mItems=new MenuItems();
		mItems.setName(name);
		mItems.setDescription(description);
		mItems.setCategory(category);
		mItems.setPrice(price);
		mItems.setImg(imgUrl);
		mItems.setAvailable(1);
		HttpSession session =req.getSession();
		Restaurants restaurants = (Restaurants) session.getAttribute("restaurants");
		mItems.setRestaurantId(restaurants.getRestaurantsId());
		
		MenuItemDAO menuItemDAO=new MenuItemsImp();
		
		
		MenuItems menuItems= menuItemDAO.addItem(mItems);
		System.out.println(menuItems);
		
		
		
		
	}

}
