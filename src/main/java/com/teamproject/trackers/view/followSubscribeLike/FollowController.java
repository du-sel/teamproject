package com.teamproject.trackers.view.followSubscribeLike;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.trackers.biz.common.AlertVO;
import com.teamproject.trackers.biz.followSubscribeLike.FollowService;
import com.teamproject.trackers.biz.followSubscribeLike.FollowVO;
import com.teamproject.trackers.biz.profile.ProfileService;
import com.teamproject.trackers.biz.userCreator.UserVO;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	@Autowired
	private HttpSession session;
	@Autowired
	private ProfileService profileService;
	
	private AlertVO alert = new AlertVO();

	
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
	 public String changestateFollow(@PathVariable("url") String url, Model model, UserVO uvo, FollowVO fvo) {
		 
		 if(session.getAttribute("id") != null){
	         fvo.setFrom_id((long)session.getAttribute("id"));
	         fvo.setTo_id(profileService.getUser(url).getId());
	         
	         followService.insertFollower(fvo);	 
	         
	         alert.setStr("팔로우가 추가되었습니다."); 
			 alert.setPath("/"+url); 
			 alert.setFlag(true);
		 }
		 
		return "redirect:/profiles/"+url;
	 }
	 
	// 언팔로우
	 @RequestMapping(value ="/profiles/{url}", method = RequestMethod.DELETE)
	 public String unFollow(@PathVariable("url") String url, Model model, UserVO uvo, FollowVO fvo) {
		 
		 if(session.getAttribute("id") != null){
	         fvo.setFrom_id((long)session.getAttribute("id"));
	         fvo.setTo_id(profileService.getUser(url).getId());
	         
	         followService.deleteFollower(fvo);	 
	         
	         alert.setStr("팔로우가 취소되었습니다."); 
			 alert.setPath("/"+url); 
			 alert.setFlag(true);
			  
		 }
		 
		return "redirect:/profiles/"+url;
	 }
}
