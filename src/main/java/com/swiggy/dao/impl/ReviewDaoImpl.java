package com.swiggy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.swiggy.dao.ReviewDao;
import com.swiggy.db.DBConnection;
import com.swiggy.dto.Reviews;

public class ReviewDaoImpl implements ReviewDao {
	
	Connection connection;
	
	public ReviewDaoImpl() {
		connection = DBConnection.getConnection();
	}

	@Override
	public Reviews addReview(Reviews reviews) {
		String insertQuery = "INSERT INTO REVIEWS ( user_id, restaurant_id, rating,comment,menu_id) VALUES (?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setInt(1, reviews.getUserId());
			preparedStatement.setInt(2, reviews.getRestaurantId());
			preparedStatement.setInt(3, reviews.getRating());
			preparedStatement.setString(4, reviews.getComment());
			preparedStatement.setInt(5, reviews.getMenuId());
			if(preparedStatement.executeUpdate() > 0)
			{
				return reviews;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<Reviews> getAllReviewsByFoodId(int item_id) {
		String selectQuery = "SELECT * FROM REVIEWS  WHERE MENU_ID=? ORDER BY REVIEW_ID DESC LIMIT 10";
		List<Reviews> reviews  =  new ArrayList<Reviews>();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(selectQuery);
			preparedStatement.setInt(1, item_id);
			ResultSet resultSet =  preparedStatement.executeQuery();
			while (resultSet.next()) {
				Reviews review =  new Reviews();
				review.setReviewId(resultSet.getInt(1));
				review.setUserId(resultSet.getInt(2));
				review.setRestaurantId(resultSet.getInt(3));
				review.setRating(resultSet.getInt(4));
				review.setComment(resultSet.getString(5));
				review.setCreatedAt(resultSet.getTimestamp(6));
				review.setMenuId(resultSet.getInt(7));
				reviews.add(review);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return reviews;
	}

	@Override
	public List<Reviews> getAllReviewsByRestaurantId(int restautant_id,int page,int limit) {
		
		int skip = (page -1 ) * limit;
		
		String selectQuery = "SELECT * FROM REVIEWS  WHERE RESTAURANT_ID=? ORDER BY REVIEW_ID DESC LIMIT ? OFFSET ?";
		List<Reviews> reviews  =  new ArrayList<Reviews>();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(selectQuery);
			preparedStatement.setInt(1, restautant_id);
			preparedStatement.setInt(2, limit);
			preparedStatement.setInt(3, skip);
			ResultSet resultSet =  preparedStatement.executeQuery();
			while (resultSet.next()) {
				Reviews review =  new Reviews();
				review.setReviewId(resultSet.getInt(1));
				review.setUserId(resultSet.getInt(2));
				review.setRestaurantId(resultSet.getInt(3));
				review.setRating(resultSet.getInt(4));
				review.setComment(resultSet.getString(5));
				review.setCreatedAt(resultSet.getTimestamp(6));
				review.setMenuId(resultSet.getInt(7));
				reviews.add(review);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return reviews;
	}
	
	@Override
	public int getReviewsCount(int item_id) {
		int count=0;
		String selectQuery = "SELECT COUNT(*) FROM REVIEWS  WHERE MENU_ID=?  ORDER BY REVIEW_ID DESC";
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(selectQuery);
			preparedStatement.setInt(1, item_id);
			ResultSet resultSet =  preparedStatement.executeQuery();
			if(resultSet.next()) {
				count= resultSet.getInt(1);			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count;
	}
	
	@Override
	public int getReviewsCountByRestautantId(int restautant_id) {
		int count=0;
		String selectQuery = "SELECT COUNT(*) FROM REVIEWS  WHERE RESTAURANT_ID=?  ORDER BY REVIEW_ID DESC";
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(selectQuery);
			preparedStatement.setInt(1, restautant_id);
			ResultSet resultSet =  preparedStatement.executeQuery();
			if(resultSet.next()) {
				count= resultSet.getInt(1);			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count;
	}
	
	
	

}
