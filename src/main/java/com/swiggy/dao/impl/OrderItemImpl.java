package com.swiggy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.swiggy.dao.IOrderItemDao;
import com.swiggy.db.DBConnection;
import com.swiggy.dto.OrderItems;

public class OrderItemImpl implements IOrderItemDao {

	Connection connection = null;
	
	public OrderItemImpl() {
		connection = DBConnection.getConnection();
	}
	
	
	@Override
	public OrderItems addItem(OrderItems orderItem) {
		
		String insertQuery = "INSERT INTO ORDER_ITEMS (ORDER_ID , ITEM_ID,QUANTITY,PRICE) VALUES (?,?,?,?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setInt(1, orderItem.getOrderId());
			preparedStatement.setInt(2, orderItem.getItemId());
			preparedStatement.setInt(3, orderItem.getQuantity());
			preparedStatement.setDouble(4, orderItem.getPrice());
			
			if(preparedStatement.executeUpdate() > 0)
			{
				ResultSet resultSet = preparedStatement.getGeneratedKeys();
				if(resultSet.next())
				{
					orderItem.setOrderItemId(resultSet.getInt(1));
					return orderItem;
				}
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	@Override
	public OrderItems getById(int orderId) {
		
		String getQuery = " SELECT * FROM ORDER_ITEMS WHERE ORDER_ID = ? ";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(getQuery);
			preparedStatement.setInt(1, orderId);
			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next())
			{
				OrderItems orderItem = new OrderItems();
				orderItem.setOrderItemId(resultSet.getInt(1));
				orderItem.setOrderId(resultSet.getInt(2));
				orderItem.setItemId(resultSet.getInt(3));
				orderItem.setQuantity(resultSet.getInt(4));
				orderItem.setPrice(resultSet.getDouble(5));
				return orderItem;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return null;
	}
	
	@Override
	public boolean deleteByOrderId(int orderId) {

		String deleteQuery = "DELETE FROM order_items WHERE order_id = ?";
		PreparedStatement preparedStatement = null;
		int result = 0;
		try {
			preparedStatement = connection.prepareStatement(deleteQuery);
			preparedStatement.setInt(1,orderId);
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (result > 0) {
			return true;
		}
		return false;
	}

}
