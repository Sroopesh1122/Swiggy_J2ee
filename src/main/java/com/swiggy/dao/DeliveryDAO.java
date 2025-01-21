package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.Deliveries;

public interface DeliveryDAO {
   
   public  Deliveries addDelivery(Deliveries delivery);

 
  public   Deliveries getDeliveryById(int deliveryId);

   
  public   List<Deliveries> getAllDeliveries();

    
  public   Deliveries updateDelivery(Deliveries delivery);

   
  public  boolean deleteDelivery(int deliveryId);
  
  
  
  public   Deliveries getDeliveryByOrderId(int orderId);
}

