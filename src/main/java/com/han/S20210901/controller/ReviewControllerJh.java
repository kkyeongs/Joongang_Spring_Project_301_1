package com.han.S20210901.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.han.S20210901.model.Review;
import com.han.S20210901.service.Paging;
import com.han.S20210901.service.ReviewService;

@Controller
public class ReviewControllerJh {
	
	@Autowired
	private ReviewService reviewService;

	@RequestMapping(value = "reviewList")
	public String reviewList(String currentPage, Model model, Review review) {
		System.out.println("ReviewControllerJh reviewList() Start...");
		//치료후기 총 개수 구하기
		int totalCnt = reviewService.reviewTotal();
		System.out.println("reviewList() totalCnt -> "+totalCnt);
		
		//페이징 totalCnt = 12
		Paging pg = new Paging(totalCnt, currentPage);
		review.setStart(pg.getStart());
		review.setEnd(pg.getEnd());
		
		//모든 리뷰 정보 가져오기
		List<Review> reviewAll = reviewService.reviewAll(review);
		
		model.addAttribute("total", totalCnt);
		model.addAttribute("pg", pg);
		model.addAttribute("reviewList", reviewAll);
		
		return "reviewList";
	}
	
	@RequestMapping(value = "reviewDetail")
	public String reviewDetail(int rnum, Model model) {
		System.out.println("ReviewControllerJh reviewDetail() Start...");
		Review review = reviewService.reviewDetail(rnum);
		
		model.addAttribute("review", review);
		return "reviewDetail";
	}
	
	@RequestMapping(value = "reviewInsertForm")
	public String insertReview() {
		System.out.println("ReviewControllerJh insertReview() Start..");
		return "reviewInsertForm";
	}
	
	@PostMapping(value = "reviewInsertPro")
	public String insertReviewPro(Model model, Review review) {
		System.out.println("ReviewControllerJh insertReviewPro() Start..");
		int result = reviewService.insertReview(review);
		
		model.addAttribute("result", result);
		return "reviewInsertPro";
	}
	@RequestMapping(value = "reviewDelete")
	public String deleteReview(Model model,int rnum) {
		System.out.println("ReviewControllerJh deleteReview() Start...");
		int result = reviewService.deleteReview(rnum);
		
		model.addAttribute("result", result);
		return "reviewDeletePro";
	}
	@RequestMapping(value = "reviewUpdateForm")
	public String reviewUpdate(int rnum, Model model) {
		System.out.println("ReviewControllerJh reviewUpdate() Start...");
		Review review = reviewService.reviewDetail(rnum);
		
		model.addAttribute("review", review);
		
		return "reviewUpdateForm";
	}
	@PostMapping(value = "reviewUpdatePro")
	public String reviewUpdatePro(Review review, Model model) {
		int result = reviewService.reviewUpdate(review);
		
		model.addAttribute("rnum", review.getRnum());
		model.addAttribute("result", result);
		
		return "reviewUpdatePro";
	}
}
