package com.swiggy.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class Restaurants {

	private Integer restaurantsId;
	private String name;
	private String address;
	private String phoneNumber;
	private Double  rating;
	private Timestamp  createdAt;
	

}
