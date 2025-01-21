package com.swiggy.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Orders {

private Integer orderId;
private Integer userId;
private Integer restaurantId;
private Double totalAmount;
private String status;
private Timestamp createdAt;
private String pay_mode;
private String deliveryAddress;
private int reveiwed;
private int pickedBy;
}
