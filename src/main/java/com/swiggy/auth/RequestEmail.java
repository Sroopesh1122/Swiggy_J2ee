package com.swiggy.auth;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Getter
@Setter
public class RequestEmail
{
 private String email;
 private String otp;
 private LocalDateTime requestedAt;
 
}
