package com.swiggy.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {

	private Integer cartId;
	private Integer userId;
	private Integer  menuId;
}
