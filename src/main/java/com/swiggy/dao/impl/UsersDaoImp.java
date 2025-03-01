package com.swiggy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
     String insertQuery = "INSERT INTO USERS(NAME,EMAIL,PASSWORD,PHONE_NUMBER,ADDRESS,CREATED_AT)VALUES(?,?,?,?,?,?)";
		int res = 0;
		
		PreparedStatement preparedStatement=null;
		try{
			preparedStatement = con.prepareStatement(insertQuery,Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, u.getName());
			preparedStatement.setString(2, u.getEmail());
			preparedStatement.setString(3, u.getPassword());
			preparedStatement.setString(4, u.getPhoneNumber());
			preparedStatement.setString(5, u.getAddress());
			preparedStatement.setTimestamp(6, u.getCreatedAt());
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
			con.setAutoCommit(false);
			preparedStatement=con.prepareStatement(deleteQuery);
			
			preparedStatement.setInt(1, u.getUserId());
			
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
	public Users updateUsers(Users u) {
		PreparedStatement preparedStatement=null;

		String updateQuery="UPDATE USERS SET NAME=?,EMAIL=?,PASSWORD=?,PHONE_NUMBER=?,ADDRESS=? where USER_ID=?";
		int res=0;
		
		try {
			con.setAutoCommit(false);
			preparedStatement=con.prepareStatement(updateQuery);
			
			preparedStatement.setString(1,u.getName());
			preparedStatement.setString(2,u.getEmail());
			preparedStatement.setString(3,u.getPassword());
			preparedStatement.setString(4,u.getPhoneNumber());
			preparedStatement.setString(5,u.getAddress());
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
			return u;
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
	public Users getUsers(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Users> getUsers() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
