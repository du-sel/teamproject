package com.teamproject.trackers.view.community;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
System.out.println("imgvo "+imgvo);		
System.out.println("imgvo.getimg "+imgvo.getPostimg());		
		if(imgvo.getPostimg()!=null) {
			MultipartFile postIMG = imgvo.getUploadFile();
			String fileName = postIMG.getOriginalFilename();
			postIMG.transferTo(new File("C://trackers//"+fileName));
			postIMGService.insertPostIMG(imgvo);
		}
		postService.insertPost(vo);
		return "redirect:/community/posts";
		
	}
	
	
	
	
	// 삭제
	@RequestMapping(value = "/posts", method = RequestMethod.DELETE)
	public String deletePost(Long postId) {
		postService.deletePost(postId);
		//프로필에서 삭제?
		return "";
	}	
	
	
	// 상세 조회
	@RequestMapping(value="/posts/{postId}", method=RequestMethod.GET)
	public String getPost(@PathVariable("postId")Long postId, Model model) {
		//model.addAttribute("userinfo",postService.getUsers(postId));
		model.addAttribute("post", postService.getPost(postId));
		model.addAttribute("postIMG", postIMGService.getPostIMG(postId));
		return "community/co-post";
	}
	
	// 리스트 조회
	@RequestMapping(value="/posts", method=RequestMethod.GET)
	public String getPostList(Model model) {
		//model.addAttribute("users",postService);
System.out.println("postlist.size "+postService.getPostList().size());		
		model.addAttribute("postList", postService.getPostList());
		model.addAttribute("postIMGList", postIMGService.getPostIMGList());
		return "community/co-main";
	}

}
