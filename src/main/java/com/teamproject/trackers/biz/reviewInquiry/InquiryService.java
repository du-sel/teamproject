package com.teamproject.trackers.biz.reviewInquiry;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.teamproject.trackers.biz.product.CreatorListRepository;
import com.teamproject.trackers.biz.product.ProductListRepository;
import com.teamproject.trackers.biz.product.ProductPageRepository;
import com.teamproject.trackers.biz.product.ProductPageVO;
import com.teamproject.trackers.biz.product.ProductRepository;
import com.teamproject.trackers.biz.product.categoryDetail.DesignCategoryRepository;
import com.teamproject.trackers.biz.product.categoryDetail.PageCategoryRepository;
import com.teamproject.trackers.biz.product.categoryDetail.ProductDetailRepository;


@Service
public class InquiryService {

	private InquiryRepository inquiryRepository;
	private ProductPageRepository productPageRepository;
	
	@Autowired
	public InquiryService(InquiryRepository inquiryRepository,
			ProductPageRepository productPageRepository) {
		
		this.inquiryRepository = inquiryRepository;
		this.productPageRepository = productPageRepository;
	}

	// 상품 정보 조회
	public ProductPageVO getProductInfo(long pid) {
		return productPageRepository.findByPid(pid);
	}
	
	// 상품문의 작성
	public void insertInquiry(InquiryVO vo) {
		vo.setCreDate(new Date());
		inquiryRepository.save(vo);
	}
	
	// 상품 상세 페이지 상품 문의 조회
	public List<InquiryVO> getInquiryList(long pid){
		return inquiryRepository.findAllByPidOrderByCreDateDesc(pid);
	}
	
	// 사용자별 상품 문의 조회
	public Page<InquiryVO> getUserInquiryList(long id, Pageable pageable){
		return inquiryRepository.findAllById(id, pageable);
	}
	
	// 사용자별 상품 문의 상세 조회
	public Optional<InquiryVO> getUserInquiry(long inquiry_id){
		return inquiryRepository.findById(inquiry_id);
	}
	
	
	
	
	
	/*
	// 크리에이터별 리뷰 리스트
	public Page<ReviewListVO> getCreatorReviewList(long c_id, Pageable pageable){
		return reviewListRepository.findAllByCid(c_id, pageable);
	}
	
	// 크리에이터별 상세 리뷰
	public ReviewListVO getCreatorReview(long id, long p_id) {
		return reviewListRepository.findByIdAndPid(id, p_id);
	}
	
	// 크리에이터 답변 저장
	public void updateReviewComment(ReviewVO vo) {
		reviewRepository.updateReviewComment(vo.getAnswer(), vo.getId(), vo.getPid());
	}
	*/
}
