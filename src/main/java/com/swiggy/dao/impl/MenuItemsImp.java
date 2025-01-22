package com.swiggy.dao.impl;

import java.awt.Menu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.openssl.pem_password_cb;

import com.swiggy.dao.MenuItemDAO;
import com.swiggy.db.DBConnection;
import com.swiggy.dto.MenuItems;

public class MenuItemsImp implements MenuItemDAO
{
private Connection connection;
public MenuItemsImp() {
	this.connection=DBConnection.getConnection();
}
@Override
public MenuItems addItem(MenuItems item) {
	PreparedStatement preparedStatement=null;
	int result=0;
	String  insertQuery="INSERT INTO menu_items (restaurant_id, name, description, price, available,created_at,category,img) VALUES (?, ?, ?, ?, ?,now(),?,?)";
	try {
		preparedStatement=connection.prepareStatement(insertQuery);
		preparedStatement.setInt(1, item.getRestaurantId()); 
		preparedStatement.setString(2, item.getName()); 
		preparedStatement.setString(3, item.getDescription());
		preparedStatement.setDouble(4, item.getPrice()); 
		preparedStatement.setInt(5, item.getAvailable());
		preparedStatement.setString(6, item.getCategory());
		preparedStatement.setString(7, item.getImg());
		result=preparedStatement.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(result>0) {
		
		return item;
	}
	return null;
}
@Override
public MenuItems getItemById(int itemId) {
	PreparedStatement preparedStatement =null;
	ResultSet resultSet =null;
	MenuItems item=null;
	String selectQuery="SELECT * FROM menu_items  WHERE item_id = ?";
	try {
		preparedStatement=connection.prepareStatement(selectQuery);
		preparedStatement.setInt(1, itemId);
		resultSet=preparedStatement.executeQuery();
		while (resultSet.next()) {
			 item = new MenuItems(); 
			 item.setItemId(resultSet.getInt("item_id"));
			 item.setRestaurantId(resultSet.getInt("restaurant_id"));
			 item.setName(resultSet.getString("name")); 
			 item.setDescription(resultSet.getString("description"));
			 item.setPrice(resultSet.getDouble("price")); 
			 item.setAvailable(resultSet.getInt("available"));
			 item.setCreatedAt(resultSet.getTimestamp("created_at"));
			 item.setCategory(resultSet.getString("category"));
			 item.setImg(resultSet.getString("img"));
			 item.setRating(resultSet.getDouble("rating"));
			 item.setReviewCount(resultSet.getInt("reviews_count"));
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return item;
}
@Override
public List<MenuItems> getAllItems() {
	PreparedStatement preparedStatement =null;
	List<MenuItems> items = new ArrayList();
	ResultSet resultSet =null;
	String selectQuery="SELECT * FROM menu_items";
	
	try {
		
		preparedStatement=connection.prepareStatement(selectQuery);
		resultSet=preparedStatement.executeQuery();
		while(resultSet.next()) {
			MenuItems item = new MenuItems();
			item.setItemId(resultSet.getInt("item_id"));
			 item.setRestaurantId(resultSet.getInt("restaurant_id"));
			 item.setName(resultSet.getString("name")); 
			 item.setDescription(resultSet.getString("description"));
			 item.setPrice(resultSet.getDouble("price")); 
			 item.setAvailable(resultSet.getInt("available"));
			 item.setCreatedAt(resultSet.getTimestamp("created_at"));
			 item.setCategory(resultSet.getString("category"));
			 item.setImg(resultSet.getString("img"));
			 item.setRating(resultSet.getDouble("rating"));
			 items.add(item);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return items;
}
@Override
public MenuItems updateItem(MenuItems item) {
	PreparedStatement preparedStatement =null;
	int result=0;
	String updateQuery = "UPDATE menu_items SET restaurant_id = ?, name = ?, description = ?, price = ?, available = ?,category = ? ,rating =? , reviews_count = ?  WHERE item_id = ?";
	try {
		preparedStatement =connection.prepareStatement(updateQuery);
		preparedStatement.setInt(1, item.getRestaurantId()); 
		preparedStatement.setString(2, item.getName()); 
		preparedStatement.setString(3, item.getDescription());
		preparedStatement.setDouble(4, item.getPrice()); 
		preparedStatement.setInt(5, item.getAvailable());
		preparedStatement.setString(6, item.getCategory());
		preparedStatement.setDouble(7, item.getRating());
		preparedStatement.setInt(8, item.getReviewCount());
		preparedStatement.setInt(9, item.getItemId()); 
		
	
		result=preparedStatement.executeUpdate();
	} catch (SQLException e) {
		
		
		e.printStackTrace();
	}
	if(result >0) {
		
		return item;
	}
	return null;
}
@Override
public boolean deleteItem(int itemId) {
	PreparedStatement preparedStatement =null;
	String deleteQuery = "DELETE FROM menu_items WHERE item_id = ?";
	int result=0;
	try {
		preparedStatement =connection.prepareStatement(deleteQuery);
		preparedStatement.setInt(1, itemId);
		result=preparedStatement.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(result>0) {
		
		return true;
	}
	
	return false;
}


@Override
	public List<MenuItems> getAllItems(int restaurant_id ,String search_text,int limit,int page) {
	
	
	int skip = (page -1)* limit;
	
	PreparedStatement preparedStatement =null;
	List<MenuItems> items = new ArrayList();
	ResultSet resultSet =null;
	String selectQuery=search_text ==null ? "SELECT * FROM menu_items where restaurant_id = ? order by created_At desc limit ? offset ?"
			: "SELECT * FROM menu_items where restaurant_id = ? and (name like ? or category like ? ) order by created_At desc limit ? offset ?";
	
	try {
		
		preparedStatement=connection.prepareStatement(selectQuery);
		if(search_text ==null)
		{
			preparedStatement.setInt(1, restaurant_id);
			preparedStatement.setInt(2, limit);
			preparedStatement.setInt(3, skip);
		}else {
			preparedStatement.setInt(1, restaurant_id);
			preparedStatement.setString(2, "%"+search_text+"%");
			preparedStatement.setString(3, "%"+search_text+"%");
			preparedStatement.setInt(4, limit);
			preparedStatement.setInt(5, skip);
		}
		resultSet=preparedStatement.executeQuery();
		while(resultSet.next()) {
			MenuItems item = getItemById(resultSet.getInt(1));
			 items.add(item);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return items;
	}


    @Override
    	public int getMenuItemsCount(int restaurant_id,String search_text) {
    	PreparedStatement preparedStatement =null;
    	int count=0;
    	ResultSet resultSet =null;
    	String selectQuery=search_text ==null ? "SELECT count(*) FROM menu_items where restaurant_id = ?" : "SELECT count(*) FROM menu_items where restaurant_id = ? and (name like ? or category like ?)";
    	
    	try {
    		
    		preparedStatement=connection.prepareStatement(selectQuery);
    		if(search_text ==null)
    		{
    			preparedStatement.setInt(1, restaurant_id);
    		}else {
    			preparedStatement.setInt(1, restaurant_id);
    			preparedStatement.setString(2, "%"+search_text+"%");
    			preparedStatement.setString(3, "%"+search_text+"%");
    		}
    		resultSet=preparedStatement.executeQuery();
    		if(resultSet.next()) {
    			count = resultSet.getInt(1);
    			
    		}
    	} catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	return count;
    	}
    
    
        @Override
        public List<MenuItems> getAllItems(String search_text, int limit, int page) {
            int skip = (page - 1) * limit;

            PreparedStatement preparedStatement = null;
            List<MenuItems> items = new ArrayList<>();
            ResultSet resultSet = null;

            String baseQuery = "select menu.* from menu_items as menu " +
                               "inner join restaurants hotel on menu.restaurant_id = hotel.restaurant_id ";
            String orderBy = " order by menu.rating desc, menu.created_at desc limit ? offset ?";

            try {
                if (search_text == null || search_text.isEmpty()) {
                    String selectQuery = baseQuery + orderBy;
                    preparedStatement = connection.prepareStatement(selectQuery);
                    preparedStatement.setInt(1, limit);
                    preparedStatement.setInt(2, skip);
                } else {
                    String[] searchTerms = search_text.split(",");
                    StringBuilder whereClause = new StringBuilder("where ");

                    for (int i = 0; i < searchTerms.length; i++) {
                        String term = searchTerms[i].trim();
                        if (i > 0) {
                            whereClause.append(" or ");
                        }
                        whereClause.append("(menu.name like ? or menu.category like ?)");
                    }

                    String selectQuery = baseQuery + whereClause + orderBy;
                    preparedStatement = connection.prepareStatement(selectQuery);

                    int paramIndex = 1;
                    for (String term : searchTerms) {
                        preparedStatement.setString(paramIndex++, "%" + term.trim() + "%");
                        preparedStatement.setString(paramIndex++, "%" + term.trim() + "%");
                    }

                    preparedStatement.setInt(paramIndex++, limit);
                    preparedStatement.setInt(paramIndex, skip);
                }

                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    MenuItems item = getItemById(resultSet.getInt(1));
                    items.add(item);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } 
            return items;
        }


    
       @Override
       public int getMenuItemsCount(String search_text) {
    	    PreparedStatement preparedStatement = null;
    	    int count = 0;
    	    ResultSet resultSet = null;

    	    String baseQuery = "select count(*) from menu_items as menu " +
    	                       "inner join restaurants hotel on menu.restaurant_id = hotel.restaurant_id ";
    	    String orderBy = " order by menu.rating desc, menu.created_at desc";

    	    try {
    	        if (search_text == null || search_text.isEmpty()) {
    	            // If search_text is null or empty, execute the base query without a WHERE clause
    	            String selectQuery = baseQuery + orderBy;
    	            preparedStatement = connection.prepareStatement(selectQuery);
    	        } else {
    	            // Split search_text into individual terms by comma
    	            String[] searchTerms = search_text.split(",");
    	            StringBuilder whereClause = new StringBuilder("where ");

    	            // Dynamically build the WHERE clause
    	            for (int i = 0; i < searchTerms.length; i++) {
    	                String term = searchTerms[i].trim();
    	                if (i > 0) {
    	                    whereClause.append(" or ");
    	                }
    	                whereClause.append("(menu.name like ? or menu.category like ?)");
    	            }

    	            // Combine the base query, WHERE clause, and ORDER BY clause
    	            String selectQuery = baseQuery + whereClause + orderBy;
    	            preparedStatement = connection.prepareStatement(selectQuery);

    	            // Set the placeholders for each term
    	            int paramIndex = 1;
    	            for (String term : searchTerms) {
    	                preparedStatement.setString(paramIndex++, "%" + term.trim() + "%");
    	                preparedStatement.setString(paramIndex++, "%" + term.trim() + "%");
    	            }
    	        }

    	        resultSet = preparedStatement.executeQuery();
    	        if (resultSet.next()) {
    	            count = resultSet.getInt(1);
    	        }
    	    } catch (SQLException e) {
    	        e.printStackTrace();
    	    }
    	    return count;
    	}
       
       
       @Override
    	public List<MenuItems> getAllItems(int menu_id, int limit, int page) {
    	   int skip = (page - 1) * limit;

           PreparedStatement preparedStatement = null;
           List<MenuItems> items = new ArrayList<>();
           ResultSet resultSet = null;
           MenuItemDAO menuItemDAO =  new MenuItemsImp();
           String search_text = menuItemDAO.getItemById(menu_id).getCategory();

           String baseQuery = "select menu.* from menu_items as menu " +
                              "inner join restaurants hotel on menu.restaurant_id = hotel.restaurant_id ";
           String orderBy = " order by menu.rating desc, menu.created_at desc limit ? offset ?";

           try {
               
                   String[] searchTerms = search_text.split(",");
                   StringBuilder whereClause = new StringBuilder(" WHERE ( ");

                   for (int i = 0; i < searchTerms.length; i++) {
                       String term = searchTerms[i].trim();
                       if (i > 0) {
                           whereClause.append(" or ");
                       }
                       whereClause.append("(menu.name like ? or menu.category like ?)");
                   }

                   whereClause.append(") AND MENU.ITEM_ID != "+menu_id);
                   String selectQuery = baseQuery + whereClause + orderBy;
                   System.out.println(selectQuery);
                   preparedStatement = connection.prepareStatement(selectQuery);

                   int paramIndex = 1;
                   for (String term : searchTerms) {
                       preparedStatement.setString(paramIndex++, "%" + term.trim() + "%");
                       preparedStatement.setString(paramIndex++, "%" + term.trim() + "%");
                   }

                   preparedStatement.setInt(paramIndex++, limit);
                   preparedStatement.setInt(paramIndex, skip);
               

               resultSet = preparedStatement.executeQuery();
               while (resultSet.next()) {
                   MenuItems item = getItemById(resultSet.getInt(1));
                   items.add(item);
               }
           } catch (SQLException e) {
               e.printStackTrace();
           } 
           return items;
    	}
    


//	public static void main(String[] args) {
//		MenuItems items =new MenuItems();
//		items.setRestaurantId(1);
//		items.setName("burger");
//		items.setDescription("it good pizza");
//		items.setPrice(350.55);
//		items.setAvailable(1);
//		items.setItemId(3);
//		MenuItemDAO dao = new MenuItemsImp();
//		System.out.println(dao.updateItem(items));
//	}

}
