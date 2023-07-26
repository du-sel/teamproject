package com.teamproject.trackers.biz.reviewInquiry;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface ReviewRepository extends JpaRepository<ReviewVO, ReviewId> {

	// 리뷰 조회
	@Query(value = "SELECT r.* FROM review r WHERE r.id=:id and r.p_id=:p_id",
			countQuery = "SELECT r.* FROM review r WHERE r.id=:id and r.p_id=:p_id",
			nativeQuery = true)
	ReviewVO getReview(@Param("id") long id, @Param("p_id") long p_id);
	
}
