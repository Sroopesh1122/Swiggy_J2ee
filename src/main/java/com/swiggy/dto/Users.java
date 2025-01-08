package com.swiggy.dto;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Users {

	private Integer userId;
	private  String name;
	private   String email;
	private String password;
	private String phoneNumber;
	private  String address;
	private Timestamp createdAt;

}
