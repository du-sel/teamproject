package com.teamproject.trackers.view.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.trackers.biz.common.AlertVO;
 
@Controller
public class CommonController {


	public AlertVO alert = new AlertVO();
	
	// alert창 페이지
	@RequestMapping(value="/common")
	public String alert(Model model) {		
		model.addAttribute("alert_str", alert.getStr());
		model.addAttribute("alert_path", alert.getPath());
		model.addAttribute("alert_flag", alert.isFlag());
		
		return "common/alert";
	}
	

	// 내소식
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String getNewsList() {
		return "/my/news";
	}

	
	// 문의 내역(고객센터)
	@RequestMapping(value = "/store/center/inquires", method = RequestMethod.GET)
	public String getStoreCSList() {
		return "/my/inquiry-history";
	}
	// 문의 상세(고객센터)
	@RequestMapping(value = "/store/center/inquires/id", method = RequestMethod.GET)
	public String getStoreCS() {
		return "/my/customer-inquiry";
	}
	// 문의 작성(고객센터)
	@RequestMapping(value = "/store/center/inquiries", method = RequestMethod.GET)
	public String insertCS() {
		return "/store/st-center";
	}
	
	// 문의 내역(상품 문의)
	@RequestMapping(value = "/store/products/inquiries", method = RequestMethod.GET)
	public String getStoreInquiryList() {
		return "/my/inquiry-history";
	}
	// 문의 상세(상품 문의)
	@RequestMapping(value = "/store/products/inquiries/id", method = RequestMethod.GET)
	public String getStoreInquiry() {
		return "/my/product-inquiry";
	}
	// 문의 작성(상품 문의)
	@RequestMapping(value = "/store/products/id/inquiries", method = RequestMethod.GET)
	public String insertInquiry() {
		return "/store/st-inquiry";
	}
	
	
	
	// 판매자
	// 판매현황
	@RequestMapping(value = "/store/sales", method = RequestMethod.GET)
	public String getSalesStatus() {
		return "/my-store/sales-status";
	}
	
	// 정산 내역
	@RequestMapping(value = "/store/sales/table", method = RequestMethod.GET)
	public String getSalesList() {
		return "/my-store/calculate-history";
	}
	
	// 문의 리스트
	@RequestMapping(value = "/profiles/url/inquiries", method = RequestMethod.GET)
	public String getInquiryList() {
		return "/my-store/inquiry-management";
	}
	// 문의 상세 조회
	@RequestMapping(value = "/profiles/url/inquiries/inquiry_id", method = RequestMethod.GET)
	public String getInquiry() {
		return "/my-store/inquiry-management-form";
	}
	
	// 구매 후기 리스트
	@RequestMapping(value = "/profiles/url/reviews", method = RequestMethod.GET)
	public String getReviewList() {
		return "/my-store/review-management";
	}
	// 구매 후기 상세 조회
	@RequestMapping(value = "/profiles/url/reviews/id", method = RequestMethod.GET)
	public String getReview() {
		return "/my-store/review-management-form";
	}
	
	// 공지 리스트
	@RequestMapping(value = "/profiles/url/notice", method = RequestMethod.GET)
	public String getNoticeList() {
		return "/my-store/notice-management";
	}
		
	// 관리자
	// 고객센터 문의 리스트
	@RequestMapping(value = "/center/inquires", method = RequestMethod.GET)
	public String getCSList() {
		return "/admin/customer-center";
	}
	// 고객센터 문의 상세 조회
	@RequestMapping(value = "/center/inquires/inquiry_id", method = RequestMethod.GET)
	public String getCS() {
		return "/admin/customer-center-form";
	}
	
	// 팝업 리스트
	@RequestMapping(value = "/popup", method = RequestMethod.GET)
	public String getPopupList() {
		return "/admin/notice-popup";
	}
	// 팝업 상세
	@RequestMapping(value = "/popup/id", method = RequestMethod.GET)
	public String insertPopup() {
		return "/admin/notice-popup-form";
	}
	
}
