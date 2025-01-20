package com.swiggy.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryPartners {

	private Integer partnerId;
	private String name;
	private String phoneNumber;
	private  String vehicleDetails;
	private Timestamp createdAt;
	private String email;
	private String password;

}
