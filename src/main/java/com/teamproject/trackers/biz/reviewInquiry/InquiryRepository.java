package com.teamproject.trackers.biz.reviewInquiry;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InquiryRepository extends JpaRepository<InquiryVO, Long> {

	// 상품 상세페이지 상품 문의 리스트
	List<InquiryVO> findAllByPidOrderByCreDateDesc(long pid);
	
	// 사용자별 상품 문의 리스트
	Page<InquiryVO> findAllById(long id, Pageable pageable);
	
	/*
	// 리뷰 조회
	@Query(value = "SELECT r.* FROM review r WHERE r.id=:id and r.p_id=:p_id",
			nativeQuery = true)
	ReviewVO getReview(@Param("id") long id, @Param("p_id") long p_id);
	
	
	// 리뷰 답변 업데이트
	@Modifying(clearAutomatically = true)
	@Transactional
	@Query(value = "UPDATE review r SET r.answer = :answer WHERE r.id=:id and r.p_id=:p_id",
			nativeQuery = true)
	void updateReviewComment(@Param("answer") String answer, @Param("id") long id, @Param("p_id") long p_id);
*/

}
