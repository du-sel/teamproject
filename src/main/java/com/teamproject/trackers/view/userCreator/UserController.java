package com.teamproject.trackers.view.userCreator;

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

import com.teamproject.trackers.biz.userCreator.UserService;
import com.teamproject.trackers.biz.userCreator.UserVO;


@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
    private HttpSession session;
	
	// 모달
	@RequestMapping(value="/signin-modal")
	public String signinModal() {
		return "modal/signin-modal";
	}
	@RequestMapping(value="/signup-modal")
	public String signupModal() {
		return "modal/signup-modal";
	}
	
	// 로그아웃
	@RequestMapping(value="/users/logout")
	public String logout(){
		if(session.getAttribute("id") != null) {
			session.invalidate();
		}
		return "redirect:/store/main";		// 인덱스로?
	}
	
	// 로그인
	@RequestMapping(value="/users/signin", method=RequestMethod.POST)
	public String signin(String path, UserVO vo) throws IllegalAccessException{
		if(userService.isUser(vo) != null) {
			session.setAttribute("id", userService.isUser(vo).getId());
			System.out.println("성공");
		}
		return "redirect:"+path;
	}
	
	// 회원가입
	@RequestMapping(value="/users", method=RequestMethod.POST)
	public String insertUser(String path, UserVO vo){
		
		userService.insertUser(vo);
		return "redirect:"+path;
	}
	
	// 회원 정보 수정
	@RequestMapping(value="/users", method=RequestMethod.PUT)
	public String updateUserPwd(UserVO vo) {	
		vo.setId((long)session.getAttribute("id"));
		userService.updateUser(vo);
		
		return "redirect:/users?path=info";
	}
	
	
	// 비밀번호 수정
	@RequestMapping(value="/users/pwd", method=RequestMethod.PUT)
	public String updateUser(UserVO vo) {
		vo.setId((long)session.getAttribute("id"));
		userService.updateUserPwd(vo);
	 
		return "redirect:/users?path=pwd";
	}

	
	// 회원 탈퇴
	@RequestMapping(value="/users", method=RequestMethod.DELETE)
	public String deleteUser(UserVO vo) {
		vo.setId((long)session.getAttribute("id"));
		
		userService.deleteUser(vo);
		session.invalidate();
		
		return "redirect:/store/main";
	}
	
	// 회원 조회
	@RequestMapping(value = "/users", method=RequestMethod.GET)
	public String getUser(String path, @ModelAttribute("user") UserVO vo, Model model) {
		vo.setId((long)session.getAttribute("id"));
		model.addAttribute("user", userService.getUser(vo).get());
		
		if(path.equals("info"))	return "/my/user-modify";
		else return "/my/user-pwd-modify";
	}
	
	
	// 유효성 검사
	// 이메일 중복 검사(signup-modal.jsp)
	@RequestMapping(value = "/validation/email", method=RequestMethod.GET)
	@ResponseBody
	public boolean validateEmail(UserVO vo) {
		return userService.validateEmail(vo);
	}
	
	// url 중복 검사(signup-modal.jsp, user-modify.jsp, store-management.jsp)
	@RequestMapping(value = "/validation/url", method=RequestMethod.GET)
	@ResponseBody
	public boolean validateURL(UserVO vo) {
		return userService.validateURL(vo);
	}
	
	// 기존 비밀번호 체크(user-pwd-modify.jsp)
	@RequestMapping(value = "/validation/pwd", method=RequestMethod.GET)
	@ResponseBody
	public boolean validateUserPwd(@RequestParam("old_password") String password, UserVO vo) {
		vo.setId((long)session.getAttribute("id"));

		return (password.equals(userService.getUser(vo).get().getPassword()));
	}
}
