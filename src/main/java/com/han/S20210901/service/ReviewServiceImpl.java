package com.han.S20210901.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.ReviewDao;
import com.han.S20210901.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;

	@Override
	public int reviewTotal() {
		System.out.println("ReviewServiceImpl reviewTotal() Start");
		int totalCnt = reviewDao.reviewTotal(); 
		return totalCnt;
	}

	@Override
	public List<Review> reviewAll(Review review) {
		System.out.println("ReviewServiceImpl reviewAll() Start...");
		List<Review> reviewAll = reviewDao.reviewAll(review);
		return reviewAll;
	}

	@Override
	public Review reviewDetail(int rnum) {
		System.out.println("ReviewServiceImpl reviewDetail() Start...");
		Review review = reviewDao.reviewDetail(rnum);
		return review;
	}

	@Override
	public int insertReview(Review review) {
		System.out.println("ReviewServiceImpl insertReview() Start...");
		int result = reviewDao.insertReview(review);
		return result;
	}

	@Override
	public int deleteReview(int rnum) {
		System.out.println("ReviewServiceImpl deleteReview() Start...");
		int result = reviewDao.deleteReview(rnum);
		
		return result;
	}

	@Override
	public int reviewUpdate(Review review) {
		System.out.println("ReviewServiceImpl reviewUpdate() Start...");
		int result = reviewDao.updateReview(review);
		System.out.println("ReviewServiceImpl reviewUpdate() result->"+result);
		
		return result;
	}


}
