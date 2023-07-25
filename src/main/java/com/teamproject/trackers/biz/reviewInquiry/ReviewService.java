package com.teamproject.trackers.biz.reviewInquiry;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;

	
	// 리뷰 조회
	public ReviewVO getReview(long id, long p_id){
		return reviewRepository.getReview(id, p_id);
	}
	
	// 리뷰 작성
	public void insertReview(ReviewVO vo) {
		vo.setRating(vo.getRating()*10);
		vo.setCre_date(new Date());
		reviewRepository.save(vo);
	}
}
