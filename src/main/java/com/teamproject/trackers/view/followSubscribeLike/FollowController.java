package com.teamproject.trackers.view.followSubscribeLike;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.trackers.biz.common.AlertVO;
import com.teamproject.trackers.biz.followSubscribeLike.FollowService;
import com.teamproject.trackers.biz.followSubscribeLike.FollowVO;
import com.teamproject.trackers.biz.followSubscribeLike.SubscribeInfoVO;
import com.teamproject.trackers.biz.profile.ProfileService;
import com.teamproject.trackers.view.common.CommonController;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	@Autowired
	private HttpSession session;
	@Autowired
	private ProfileService profileService;
	@Autowired
	public CommonController common;

	
	  // 언팔로우 (삭제)
	  
	  @RequestMapping(value="/profiles/{url}", method=RequestMethod.DELETE)
	  public String deleteFollower(FollowVO vo, @PathVariable("url") String url)
	  throws Exception { vo.setFrom_id((long)session.getAttribute("id"));
	  vo.setTo_id(profileService.getUser(url).getId());
	  System.out.println(vo.getTo_id()+ "to_id");
	  System.out.println(vo.getFrom_id()+ "from_id");
	  
	  //followService.deleteFollower(vo);
	 
	  common.alert.setStr("팔로우가 취소되었습니다."); 
	  common.alert.setPath("/"+url); 
	  common.alert.setFlag(true);
	  
	  return "redirect:/profiles/"+url; }
	 
}
