package com.teamproject.trackers.view.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.trackers.biz.comment.CommentService;
import com.teamproject.trackers.biz.comment.CommentVO;

@Controller
@RequestMapping("/community/posts/{post_id}")
public class CommentController {

	@Autowired
	private CommentService commentService;

	// 작성
	@RequestMapping(value = "/comments", method = RequestMethod.POST)
	public String insertComment(String path, CommentVO vo) {
		commentService.insertComment(vo);
		return "redirect:"+path;
	}
	
	// 삭제
	@RequestMapping(value = "/comments/{comment_id}", method = RequestMethod.DELETE)
	public String deleteComment(String path, Long comment_id) {
		commentService.deleteComment(comment_id);
		return "redirect:"+path;
	}
	
	// 리스트 조회
	@RequestMapping(value = "/comments", method=RequestMethod.GET)
	public String getCommentList(String path, Model model) {
		model.addAttribute("commentList", commentService.getCommentList());
		return "redirect:"+path;
	}
}
