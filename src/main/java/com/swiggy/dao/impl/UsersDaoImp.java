package com.swiggy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.swiggy.dao.UsersDao;
import com.swiggy.db.DBConnection;
import com.swiggy.dto.Users;

public class UsersDaoImp implements UsersDao{
	private Connection con;
	public UsersDaoImp() {
		this.con=DBConnection.getConnection();
	}
	@Override
	public Users insertUsers(Users u) {
   String insertQuery = "INSERT INTO USERS(NAME,EMAIL,PASSWORD,PHONE_NUMBER,ADDRESS,CREATED_AT)VALUES(?,?,?,?,?,sysdate())";
		int res = 0;
		
		PreparedStatement preparedStatement=null;
		try{
			preparedStatement = con.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, u.getName());
			preparedStatement.setString(2, u.getEmail());
			preparedStatement.setString(3, u.getPassword());
			preparedStatement.setString(4, u.getPhoneNumber());
			preparedStatement.setString(5, u.getAddress());
			res = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();;
		}
		
		if (res > 0) {
			
			try {
				ResultSet resultSet = preparedStatement.getGeneratedKeys();
				if (resultSet.next()) { 
					u.setUserId(resultSet.getInt(1));
					
	            }
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return u;
		} else {
			return null;
		}
	}
	@Override
	public boolean deleteUsers(Users u) {
		PreparedStatement preparedStatement=null;

		String deleteQuery="DELETE FROM  USERS WHERE USER_ID=?";
		int res=0;
		
		try {
			preparedStatement=con.prepareStatement(deleteQuery);
			
			preparedStatement.setInt(1, u.getUserId());
			
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
	public Users updateUsers(Users u) {
		PreparedStatement preparedStatement=null;

		String updateQuery="UPDATE USERS SET NAME=?,EMAIL=?,PASSWORD=?,PHONE_NUMBER=?,ADDRESS=? where USER_ID=?";
		int res=0;
		
		try {
			preparedStatement=con.prepareStatement(updateQuery);
			
			preparedStatement.setString(1,u.getName());
			preparedStatement.setString(2,u.getEmail());
			preparedStatement.setString(3,u.getPassword());
			preparedStatement.setString(4,u.getPhoneNumber());
			preparedStatement.setString(5,u.getAddress());
			preparedStatement.setInt(6, u.getUserId());
			res=preparedStatement.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			
			return u;
		}
		else {
			
			return null;
		}
	}
	@Override
	public Users getUser(int userId) {
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		Users u=null;
		
		String selectQuery="SELECT * FROM USERS WHERE USER_ID=?";

	
		try {
			preparedStatement=con.prepareStatement(selectQuery);
			preparedStatement.setInt(1, userId);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				u=new Users();
				u.setUserId(resultSet.getInt(1));
				u.setName(resultSet.getString(2));
				u.setEmail(resultSet.getString(3));
				u.setPassword(resultSet.getString(4));
				u.setPhoneNumber(resultSet.getString(5));
				u.setAddress(resultSet.getString(6));
				u.setCreatedAt(resultSet.getTimestamp(7));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}
	@Override
	public List<Users> getUsers() {
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		Users u=null;
ArrayList<Users> al=new ArrayList<Users>();
		
		String  selectQuery="SELECT * FROM USERS ";
	
		try {
			preparedStatement=con.prepareStatement(selectQuery);
			
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				u=new Users();
				u.setUserId(resultSet.getInt(1));
				u.setName(resultSet.getString(2));
				u.setEmail(resultSet.getString(3));
				u.setPassword(resultSet.getString(4));
				u.setPhoneNumber(resultSet.getString(5));
				u.setAddress(resultSet.getString(6));
				u.setCreatedAt(resultSet.getTimestamp(7));
				al.add(u);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;	
	}
	public Users getUser(String email) {
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		Users u=null;
		
		String selectQuery="SELECT * FROM USERS WHERE EMAIL=?";

	
		try {
			preparedStatement=con.prepareStatement(selectQuery);
			preparedStatement.setString(1, email);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				u=new Users();
				u.setUserId(resultSet.getInt(1));
				u.setName(resultSet.getString(2));
				u.setEmail(resultSet.getString(3));
				u.setPassword(resultSet.getString(4));
				u.setPhoneNumber(resultSet.getString(5));
				u.setAddress(resultSet.getString(6));
				u.setCreatedAt(resultSet.getTimestamp(7));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}
	
	

}
