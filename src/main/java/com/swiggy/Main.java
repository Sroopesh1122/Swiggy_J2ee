package com.swiggy;

import java.sql.Connection;

import com.swiggy.db.DBConnection;

public class Main 
{
  public static void main(String[] args) {
	 
	  Connection connection = DBConnection.getConnection();
	  System.out.println(connection);
	  
  }
}
