package com.teamproject.trackers.view.userCreator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.trackers.biz.userCreator.UserService;
import com.teamproject.trackers.biz.userCreator.UserVO;


@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(String path, UserVO vo, HttpSession session) throws IllegalAccessException{
		System.out.println("path: "+path);
		System.out.println("vo: "+vo.getEmail());
		System.out.println(userService);
		if(userService.isUser(vo) != null) {
			//session.setAttribute("userName", userService.isUser(vo).getName());
			System.out.println("성공");
			return path;
		}else {
			System.out.println("실패");
			return "login.jsp";
		}
	}
	
	
	@RequestMapping(value="/insertUser.do", method=RequestMethod.POST)
	public String insertUser(String path, UserVO vo){
		
		userService.insertUser(vo);
		
		return path;
	}
	
	/*
	@RequestMapping(value="/putTest", method=RequestMethod.PUT)
	public String updateUser(UserVO vo) {	
		userService.updateUser(vo);
		
		return "list.do";
	}
	
	@RequestMapping(value="/deleteTest", method=RequestMethod.DELETE)
	public String deleteUser(UserVO vo) {	
		userService.deleteUser(vo);
		
		return "delete.jsp";
	}
	/*
	@RequestMapping("/list.do")
	public String listUser(Model model) {	
		model.addAttribute("userList", userService.getUserList());
		
		return "list.jsp";
	}
	
	@RequestMapping("/get.do")
	public String getUser(UserVO vo, Model model) {	
		model.addAttribute("user", userService.getUser(vo));
		
		return "info.jsp";
	}
	*/
}
