package com.teamproject.trackers.view.followSubscribeLike;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.teamproject.trackers.biz.followSubscribeLike.FollowService;
import com.teamproject.trackers.biz.followSubscribeLike.FollowVO;
import com.teamproject.trackers.biz.followSubscribeLike.SubscribeInfoVO;
import com.teamproject.trackers.biz.followSubscribeLike.SubscribePurchaseService;
import com.teamproject.trackers.biz.followSubscribeLike.SubscribePurchaseVO;
import com.teamproject.trackers.biz.profile.ProfileService;

import com.teamproject.trackers.view.common.CommonController;
import com.teamproject.trackers.biz.userCreator.UserVO;


@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	@Autowired
	private HttpSession session;
	@Autowired
	private ProfileService profileService;
	@Autowired
	private SubscribePurchaseService subscribePurchaseService;
	@Autowired
	public CommonController common;

	
	  // 언팔로우 (삭제)
		/*
	  @RequestMapping(value="/profiles/{url}", method=RequestMethod.DELETE)

		  public String deleteFollower(FollowVO vo, @PathVariable("url") String url) throws Exception { vo.setFrom_id((long)session.getAttribute("id"));
		  vo.setTo_id(profileService.getUser(url).getId());
		  System.out.println(vo.getTo_id()+ "to_id");
		  System.out.println(vo.getFrom_id()+ "from_id");
		  
		  followService.deleteFollower(vo);
		 
		  alert.setStr("팔로우가 취소되었습니다."); 
		  alert.setPath("/"+url); 
		  alert.setFlag(true);
		  
		  return "redirect:/profiles/"+url; 
	  }
	*/
	
	// 팔로우
	 @RequestMapping(value ="/profiles/{url}", method = RequestMethod.POST)
	 public String changestateFollow(@PathVariable("url") String url,
			 Model model, UserVO uvo, FollowVO fvo,SubscribePurchaseVO spvo) {
		 	//String m = "Join";
		
		 if( session.getAttribute("id") != null){
	         fvo.setFrom_id((long)session.getAttribute("id"));
	         fvo.setTo_id(profileService.getUser(url).getId());
	         
	         followService.insertFollower(fvo);	 
	         
	         common.alert.setStr("팔로우가 추가되었습니다."); 
	         common.alert.setPath("/"+url); 
	         common.alert.setFlag(true);
		 }
		return "redirect:/profiles/"+url;
	 }
	 
	 // 구독
	 @RequestMapping(value ="/profile/{url}", method = RequestMethod.POST)
	 public String changestateSub(@PathVariable("url") String url, @RequestBody SubscribePurchaseVO spvo		
			 ) {
				
		 //if( session.getAttribute("id") != null){
			System.out.println("controller");
	
		 
		     subscribePurchaseService.changeSub(spvo);	 
		     System.out.println("controller1"); 
		     common.alert.setStr("구독이 추가되었습니다."); 
		     common.alert.setPath("/"+url); 
		     common.alert.setFlag(true);
		 
		return "redirect:/profiles/"+url;
	 }
	 

	

	 
	// 팔로우, 구독 취소
	 @RequestMapping(value ="/profiles/{url}", method = RequestMethod.DELETE)
	 public String unFollow(@PathVariable("url") String url, Model model,@RequestParam("type") String type, UserVO uvo, FollowVO fvo,SubscribeInfoVO sivo, SubscribePurchaseVO spvo) {
		 String c = "unSub";
		 String f= "unFollow";
		
		 if(f.equals(type) && session.getAttribute("id") != null) {
	
		         fvo.setFrom_id((long)session.getAttribute("id"));
		         fvo.setTo_id(profileService.getUser(url).getId());
		         
		         followService.deleteFollower(fvo);	 
		         
		         common.alert.setStr("팔로우가 취소되었습니다."); 
		         common.alert.setPath("/"+url); 
		         common.alert.setFlag(true);
		 }	
		 else if ( c.equals(type) && session.getAttribute("id") != null) {
			 
			 spvo.setId((long)session.getAttribute("id"));
	         spvo.setSubscribeId(profileService.getUser(url).getId());
	         
	         subscribePurchaseService.deleteSub(spvo);
	         
	         common.alert.setStr("구독이 취소되었습니다."); 
	         common.alert.setPath("/"+url); 
	         common.alert.setFlag(true);
		 }
		 
		return "redirect:/profiles/"+url;
	 }
	 

}
