package com.han.S20210901.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.han.S20210901.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int reviewTotal() {
		System.out.println("ReviewDaoImpl reviewTotal() Start..");
		int totalCnt = session.selectOne("jhReviewCnt");
		return totalCnt;
	}

	@Override
	public List<Review> reviewAll(Review review) {
		System.out.println("ReviewDaoImpl reviewAll() Start...");
		List<Review> reviewAll = session.selectList("reviewListAll",review);
		System.out.println("ReviewDaoImpl reviewAll() reviewAll.size() ->"+reviewAll.size());
		return reviewAll;
	}

	@Override
	public Review reviewDetail(int rnum) {
		System.out.println("ReviewDaoImpl reviewDetail() Start...");
		Review review = session.selectOne("jhReviewDetail", rnum);
		return review;
	}

	@Override
	public int insertReview(Review review) {
		System.out.println("ReviewDaoImpl insertReview() Start...");
		int result = session.insert("reviewInsert", review);
		return result;
	}

	@Override
	public int deleteReview(int rnum) {
		System.out.println("ReviewDaoImpl deleteReview() Start..");
		int result = session.delete("reviewDelete", rnum);
		return result;
	}

	@Override
	public int updateReview(Review review) {
		int result = session.update("reviewUpdate", review);
		return result;
	}
	

}
