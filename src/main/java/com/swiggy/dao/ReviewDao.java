package com.swiggy.dao;

import java.util.List;

import com.swiggy.dto.Reviews;

public interface ReviewDao
{
   public Reviews addReview (Reviews reviews);
   
   //Returns recent 5 reviews
   public List<Reviews> getAllReviewsByFoodId(int item_id);
   public List<Reviews> getAllReviewsByRestaurantId(int restautant_id);
   
   //Get Reviews Count
   
   public int getReviewsCount(int item_id);
}
