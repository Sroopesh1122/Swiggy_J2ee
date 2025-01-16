package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.Cart;

public interface CartDAO {
   public  Cart addCart(Cart cart) ;
   public  Cart getCartById(int cartId) ;
   
   //Get all cart item by userId
   public  List<Cart> getAllCarts(int user_id) ;
   public boolean deleteById(int cartId);
   
   
   //to check wheather that item in present in sepecific user cart or not
   public boolean lookCart (int menu_id,int user_id);
   
   //TO get Count of cart items by user_id;
   
   public int getCartItemCountByUser(int user_id);
   
   
   
}

