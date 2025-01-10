package com.swiggy.dao.impl;

import java.awt.Menu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.openssl.pem_password_cb;

import com.swiggy.dao.MenuItemDAO;
import com.swiggy.db.DBConnection;
import com.swiggy.dto.MenuItems;

public class MenuItemsImp implements MenuItemDAO
{
private Connection connection;
public MenuItemsImp() {
	this.connection=DBConnection.getConnection();
}
@Override
public MenuItems addItem(MenuItems item) {
	PreparedStatement preparedStatement=null;
	int result=0;
	String  insertQuery="INSERT INTO menu_items (restaurant_id, name, description, price, available,created_at,category,img) VALUES (?, ?, ?, ?, ?,?,?now())";
	try {
		connection.setAutoCommit(false);
		preparedStatement=connection.prepareStatement(insertQuery);
		preparedStatement.setInt(1, item.getRestaurantId()); 
		preparedStatement.setString(2, item.getName()); 
		preparedStatement.setString(3, item.getDescription());
		preparedStatement.setDouble(4, item.getPrice()); 
		preparedStatement.setInt(5, item.getAvailable());
preparedStatement.setString(6, item.getCategory());
preparedStatement.setString(7, item.getImg());
		result=preparedStatement.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(result>0) {
		try {
			connection.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return item;
	}
	try {
		connection.rollback();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
}
@Override
public MenuItems getItemById(int itemId) {
	PreparedStatement preparedStatement =null;
	ResultSet resultSet =null;
	MenuItems item=null;
	String selectQuery="SELECT * FROM menu_items  WHERE item_id = ?";
	try {
		preparedStatement=connection.prepareStatement(selectQuery);
		preparedStatement.setInt(1, itemId);
		resultSet=preparedStatement.executeQuery();
		while (resultSet.next()) {
			 item = new MenuItems(); 
			 item.setItemId(resultSet.getInt("item_id"));
			 item.setRestaurantId(resultSet.getInt("restaurant_id"));
			 item.setName(resultSet.getString("name")); 
			 item.setDescription(resultSet.getString("description"));
			 item.setPrice(resultSet.getDouble("price")); 
			 item.setAvailable(resultSet.getInt("available"));
			 item.setCreatedAt(resultSet.getTimestamp("created_at"));
			 item.setCategory(resultSet.getString("category"));
			 item.setImg(resultSet.getString("img"));
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return item;
}
@Override
public List<MenuItems> getAllItems() {
	PreparedStatement preparedStatement =null;
	List<MenuItems> items = new ArrayList();
	ResultSet resultSet =null;
	String selectQuery="SELECT * FROM menu_items";
	
	try {
		
		preparedStatement=connection.prepareStatement(selectQuery);
		resultSet=preparedStatement.executeQuery();
		while(resultSet.next()) {
			MenuItems item = new MenuItems();
			item.setItemId(resultSet.getInt("item_id"));
			 item.setRestaurantId(resultSet.getInt("restaurant_id"));
			 item.setName(resultSet.getString("name")); 
			 item.setDescription(resultSet.getString("description"));
			 item.setPrice(resultSet.getDouble("price")); 
			 item.setAvailable(resultSet.getInt("available"));
			 item.setCreatedAt(resultSet.getTimestamp("created_at"));
			 item.setCategory(resultSet.getString("category"));
			 item.setImg(resultSet.getString("img"));
			 items.add(item);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return items;
}
@Override
public MenuItems updateItem(MenuItems item) {
	PreparedStatement preparedStatement =null;
	int result=0;
	String updateQuery = "UPDATE menu_items SET restaurant_id = ?, name = ?, description = ?, price = ?, available = ? WHERE item_id = ?";
	try {
		preparedStatement =connection.prepareStatement(updateQuery);
		preparedStatement.setInt(1, item.getRestaurantId()); 
		preparedStatement.setString(2, item.getName()); 
		preparedStatement.setString(3, item.getDescription());
		preparedStatement.setDouble(4, item.getPrice()); 
		preparedStatement.setInt(5, item.getAvailable());
		preparedStatement.setInt(6, item.getItemId()); 
		preparedStatement.setString(6, item.getCategory());
		preparedStatement.setString(7, item.getImg());
		result=preparedStatement.executeUpdate();
	} catch (SQLException e) {
		
		
		e.printStackTrace();
	}
	if(result >0) {
		return item;
	}
	return null;
}
@Override
public boolean deleteItem(int itemId) {
	PreparedStatement preparedStatement =null;
	String deleteQuery = "DELETE FROM menu_items WHERE item_id = ?";
	int result=0;
	try {
		connection.setAutoCommit(false);
		preparedStatement =connection.prepareStatement(deleteQuery);
		preparedStatement.setInt(1, itemId);
		result=preparedStatement.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(result>0) {
		try {
			connection.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			connection.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	
	return false;
}


@Override
	public List<MenuItems> getAllItems(int restaurant_id ,String search_text,int limit,int page) {
	
	int skip = (page -1)* limit;
	
	PreparedStatement preparedStatement =null;
	List<MenuItems> items = new ArrayList();
	ResultSet resultSet =null;
	String selectQuery=search_text ==null ? "SELECT * FROM menu_items where restaurant_id = ? order by created_At desc limit ? offset ?"
			: "SELECT * FROM menu_items where restaurant_id = ? and (name like ? or category like ? ) order by created_At desc limit ? offset ?";
	
	try {
		
		preparedStatement=connection.prepareStatement(selectQuery);
		if(search_text ==null)
		{
			preparedStatement.setInt(1, restaurant_id);
			preparedStatement.setInt(2, limit);
			preparedStatement.setInt(3, skip);
		}else {
			preparedStatement.setInt(1, restaurant_id);
			preparedStatement.setString(2, search_text);
			preparedStatement.setString(3, search_text);
			preparedStatement.setInt(4, limit);
			preparedStatement.setInt(5, skip);
		}
		resultSet=preparedStatement.executeQuery();
		while(resultSet.next()) {
			MenuItems item = new MenuItems();
			item.setItemId(resultSet.getInt("item_id"));
			 item.setRestaurantId(resultSet.getInt("restaurant_id"));
			 item.setName(resultSet.getString("name")); 
			 item.setDescription(resultSet.getString("description"));
			 item.setPrice(resultSet.getDouble("price")); 
			 item.setAvailable(resultSet.getInt("available"));
			 item.setCreatedAt(resultSet.getTimestamp("created_at"));
			 item.setCategory(resultSet.getString("category"));
			 item.setImg(resultSet.getString("img"));
			 items.add(item);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return items;
	}


    @Override
    	public int getMenuItemsCount(int restaurant_id,String search_text) {
    	PreparedStatement preparedStatement =null;
    	int count=0;
    	ResultSet resultSet =null;
    	String selectQuery=search_text ==null ? "SELECT count(*) FROM menu_items where restaurant_id = ?" : "SELECT count(*) FROM menu_items where restaurant_id = ? and (name like ? or category like ?)";
    	
    	try {
    		
    		preparedStatement=connection.prepareStatement(selectQuery);
    		if(search_text ==null)
    		{
    			preparedStatement.setInt(1, restaurant_id);
    		}else {
    			preparedStatement.setInt(1, restaurant_id);
    			preparedStatement.setString(2, search_text);
    			preparedStatement.setString(3, search_text);
    		}
    		resultSet=preparedStatement.executeQuery();
    		if(resultSet.next()) {
    			count = resultSet.getInt(1);
    			
    		}
    	} catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	return count;
    	}


//	public static void main(String[] args) {
//		MenuItems items =new MenuItems();
//		items.setRestaurantId(1);
//		items.setName("burger");
//		items.setDescription("it good pizza");
//		items.setPrice(350.55);
//		items.setAvailable(1);
//		items.setItemId(3);
//		MenuItemDAO dao = new MenuItemsImp();
//		System.out.println(dao.updateItem(items));
//	}

}
