package com.teamproject.trackers.view.community;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.teamproject.trackers.biz.comment.CommentService;
import com.teamproject.trackers.biz.post.PostIMGService;
import com.teamproject.trackers.biz.post.PostIMGVO;
import com.teamproject.trackers.biz.post.PostService;
import com.teamproject.trackers.biz.post.PostVO;
import com.teamproject.trackers.biz.userCreator.UserService;

@Controller
@RequestMapping("/community")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private PostIMGService postIMGService;
	
		
	// 작성
	@RequestMapping(value = "/posts", method = RequestMethod.POST)
	public String insertPost(PostVO vo, PostIMGVO imgvo) throws Exception {	
		
		if(imgvo!=null) {
			MultipartFile postIMG = imgvo.getUploadFile();
			String fileName = postIMG.getOriginalFilename();
			postIMG.transferTo(new File("C://trackers//"+fileName));
			postIMGService.insertPostIMG(imgvo);
		}
		postService.insertPost(vo);
		return "community/co-main";
	}
	
	
	
	
	// 삭제
	@RequestMapping(value = "/posts", method = RequestMethod.DELETE)
	public String deletePost(Long post_id) {
		postService.deletePost(post_id);
		//프로필에서 삭제?
		return "";
	}	
	
	
	// 상세 조회
	@RequestMapping(value="/posts/{post_id}", method=RequestMethod.GET)
	public String getPost(Long post_id, Model model) {
		model.addAttribute("post", postService.getPost(post_id));
		model.addAttribute("postIMG", postIMGService.getPostIMG(post_id));
		return "community/co-post";
	}
	
	// 리스트 조회
	@RequestMapping(value="/posts", method=RequestMethod.GET)
	public String getPostList(Model model) {
		
		model.addAttribute("postList", postService.getPostList());
		model.addAttribute("postIMGList", postIMGService.getPostIMGList());
		return "community/co-main";
	}

}
