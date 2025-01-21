package com.swiggy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.swiggy.dao.DeliveryDAO;
import com.swiggy.db.DBConnection ;
import com.swiggy.dto.Deliveries;

public class DeliveryDAOImp implements DeliveryDAO{
public Connection connection;
	public DeliveryDAOImp() {
		this.connection=DBConnection.getConnection();
	}
	@Override
	public Deliveries addDelivery(Deliveries delivery) {
		PreparedStatement preparedStatement =null;
		String insertquery = "INSERT INTO deliveries (order_id, partner_id, delivery_status, assigned_at, delivered_at) VALUES (?, ?, ?, now(), ?)";
		int result=0;
		try {
			preparedStatement =connection.prepareStatement(insertquery);
			preparedStatement.setInt(1, delivery.getOrderId());
			preparedStatement.setInt(2, delivery.getPartnerId());
			preparedStatement.setString(3, delivery.getDeliveryStatus());
			preparedStatement.setTimestamp(4, delivery.getDeliveredAt());
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result >0) {
			
			return delivery;
		}
		return null;
	}
	
	@Override
		public Deliveries getDeliveryByOrderId(int orderId) {
		PreparedStatement preparedStatement =null;
		ResultSet resultSet=null;
		Deliveries delivery =null;
		String selectQuery="SELECT * FROM deliveries WHERE order_id = ?";
		try {
		
			preparedStatement =connection.prepareStatement(selectQuery);
			preparedStatement.setInt(1, orderId);
			resultSet =preparedStatement.executeQuery();
			if(resultSet.next()) {
				delivery = new Deliveries();
				delivery.setDeliveryId(resultSet.getInt("delivery_id")); 
				delivery.setOrderId(resultSet.getInt("order_id"));
				delivery.setPartnerId(resultSet.getInt("partner_id"));
				delivery.setDeliveryStatus(resultSet.getString("delivery_status"));
				delivery.setAssignedAt(resultSet.getTimestamp("assigned_at")); 
				delivery.setDeliveredAt(resultSet.getTimestamp("delivered_at")); 
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return delivery;
		}
	
	
	@Override
	public Deliveries getDeliveryById(int deliveryId) {
		PreparedStatement preparedStatement =null;
		ResultSet resultSet=null;
		Deliveries delivery =null;
		String selectQuery="SELECT * FROM deliveries WHERE delivery_id = ?";
		try {
		
			preparedStatement =connection.prepareStatement(selectQuery);
			preparedStatement.setInt(1, deliveryId);
			resultSet =preparedStatement.executeQuery();
			while(resultSet.next()) {
				delivery.setDeliveryId(resultSet.getInt("delivery_id")); 
				delivery.setOrderId(resultSet.getInt("order_id"));
				delivery.setPartnerId(resultSet.getInt("partner_id"));
				delivery.setDeliveryStatus(resultSet.getString("delivery_status"));
				delivery.setAssignedAt(resultSet.getTimestamp("assigned_at")); 
				delivery.setDeliveredAt(resultSet.getTimestamp("delivered_at")); 
				return delivery;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return delivery;
	}
	@Override
	public List<Deliveries> getAllDeliveries() {
		PreparedStatement preparedStatement =null;
		ResultSet resultSet=null;
		Deliveries delivery =null;
		String selectQuery="SELECT * FROM deliveries ";
		List<Deliveries> deliveries=new  ArrayList();
		try {
			preparedStatement = connection.prepareStatement(selectQuery);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				delivery = new Deliveries();
				delivery.setDeliveryId(resultSet.getInt("delivery_id")); 
				delivery.setOrderId(resultSet.getInt("order_id"));
				delivery.setPartnerId(resultSet.getInt("partner_id"));
				delivery.setDeliveryStatus(resultSet.getString("delivery_status"));
				delivery.setAssignedAt(resultSet.getTimestamp("assigned_at")); 
				delivery.setDeliveredAt(resultSet.getTimestamp("delivered_at")); 
				deliveries.add(delivery);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return deliveries;
	}
	
	@Override
	public boolean deleteDelivery(int deliveryId) {
		PreparedStatement   preparedStatement =null;
		int result=0;
		String deleteQuery = "DELETE FROM deliveries WHERE delivery_id = ?";
		try {
			connection.setAutoCommit(false);
			preparedStatement=connection.prepareStatement(deleteQuery);
			preparedStatement.setInt(1, deliveryId);
			result=preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result >0) {
			try {
				connection.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		try {
			connection.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
//public static void main(String[] args) {
//	Deliveries delivery = new Deliveries(); // Set the fields 
//	delivery.setDeliveryId(1); 
//	delivery.setOrderId(101);
//	delivery.setPartnerId(202); 
//	delivery.setDeliveryStatus("Assigned");
//	delivery.setAssignedAt(new Timestamp(System.currentTimeMillis())); 
//	delivery.setDeliveredAt(null);
//	DeliveryDAO  dao = new DeliveryDAOImp();
//	System.out.println(dao.addDelivery(delivery));
//}
	@Override
	public Deliveries updateDelivery(Deliveries delivery) {
		PreparedStatement preparedStatement = null;
		String updateQuery = "UPDATE deliveries SET  delivery_status = ? , delivered_at = ? WHERE delivery_id = ?";
		int result = 0;
		try {
			preparedStatement = connection.prepareStatement(updateQuery);
			preparedStatement.setString(1, delivery.getDeliveryStatus());
			preparedStatement.setTimestamp(2, delivery.getDeliveredAt());
			preparedStatement.setInt(3, delivery.getDeliveryId());
			result = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (result > 0) {
			return delivery;
		}
		return null;
	}
}
