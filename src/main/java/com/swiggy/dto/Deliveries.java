package com.swiggy.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Deliveries {

private Integer deliveryId;
private Integer orderId;
private Integer  partnerId;
private String  deliveryStatus;
private Timestamp assignedAt;
private Timestamp deliveredAt;

}
