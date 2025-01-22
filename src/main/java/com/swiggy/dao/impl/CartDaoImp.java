package com.swiggy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.swiggy.dao.CartDAO;
import com.swiggy.db.DBConnection;
import com.swiggy.dto.Cart;

public class CartDaoImp implements CartDAO{

	private Connection connection;
	public CartDaoImp() {
		this.connection=DBConnection.getConnection();
		
	}
	
	
	@Override
	public Cart addCart(Cart cart) {
		PreparedStatement preparedStatement =null;
		String insertQuery="INSERT INTO CART (user_id, menu_id) VALUES (?, ?)";
		int result=0;
		try {
			preparedStatement=connection.prepareStatement(insertQuery);
			preparedStatement.setInt(1, cart.getUserId());
			preparedStatement.setInt(2, cart.getMenuId());
			result=preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			
			return cart;
		}
		
		return null;
	}
	@Override
	public Cart getCartById(int cartId) {
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		String selectQuery="SELECT * FROM CART WHERE CART_ID=?";
		Cart cart=null;
		try {
			preparedStatement =connection.prepareStatement(selectQuery);
			preparedStatement.setInt(1, cartId);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				cart = new Cart();
				cart.setCartId(resultSet.getInt("cart_id"));
				cart.setMenuId(resultSet.getInt("user_id"));
				cart.setUserId(resultSet.getInt("menu_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cart;
	}
	@Override
	public List<Cart> getAllCarts(int user_id) {
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		String selectQuery="SELECT * FROM CART WHERE USER_ID= ? ORDER BY CART_ID DESC ";
		List <Cart> carts= new ArrayList<Cart>();
		Cart cart=null;
		try {
			preparedStatement =connection.prepareStatement(selectQuery);
			preparedStatement.setInt(1, user_id);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				cart = new Cart();
				cart.setCartId(resultSet.getInt("cart_id"));
				cart.setMenuId(resultSet.getInt("menu_id"));
				cart.setUserId(resultSet.getInt("user_id"));
				carts.add(cart);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return carts;
	}
	@Override
	public boolean deleteById(int cartId) {
		PreparedStatement preparedStatement =null;
		int result=0;
		String deletequery = "DELETE FROM CART WHERE CART_ID = ?";
		try {
			preparedStatement  =connection.prepareStatement(deletequery);
			preparedStatement.setInt(1, cartId);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			return true;
		}
		return false;
	}
	
	
	//To check for existance of menu_item	
	
	@Override
	public boolean lookCart(int menu_id, int user_id) {
		 
		String lookQuery = "SELECT * FROM CART WHERE USER_ID = ? AND MENU_ID = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(lookQuery);
			preparedStatement.setInt(1, user_id);
			preparedStatement.setInt(2, menu_id);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next())
			{
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	@Override
	public int getCartItemCountByUser(int user_id) {
		int count=0;
		String lookQuery = "SELECT COUNT(*) FROM CART WHERE USER_ID = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(lookQuery);
			preparedStatement.setInt(1, user_id);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next())
			{
				count = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	
	
	
	
	

}
