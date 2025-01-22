package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.Orders;



public interface OrderDAO {
   public Orders insertOrder(Orders orders);
  public  Orders getOrderById(int orderId);
  public  List<Orders> getAllOrders();
  public boolean updateOrder(Orders order);
  public boolean deleteOrder(int orderId);
  
  
  
  //For Users
  //To get list of orders by user_id with limit page
  public List<Orders> getOrderByUserId(int user_id,int page,int limit,String status);
  //To get total orders count by userId
  public int getOrderByUserId(int user_id,String status);
  
  
  //For Restaurants
  public List<Orders> getOrderByRestaurantId(int restaurant_id,int page,int limit,String status);
  //To get total orders count by userId
  public int getOrderByRestaurantId(int restaurant_id,String status);
  
  
  
  
  //For Delivery Partners
  
  //Look for Orders by location which are not picked by others and are prepared
  public List<Orders> getOrderdByAddress(String address,int page,int limit);
  public int getOrderdCountByAddress(String address);
  
  //To get pending and delivered order 
  
  public List<Orders> getOrderdByStatus(String status,int deliveryPartner,int page,int limit);
  public int getOrderdCountByStatus(String status,int deliveryPartner);
  
  
  
  
}
