package com.swiggy.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Reviews {

	private Integer reviewId;
	private  Integer userId;
	private Integer  restaurantId;
	private  Integer rating;
	private String comment;
	private Timestamp createdAt;

}
