package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.*;

public interface RestaurantsDao{
	public  Restaurants insertRestaurant( Restaurants r);
	public boolean deleteRestaurant(Restaurants r);
	public  Restaurants updateRestaurant(Restaurants r);
	public  Restaurants getRestaurant(int restaurantsId);
	public List<Restaurants> getRestaurants();
	public  Restaurants getRestaurant(String email);

}
