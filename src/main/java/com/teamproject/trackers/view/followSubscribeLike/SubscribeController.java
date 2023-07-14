package com.teamproject.trackers.view.followSubscribeLike;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.trackers.biz.followSubscribeLike.SubscribeInfoService;
import com.teamproject.trackers.biz.followSubscribeLike.SubscribeInfoVO;
import com.teamproject.trackers.biz.userCreator.CreatorService;
import com.teamproject.trackers.biz.userCreator.CreatorVO;
import com.teamproject.trackers.biz.userCreator.CreatorViewVO;
import com.teamproject.trackers.biz.userCreator.UserService;
import com.teamproject.trackers.biz.userCreator.UserVO;


@Controller
public class SubscribeController {

	@Autowired
	private SubscribeInfoService subscribeInfoService;
	@Autowired
    private HttpSession session;
	
	// 구독 정보 조회
	@RequestMapping(value="/store/subscribes", method=RequestMethod.GET)
	public String getCreator(SubscribeInfoVO vo, Model model) {
		vo.setId((long)session.getAttribute("id"));
		
		model.addAttribute("subscribe", subscribeInfoService.getSubscribeInfo(vo));
		System.out.println("조회:"+model);
		return "/my-store/subscribe-management";	// 스토어 관리 임시연결
	}
	
	// 구독 활성화(등록 및 수정)
	@RequestMapping(value="/store/subscribes", method=RequestMethod.POST)
	public String updateSubscribeInfo(SubscribeInfoVO vo) {
		vo.setId((long)session.getAttribute("id"));
		
		if(subscribeInfoService.getSubscribeInfo(vo) == null) {		// 등록
			subscribeInfoService.insertSubscribeInfo(vo);
		}else {
			subscribeInfoService.updateSubscribeInfo(vo);			// 수정
		}
		
		return "redirect:/store/subscribes";
	}
	
	// 구독 비활성화(삭제)
	@RequestMapping(value="/store/subscribes", method=RequestMethod.DELETE)
	public String deleteSubscribeInfo(SubscribeInfoVO vo) {
		vo.setId((long)session.getAttribute("id"));
		
		subscribeInfoService.deleteSubscribeInfo(vo);
		return "redirect:/store/subscribes";
	}
}
