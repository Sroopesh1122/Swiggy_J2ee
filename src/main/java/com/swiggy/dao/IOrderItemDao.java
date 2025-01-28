package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.OrderItems;

public interface IOrderItemDao 
{
  public OrderItems addItem(OrderItems orderItem);
  public OrderItems getById(int orderId);
  public boolean deleteByOrderId(int orderId);
  
 
}
