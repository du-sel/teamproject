package com.teamproject.trackers.view.userCreator;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import com.teamproject.trackers.biz.common.AlertVO;
import com.teamproject.trackers.biz.userCreator.UserService;
import com.teamproject.trackers.biz.userCreator.UserVO;


@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
    private HttpSession session;
	private AlertVO alert = new AlertVO();
	
	// 모달
	@RequestMapping(value="/signin-modal")
	public String signinModal() {
		return "modal/signin-modal";
	}
	@RequestMapping(value="/signup-modal")
	public String signupModal() {
		return "modal/signup-modal";
	}
	@RequestMapping(value="/store-create-modal")
	public String storeCreateModal(UserVO vo, Model model) {
		vo.setId((long)session.getAttribute("id"));
		model.addAttribute("user", userService.getUser(vo).get());
		
		return "modal/store-create-modal";
	}
	
	// alert창 페이지
	@RequestMapping(value="/common")
	public String test(Model model) {		
		model.addAttribute("alert_str", alert.getStr());
		model.addAttribute("alert_path", alert.getPath());
		model.addAttribute("alert_flag", alert.isFlag());
		
		return "common/alert";
	}
	
	
	// 로그아웃
	@RequestMapping(value="/users/logout")
	public String logout(){
		if(session.getAttribute("id") != null) {
			session.invalidate();
			
			alert.setStr("로그아웃 되었습니다.");
			alert.setPath("/");
			alert.setFlag(true);

			return "redirect:/common";
		}
		
		return "redirect:/";
	}
	
	// 로그인
	@RequestMapping(value="/users/signin", method=RequestMethod.POST)
	public String signin(String path, UserVO vo) throws IllegalAccessException{
		if(userService.isUser(vo) != null) {

			session.setAttribute("id", userService.isUser(vo).getId());
			session.setAttribute("user", userService.isUser(vo));
			
			System.out.println("성공");
		}
		return "redirect:"+path;
	}
	
	// 회원가입
	@RequestMapping(value="/users", method=RequestMethod.POST)
	public String insertUser(String path, UserVO vo){
		
		userService.insertUser(vo);
		
		alert.setStr("회원가입이 완료되었습니다.");
		alert.setPath(path);
		alert.setFlag(true);
		
		return "redirect:/common";
	}
	
	// 회원 정보 수정
	@RequestMapping(value="/users", method=RequestMethod.PUT)
	public String updateUserPwd(UserVO vo) {	
		vo.setId((long)session.getAttribute("id"));
		userService.updateUser(vo);
		
		alert.setStr("회원정보가 수정되었습니다.");
		alert.setPath("/users?path=info");
		alert.setFlag(true);
		
		return "redirect:/common";
	}
	
	
	// 비밀번호 수정
	@RequestMapping(value="/users/pwd", method=RequestMethod.PUT)
	public String updateUser(UserVO vo) {
		vo.setId((long)session.getAttribute("id"));
		userService.updateUserPwd(vo);
	 
		alert.setStr("비밀번호가 변경되었습니다.");
		alert.setPath("/users?path=ipwdnfo");
		alert.setFlag(true);
		
		return "redirect:/common";
	}

	
	// 회원 탈퇴
	@RequestMapping(value="/users", method=RequestMethod.DELETE)
	public String deleteUser(UserVO vo) {
		vo.setId((long)session.getAttribute("id"));
		
		userService.deleteUser(vo);
		session.invalidate();

		alert.setStr("회원탈퇴가 완료되었습니다.");
		alert.setPath("/store/main");
		alert.setFlag(true);
		
		return "redirect:/common";
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
	// 로그인 성공 유무 검사(signin-modal.jsp)
	@RequestMapping(value = "/validation/signin", method=RequestMethod.POST)
	@ResponseBody
	public boolean validateSignin(UserVO vo) {
		return userService.validateSignin(vo);
	}
	
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
	@RequestMapping(value = "/validation/pwd", method=RequestMethod.POST)
	@ResponseBody
	public boolean validateUserPwd(@RequestParam("old_password") String password, UserVO vo) {
		vo.setId((long)session.getAttribute("id"));

		return (password.equals(userService.getUser(vo).get().getPassword()));
	}
}
