package com.teamproject.trackers.view.profile;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.trackers.biz.followSubscribeLike.FollowService;
import com.teamproject.trackers.biz.followSubscribeLike.FollowVO;
import com.teamproject.trackers.biz.profile.ProfileService;
import com.teamproject.trackers.biz.userCreator.UserVO;

@Controller
@RequestMapping("/profiles")
public class ProfileController {
	
	@Autowired
	private ProfileService profileService;
	@Autowired
	private HttpSession session;
	@Autowired
	private FollowService followService;
	
	
	
	@RequestMapping(value ="/{url}", method = RequestMethod.GET)
	public String getProfile(@PathVariable("url") String url, Model model, UserVO uvo, FollowVO fvo) {
		/*
		id = Long.parseLong(session.getId());
		System.out.println(id);
		if(id != 0) {
			model.addAttribute("follow", followService.getFollower(id, url));
		}
		*/
		model.addAttribute("id",profileService.getUser(url));
		
        return "profiles/profile";
	   
	}

			

}
