package com.teamproject.trackers.view.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/community")
public class PostController {
	
	
	// 커뮤니티 메인
	@RequestMapping(value="/posts", method=RequestMethod.GET)
	public String coMain() {
		return "community/co-main";
	}

}
