package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.MenuItems;

public interface MenuItemDAO {
	public MenuItems addItem(MenuItems item);
    public MenuItems getItemById(int itemId);
    public List<MenuItems> getAllItems();
    public List<MenuItems> getAllItems(int restaurant_id,String search_text,int limit ,int page);
    public int getMenuItemsCount(int restaurant_id,String search_text);
    public MenuItems updateItem(MenuItems item);
    public boolean deleteItem(int itemId);
}

