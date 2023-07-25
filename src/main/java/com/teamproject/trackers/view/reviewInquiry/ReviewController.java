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
import com.teamproject.trackers.biz.purchase.PurchaseService;
import com.teamproject.trackers.biz.reviewInquiry.ReviewService;
import com.teamproject.trackers.biz.reviewInquiry.ReviewVO;
import com.teamproject.trackers.biz.userCreator.UserVO;

@Controller
public class ReviewController {

	private HttpSession session;
	private ReviewService reviewService;
	private PurchaseService purchaseService;
	
	@Autowired
	public ReviewController(
			HttpSession session,
			ReviewService reviewService,
			PurchaseService purchaseService) {
		this.session = session;
		this.reviewService = reviewService;
		this.purchaseService = purchaseService;
	}
	
	@RequestMapping(value ="/store/reviews/{p_id}", method = RequestMethod.GET)
	public String getReview(@PathVariable("p_id") long p_id, Model model) {
		long id = (long) session.getAttribute("id");
		
		model.addAttribute("p_info", purchaseService.getProductInfo(id, p_id).get());
		model.addAttribute("review", reviewService.getReview(id, p_id));
		
		return "/my/insert-review"; 
	}
	
	@RequestMapping(value ="/store/reviews/{p_id}", method = RequestMethod.POST)
	public String insrtReview(@PathVariable("p_id") long p_id, ReviewVO vo) {
		vo.setId((long) session.getAttribute("id"));
		vo.setP_id(p_id);
		
		reviewService.insertReview(vo);
		
		
		return "redirect:/store/reviews/"+p_id; 
	}
}

