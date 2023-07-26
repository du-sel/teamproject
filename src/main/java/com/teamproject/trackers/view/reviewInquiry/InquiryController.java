package com.teamproject.trackers.view.reviewInquiry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;
import com.teamproject.trackers.biz.followSubscribeLike.FollowService;
import com.teamproject.trackers.biz.followSubscribeLike.FollowVO;
import com.teamproject.trackers.biz.followSubscribeLike.SubscribeInfoService;
import com.teamproject.trackers.biz.product.ProductListVO;
import com.teamproject.trackers.biz.product.ProductService;
import com.teamproject.trackers.biz.profile.ProfileService;
import com.teamproject.trackers.biz.purchase.PurchaseListVO;
import com.teamproject.trackers.biz.purchase.PurchaseService;
import com.teamproject.trackers.biz.reviewInquiry.InquiryService;
import com.teamproject.trackers.biz.reviewInquiry.InquiryVO;
import com.teamproject.trackers.biz.reviewInquiry.ReviewListVO;
import com.teamproject.trackers.biz.reviewInquiry.ReviewService;
import com.teamproject.trackers.biz.reviewInquiry.ReviewVO;
import com.teamproject.trackers.biz.userCreator.UserVO;

@Controller
public class InquiryController {

	private HttpSession session;
	private InquiryService inquiryService;
	
	@Autowired
	public InquiryController(
			HttpSession session,
			InquiryService inquiryService) {
		this.session = session;
		this.inquiryService = inquiryService;
	}
	
	// 상품 문의 작성 폼
	@RequestMapping(value ="/store/products/{p_id}/inquities", method = RequestMethod.GET)
	public String insertInquiryForm(@PathVariable("p_id") long p_id, Model model) {		
		model.addAttribute("p_info", inquiryService.getProductInfo(p_id));
		
		return "/store/st-inquiry";
	}
	
	// 상품 문의 작성
	@RequestMapping(value ="/store/products/{p_id}/inquities", method = RequestMethod.POST)
	public String insertInquiry(@PathVariable("p_id") long p_id, InquiryVO vo) {		
		UserVO user = (UserVO) session.getAttribute("user");
		
		vo.setId(user.getId());
		vo.setPid(p_id);
		vo.setName(user.getName());
		
		inquiryService.insertInquiry(vo);
		
		return "redirect:/store/products/"+p_id;
	}
	
	// 사용자별 상품 문의 조회
	@RequestMapping(value = "/store/inquiries", method = RequestMethod.GET)
	public String getInquiryList(int page, Model model) {
		
		// 정렬 및 페이징
		Pageable pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "creDate"));	// 시작 페이지, 데이터 개수, 정렬 기준
		Page<InquiryVO> list = inquiryService.getUserInquiryList((long) session.getAttribute("id"), pageable);
		
		int nowPage = list.getPageable().getPageNumber()+1;			// 현재 페이지, 0부터 시작하므로 +1
		int startPage = Math.max(nowPage-4, 1);						// 시작 페이지 번호
		int endPage = Math.min(nowPage+5, list.getTotalPages());	// 끝 페이지 번호
		
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("inquities", list);
		
		return "/my/inquiry-history";
	}

	// 사용자 상품 문의 상세
	@RequestMapping(value = "/store/inquiries/{inquiry_id}", method = RequestMethod.GET)
	public String getStoreInquiry(@PathVariable("inquiry_id") long inquiry_id, Model model) {
		
		InquiryVO vo = inquiryService.getUserInquiry(inquiry_id).get();
		
		model.addAttribute("p_info", inquiryService.getProductInfo(vo.getPid()));
		model.addAttribute("inquiry", vo);
		
		return "/my/product-inquiry";
	}
	
	/*
	@RequestMapping(value ="/store/reviews/{p_id}", method = RequestMethod.POST)
	public String insertReview(@PathVariable("p_id") long p_id, ReviewVO vo) {
		vo.setId((long) session.getAttribute("id"));
		vo.setPid(p_id);
		
		reviewService.insertReview(vo);
		
		return "redirect:/store/reviews/"+p_id; 
	}
	*/
}

