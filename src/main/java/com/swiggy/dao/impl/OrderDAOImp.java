package com.swiggy.dao.impl;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.swiggy.dao.OrderDAO;
import com.swiggy.db.DBConnection;
import com.swiggy.dto.Orders;

public class OrderDAOImp  implements OrderDAO{
private Connection connection;
	public OrderDAOImp() {
		this.connection=DBConnection.getConnection();
		
	}
	@Override
	public Orders insertOrder(Orders orders) {
		PreparedStatement preparedStatement=null;
		int result =0;
		String insertQuery="INSERT INTO orders (user_id, restaurant_id, total_amount, status, created_at) VALUES (?, ?, ?, ?, now())";
		try {
			preparedStatement=connection.prepareStatement(insertQuery);
			preparedStatement.setInt(1, orders.getUserId());
			preparedStatement.setInt(2, orders.getRestaurantId());
			preparedStatement.setDouble(3, orders.getTotalAmount());
			preparedStatement.setString(4, orders.getStatus());

			result=preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result >0) {
			return null;
		}
		return orders;
	}
	@Override
	public Orders getOrderById(int orderId) {
String selectQuery="select * from where  order_id=?";
PreparedStatement preparedStatement=null;
ResultSet resultSet =null;
Orders order=null;

try {
	preparedStatement=connection.prepareStatement(selectQuery);
	preparedStatement.setInt(1, orderId);
	resultSet=preparedStatement.executeQuery();
if(resultSet.next()) {
	order= new Orders();
	order.setOrderId(resultSet.getInt(1));
	order.setUserId(resultSet.getInt(2));
	order.setRestaurantId(resultSet.getInt(3));
	order.setTotalAmount(resultSet.getDouble(4));
	order.setStatus(resultSet.getString(5));
	order.setCreatedAt(resultSet.getTimestamp(6));
}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

		return order;
	}
	@Override
	public List<Orders> getAllOrders() {
	List<Orders> orders =new ArrayList<Orders>() ;
	PreparedStatement  preparedStatement=null;
	ResultSet resultSet =null;
	String selectQuery="select * from orders";
	try {
		preparedStatement =connection.prepareStatement(selectQuery);
		resultSet  =preparedStatement.executeQuery();
		while(resultSet.next()) {
			Orders order= new Orders();
			order.setOrderId(resultSet.getInt(1));
			order.setUserId(resultSet.getInt(2));
			order.setRestaurantId(resultSet.getInt(3));
			order.setTotalAmount(resultSet.getDouble(4));
			order.setStatus(resultSet.getString(5));
			order.setCreatedAt(resultSet.getTimestamp(6));
			orders.add(order);
		
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
		return orders;
	}
	@Override
	public boolean updateOrder(Orders order) {
		 String updateSql = "UPDATE orders SET user_id = ?, restaurant_id = ?, total_amount = ?, status = ?, created_at = ? WHERE order_id = ?";
		PreparedStatement preparedStatement=null;
		int resultSet=0;
		try {
			preparedStatement =connection.prepareStatement(updateSql);
			preparedStatement.setInt(1, order.getOrderId());
			resultSet=preparedStatement.executeUpdate();
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(resultSet>0) {
			return true;
		}
		 return false;
	}
	@Override
	public boolean deleteOrder(int orderId) {
		String deleteQuery = "DELETE FROM orders WHERE order_id = ?";
			PreparedStatement preparedStatement=null;
			int result=0;
			try {
				preparedStatement  =connection.prepareStatement(deleteQuery);
				preparedStatement.setInt(1, orderId);
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

	
	
	
	
	
	
	
	
	


}
