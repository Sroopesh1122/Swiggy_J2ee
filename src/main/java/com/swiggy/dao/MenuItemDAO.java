package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.MenuItems;
import com.swiggy.dto.OrderItems;

public interface MenuItemDAO {
	public MenuItems addItem(MenuItems item);
    public MenuItems getItemById(int itemId);
    public List<MenuItems> getAllItems();
    public List<MenuItems> getAllItems(int restaurant_id,String search_text,int limit ,int page);
    public int getMenuItemsCount(int restaurant_id,String search_text);
    public MenuItems updateItem(MenuItems item);
    public boolean deleteItem(int itemId);
    
    //Sort for customer
    public List<MenuItems> getAllItems(String search_text,int limit ,int page);
    public int getMenuItemsCount(String search_text);
    
    
    //To get Similar Food Items
    
    public List<MenuItems> getAllItems(int menu_id,int limit ,int page);
    
  //To get Top 5 trending food orders
    public List<MenuItems> getTrendingFoodItems();
    
}

