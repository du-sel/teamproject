package com.teamproject.trackers.view.followSubscribeLike;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.teamproject.trackers.biz.followSubscribeLike.FollowService;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	@Autowired
	private HttpSession session;
	
	

}
