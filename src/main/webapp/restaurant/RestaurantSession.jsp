<%@page import="com.swiggy.dto.Restaurants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
  
 Restaurants restaurants =(Restaurants) session.getAttribute("restaurants");
 
 if(restaurants == null)
 {
	 System.out.println(restaurants);
 }else{
	 System.out.println(restaurants); 
 }
 
 %>
    