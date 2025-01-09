package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.MenuItems;

public interface MenuItemDAO {
	public MenuItems addItem(MenuItems item);
   public  MenuItems getItemById(int itemId);
  public   List<MenuItems> getAllItems();
   public  MenuItems updateItem(MenuItems item);
 public    boolean deleteItem(int itemId);
}

