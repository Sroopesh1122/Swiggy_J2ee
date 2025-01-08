package com.swiggy.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItems {

	private Integer  orderItemId;
	private Integer orderId;
	private Integer itemId;
	private Integer quantity;
	private Double  price;

}
