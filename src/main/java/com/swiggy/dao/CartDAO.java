package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.Cart;

public interface CartDAO {
   public  Cart addCart(Cart cart) ;
   public  Cart getCartById(int cartId) ;
   public  List<Cart> getAllCarts() ;
   public boolean deleteById(int cartId);
}

