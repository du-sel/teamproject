package com.teamproject.trackers.view.userCreator;

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

import com.teamproject.trackers.biz.userCreator.CreatorService;
import com.teamproject.trackers.biz.userCreator.CreatorVO;
import com.teamproject.trackers.biz.userCreator.CreatorViewVO;
import com.teamproject.trackers.biz.userCreator.UserService;
import com.teamproject.trackers.biz.userCreator.UserVO;


@Controller
public class CreatorController {

	@Autowired
	private CreatorService creatorService;
	@Autowired
    private HttpSession session;
	
	// 프로필 임시 연결
	@RequestMapping(value="/profiles")
	public String getProfile() {
		return "/profile/profile";
	}	
	
	// 스토어 열기(크리에이터 등록)
	@RequestMapping(value="/store/creators", method=RequestMethod.POST)
	public String insertCreator(CreatorVO vo, CreatorViewVO view_vo) {
		long id = (long)session.getAttribute("id");
		vo.setId(id);
		view_vo.setId(id);
		
		creatorService.insertCreator(vo);
		creatorService.updateUrlTel(view_vo);
		
		return "redirect:/profiles";
	}
	
	// 스토어 조회
	@RequestMapping(value="/store/creators", method=RequestMethod.GET)
	public String getCreator(CreatorViewVO vo, Model model) {
		vo.setId((long)session.getAttribute("id"));
		model.addAttribute("creator", creatorService.getCreator(vo).get());
		
		return "/my-store/store-management";	// 스토어 관리 임시연결
	}
	
	// 스토어 수정
	@RequestMapping(value="/store/creators", method=RequestMethod.PUT)
	public String updateCreator(CreatorViewVO vo) {
		vo.setId((long)session.getAttribute("id"));
		creatorService.updateCreator(vo);
		creatorService.updateUrl(vo);
		
		return "redirect:/store/creators";
	}
	
		
	// 스토어 닫기
	@RequestMapping(value="/store/creators", method=RequestMethod.DELETE)
	public String deleteCreator(CreatorVO vo) {
		vo.setId((long)session.getAttribute("id"));
		creatorService.deleteCreator(vo);
		return "redirect:/store/main";
	}
	
	
	// 유효성
	// 스토어명(중복 체크)
	@RequestMapping(value = "/validation/creator", method=RequestMethod.GET)
	@ResponseBody
	public boolean validateStoreName(CreatorVO vo) {	
		return creatorService.validateStoreName(vo);
	}
}
