package com.swiggy.dao;

import com.swiggy.dto.OrderItems;

public interface IOrderItemDao 
{
  public OrderItems addItem(OrderItems orderItem);
  public OrderItems getById(int orderId);
}
