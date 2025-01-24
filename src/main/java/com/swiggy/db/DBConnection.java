package com.swiggy.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.app.utils.AppProperties;

public class DBConnection {

   static String url =AppProperties.get("DB_URL");
	static String username = AppProperties.get("DB_USERNAME");
	static String password = AppProperties.get("DB_PASSWORD");
	static Connection conn = null;

	public static Connection getConnection() {

		if (conn == null) 
		{
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, username, password);
			} catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
			}
		}
		return conn;
	}
	
}
