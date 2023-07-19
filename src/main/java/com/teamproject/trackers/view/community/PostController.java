package com.teamproject.trackers.view.community;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.teamproject.trackers.biz.comment.CommentService;
import com.teamproject.trackers.biz.post.PostIMGService;
import com.teamproject.trackers.biz.post.PostIMGVO;
import com.teamproject.trackers.biz.post.PostService;
import com.teamproject.trackers.biz.post.PostVO;
import com.teamproject.trackers.biz.userCreator.UserService;
import com.teamproject.trackers.biz.userCreator.UserVO;
import com.teamproject.trackers.view.userCreator.UserController;

@Controller
@RequestMapping("/community")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private PostIMGService postIMGService;
	
	@Autowired
	private CommentService commentService;

	
	
			
		
	// 작성
	@RequestMapping(value = "/posts", method = RequestMethod.POST)
	public String insertPost(PostVO vo, PostIMGVO imgvo , @RequestParam("post-img")List<MultipartFile> files) throws Exception {	

		/*
System.out.println("vo.getpostid "+vo.getPostId());
System.out.println("vo.getid "+vo.getId());
		PostVO p = postService.insertPost(vo);	
		imgvo.setPostId(p.getPostId());
System.out.println("imgvo.postid "+imgvo.getPostId());		
System.out.println("p.postid "+p.getPostId());
		if(!files.isEmpty()) { //uploadFile !=null
		
			for(MultipartFile file : files) {
				
				//파일 이름 가져오기
				String fileName = file.getOriginalFilename();

				
				imgvo = new PostIMGVO();
				
System.out.println("imgvo.postid "+imgvo.getPostId());				
				imgvo.setPostimg(fileName);
	
			   
				//확장자 추출
				//String extension = fileName.substring(fileName.lastIndexOf("."));
				
				// 로컬에 파일 저장

				//File file = new File(uploadFile.getOriginalFilename());
			
				file.transferTo(new File("C:\\Users\\1\\git\\"+fileName));
				
				postIMGService.insertPostIMG(imgvo);				
			}
		}
		
		return "redirect:/community/posts";
		*/
		postService.insertPost(vo);
		postIMGService.insertPostIMG(imgvo);
		return "redirect:/community/posts";
	}
	
	
	
	
	// 삭제
	@RequestMapping(value = "/posts/{postId}", method = RequestMethod.DELETE)
	public String deletePost(@PathVariable("postId")Long postId) {
		postService.deletePost(postId);
		// comment도 삭제
		return "redirect:/community/posts";
	}	
	
	
	// 상세 조회
	@RequestMapping(value="/posts/{postId}", method=RequestMethod.GET)
	public String getPost(@PathVariable("postId")Long postId, Model model) {
 
		CommentController cc = new CommentController();
		//cc.getCommentList(postId, model);
		model.addAttribute("comments",commentService.getCommentList(postId));
System.out.println("com "+commentService.getCommentList(postId).size());		
		model.addAttribute("commentService",commentService);
		model.addAttribute("userinfo",postService.getUser(postId).get());	
		model.addAttribute("post", postService.getPost(postId).get());
		//model.addAttribute("postIMG", postIMGService.getPostIMG(postId).get());
		return "community/co-post";
	}
	
	
	// 리스트 조회
	@RequestMapping(value="/posts", method=RequestMethod.GET)
	public String getPostList(Model model) {
		
		//this.getPost(postId, model);
		
		model.addAttribute("commentService",commentService);		
		model.addAttribute("postService",postService);
System.out.println("postlist.size "+postService.getPostList().size());		
		model.addAttribute("postList", postService.getPostList());
		model.addAttribute("postIMGList", postIMGService.getPostIMGList());
		return "community/co-main";
	}

}
