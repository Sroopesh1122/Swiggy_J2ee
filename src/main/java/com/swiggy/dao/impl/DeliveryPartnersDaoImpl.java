package com.swiggy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.swiggy.dao.DeliveryPartnersDAO;
import com.swiggy.db.DBConnection;
import com.swiggy.dto.DeliveryPartners;
import com.swiggy.dto.Users;

public class DeliveryPartnersDaoImpl implements DeliveryPartnersDAO {
	private Connection con;
	public DeliveryPartnersDaoImpl() {
		
		this.con=DBConnection.getConnection();
	}

	@Override
	public DeliveryPartners insertDeliveryPartners(DeliveryPartners d) {
		String insertQuery = "INSERT INTO delivery_partners(NAME,EMAIL,PASSWORD,PHONE_NUMBER,vehicle_details,CREATED_AT)VALUES(?,?,?,?,?,sysdate())";
		int res = 0;
		
		PreparedStatement preparedStatement=null;
		try{
			preparedStatement = con.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, d.getName());
			preparedStatement.setString(2, d.getEmail());
			preparedStatement.setString(3, d.getPassword());
			preparedStatement.setString(4, d.getPhoneNumber());
			preparedStatement.setString(5, d.getVehicleDetails());
			res = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();;
		}
		
		if (res > 0) {
			
			try {
				ResultSet resultSet = preparedStatement.getGeneratedKeys();
				if (resultSet.next()) { 
					d.setPartnerId(resultSet.getInt(1));
	            }
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return d;
		} else {
			return null;
		}
		
	}

	@Override
	public boolean deleteDeliveryPartners(DeliveryPartners d) {
		PreparedStatement preparedStatement=null;

		String deleteQuery="DELETE FROM  delivery_partners WHERE partner_id=?";
		int res=0;
		
		try {
			preparedStatement=con.prepareStatement(deleteQuery);
			
			preparedStatement.setInt(1, d.getPartnerId());
			
			res=preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			
			return true;
		}
		else {
			
			return false;
		}

	}

	@Override
	public DeliveryPartners updateDeliveryPartners(DeliveryPartners d) {
		PreparedStatement preparedStatement=null;

		String updateQuery="UPDATE delivery_partners SET NAME=?,EMAIL=?,PASSWORD=?, PHONE_NUMBER=?, vehicle_details=? where partner_id=?";
		int res=0;
		
		try {
			preparedStatement=con.prepareStatement(updateQuery);
			
			preparedStatement.setString(1,d.getName());
			preparedStatement.setString(2,d.getEmail());
			preparedStatement.setString(3,d.getPassword());
			preparedStatement.setString(4,d.getPhoneNumber());
			preparedStatement.setString(5,d.getVehicleDetails());
			preparedStatement.setInt(6, d.getPartnerId());
			res=preparedStatement.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			
			return d;
		}
		else {
			
			return null;
		}
	}

	@Override
	public DeliveryPartners getDeliveryPartners(String email) {
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		DeliveryPartners d=null;
		
		String selectQuery="SELECT * FROM delivery_partners WHERE EMAIL=?";

	
		try {
			preparedStatement=con.prepareStatement(selectQuery);
			preparedStatement.setString(1, email);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				d= new DeliveryPartners();
				d.setPartnerId(resultSet.getInt(1));
				d.setName(resultSet.getString(2));
				d.setPhoneNumber(resultSet.getString(3));
				d.setVehicleDetails(resultSet.getString(4));
				d.setCreatedAt(resultSet.getTimestamp(5));
				d.setEmail(resultSet.getString(6));
				d.setPassword(resultSet.getString(7));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return d;
	}
	
		

	@Override
	public DeliveryPartners getDeliveryPartners(int deliveryPartnerId) {
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		DeliveryPartners d=null;
		
		String selectQuery="SELECT * FROM delivery_partners WHERE partner_id=?";

	
		try {
			preparedStatement=con.prepareStatement(selectQuery);
			preparedStatement.setInt(1, deliveryPartnerId);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				d= new DeliveryPartners();
				d.setPartnerId(resultSet.getInt(1));
				d.setName(resultSet.getString(2));
				d.setPhoneNumber(resultSet.getString(3));
				d.setVehicleDetails(resultSet.getString(4));
				d.setCreatedAt(resultSet.getTimestamp(5));
				d.setEmail(resultSet.getString(6));
				d.setPassword(resultSet.getString(7));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public List<DeliveryPartners> getDeliveryPartners() {
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		DeliveryPartners d=null;
		ArrayList<DeliveryPartners> al=new ArrayList<>();
		
		String selectQuery="SELECT * FROM delivery_partners";

	
		try {
			preparedStatement=con.prepareStatement(selectQuery);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				d= new DeliveryPartners();
				d.setPartnerId(resultSet.getInt(1));
				d.setName(resultSet.getString(2));
				d.setPhoneNumber(resultSet.getString(3));
				d.setVehicleDetails(resultSet.getString(4));
				d.setCreatedAt(resultSet.getTimestamp(5));
				d.setEmail(resultSet.getString(6));
				d.setPassword(resultSet.getString(7));
				al.add(d);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}

	
	
	
}
