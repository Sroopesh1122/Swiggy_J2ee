package com.swiggy.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuItems {

	private Integer  itemId;
	private  Integer  restaurantId;
	private String name;
	private String description;
	private Double price;
	private Integer available;
	private Timestamp createdAt;
	private String category;
	private String  img;
	private Double rating;
	private int reviewCount;

}
