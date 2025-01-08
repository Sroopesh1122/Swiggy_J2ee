package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.Orders;



public interface OrderDAO {
   public Orders insertOrder(Orders orders);
  public  Orders getOrderById(int orderId);
  public  List<Orders> getAllOrders();
  public Orders updateOrder(Orders order);
  public boolean deleteOrder(int orderId);
}
