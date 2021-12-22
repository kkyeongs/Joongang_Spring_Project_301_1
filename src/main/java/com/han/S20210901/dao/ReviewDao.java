package com.han.S20210901.dao;

import java.util.List;

import com.han.S20210901.model.Review;

public interface ReviewDao {

	public int reviewTotal();

	public List<Review> reviewAll(Review review);

	public Review reviewDetail(int rnum);

	public int insertReview(Review review);

	public int deleteReview(int rnum);

	public int updateReview(Review review);



	

}
