package com.swiggy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.swiggy.dao.RestaurantsDao;
import com.swiggy.db.DBConnection;
import com.swiggy.dto.Restaurants;
import com.swiggy.dto.Users;

public class RestaurantsDaoImp implements RestaurantsDao{
	private Connection con;
	public RestaurantsDaoImp() {
		this.con=DBConnection.getConnection();
	}
	@Override
	public Restaurants insertRestaurant(Restaurants r) {
		String insertQuery="INSERT INTO RESTAURANTS(NAME,ADDRESS,PHONE_NUMBER,RATING,CREATED_AT,PASSWORD,EMAIL)VALUES(?,?,?,?,?,?,?)";
		
           int res = 0;
		
		PreparedStatement preparedStatement=null;
		try{
			preparedStatement = con.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, r.getName());
			preparedStatement.setString(2, r.getAddress());
			preparedStatement.setString(3, r.getPhoneNumber());
			preparedStatement.setDouble(4, r.getRating());
		    preparedStatement.setTimestamp(5, r.getCreatedAt());
		    preparedStatement.setString(6, r.getPassword());
		    preparedStatement.setString(7, r.getEmail());
			res = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();;
		}
		
		if (res > 0) {
			
			try {
				ResultSet resultSet = preparedStatement.getGeneratedKeys();
				if (resultSet.next()) { 
					r.setRestaurantsId(resultSet.getInt(1));
	            }
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return r;
		} else {
			return null;
		}
	}

	@Override
	public boolean deleteRestaurant(Restaurants r) {
		PreparedStatement preparedStatement=null;

		String deleteQuery="DELETE FROM  RESTAURANTS WHERE RESTAURANTSId=?";
		int res=0;
		
		try {
			con.setAutoCommit(false);
			preparedStatement=con.prepareStatement(deleteQuery);
			
			preparedStatement.setInt(1, r.getRestaurantsId());
			
			res=preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return true;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
	}

	@Override
	public Restaurants updateRestaurant(Restaurants r) {
		PreparedStatement preparedStatement=null;

		String updateQuery="UPDATE RESTAURANTS SET NAME=?,ADDRESS=?,PHONE_NUMBER=?,RATING=?,CREATED_AT=?,PASSWORD=?,EMAIL=? WHERE RESTAURANT_Id=?";
		int res=0;
		
		try {
			con.setAutoCommit(false);
			preparedStatement=con.prepareStatement(updateQuery);
			
			preparedStatement.setString(1,r.getName());
			preparedStatement.setString(2,r.getAddress());
			preparedStatement.setString(3,r.getPhoneNumber());
			preparedStatement.setDouble(4,r.getRating());
			preparedStatement.setTimestamp(5, r.getCreatedAt());
		    preparedStatement.setString(6, r.getPassword());
		    preparedStatement.setString(7, r.getEmail());
			res=preparedStatement.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return r;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
	}

	@Override
	public Restaurants getRestaurant(int restaurantsId) {
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		Restaurants r=null;
		
		String selectQuery="SELECT * FROM RESTAURANTS WHERE RESTAURANT_Id=?";

	
		try {
			preparedStatement=con.prepareStatement(selectQuery);
			preparedStatement.setInt(1, restaurantsId);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				r=new Restaurants();
				r.setRestaurantsId(resultSet.getInt(1));
				r.setName(resultSet.getString(2));
				r.setPhoneNumber(resultSet.getString(3));
				r.setRating(resultSet.getDouble(4));
				r.setCreatedAt(resultSet.getTimestamp(5));
				r.setEmail(resultSet.getString(6));
				r.setPassword(resultSet.getString(7));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

	@Override
	public List<Restaurants> getRestaurants() {
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		Restaurants r=null;
		ArrayList<Restaurants> al=new ArrayList<Restaurants>();
		String selectQuery="SELECT * FROM RESTAURANTS";

	
		try {
			preparedStatement=con.prepareStatement(selectQuery);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				r=new Restaurants();
				r.setRestaurantsId(resultSet.getInt(1));
				r.setName(resultSet.getString(2));
				r.setPhoneNumber(resultSet.getString(3));
				r.setRating(resultSet.getDouble(4));
				r.setCreatedAt(resultSet.getTimestamp(5));
				r.setEmail(resultSet.getString(6));
				r.setPassword(resultSet.getString(7));
				al.add(r);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}
	@Override
	public Restaurants getRestaurant(String email) {
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		Restaurants r=null;
		
		String selectQuery="SELECT * FROM RESTAURANTS WHERE EMAIL=?";

	
		try {
			preparedStatement=con.prepareStatement(selectQuery);
			preparedStatement.setString(1, email);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				r=new Restaurants();
				r.setRestaurantsId(resultSet.getInt(1));
				r.setName(resultSet.getString(2));
				r.setPhoneNumber(resultSet.getString(3));
				r.setRating(resultSet.getDouble(4));
				r.setCreatedAt(resultSet.getTimestamp(5));
				r.setEmail(resultSet.getString(6));
				r.setPassword(resultSet.getString(7));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

}
