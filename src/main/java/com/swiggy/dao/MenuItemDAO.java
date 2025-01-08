package com.swiggy.dao;

public interface MenuItemDAO {
    void addMenuItem(MenuItem menuItem) throws SQLException;
    MenuItem getMenuItem(int itemId) throws SQLException;
    List<MenuItem> getAllMenuItems() throws SQLException;
    void updateMenuItem(MenuItem menuItem) throws SQLException;
    void deleteMenuItem(int itemId) throws SQLException;
}

