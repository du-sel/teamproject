package com.teamproject.trackers.view.community;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.teamproject.trackers.biz.comment.CommentService;
import com.teamproject.trackers.biz.comment.CommentVO;
import com.teamproject.trackers.biz.comment.PostCommentListVO;
import com.teamproject.trackers.biz.post.PostIMGService;
import com.teamproject.trackers.biz.post.PostIMGVO;
import com.teamproject.trackers.biz.post.PostInfoListVO;
import com.teamproject.trackers.biz.post.PostService;
import com.teamproject.trackers.biz.post.PostVO;
import com.teamproject.trackers.biz.product.CreatorListVO;
import com.teamproject.trackers.biz.product.ProductListVO;
import com.teamproject.trackers.biz.product.ProductVO;
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
	
	@Autowired
	private HttpSession session;

	
	
			
		
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
		//postIMGService.insertPostIMG(imgvo);
		return "redirect:/community/posts";
	}
	
	
	
	
	// 포스트 삭제
	@RequestMapping(value = "/posts/{postId}", method = RequestMethod.DELETE)
	public String deletePost(@PathVariable("postId")Long postId) {
		postService.deletePost(postId);
		// comment도 삭제
		return "redirect:/community/posts";
	}	

	// 댓글 삭제
	@RequestMapping(value = "/{postId}/comments/{comment_id}", method = RequestMethod.GET)
	public String deleteComment(@PathVariable("comment_id")Long commentid, @PathVariable("postId")Long postId) {
System.out.println("delete postid "+postId);		
		commentService.deleteComment(commentid);
		String postid = Long.toString(postId);
		return "redirect:/community/posts/"+postid;
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
	/*
	@RequestMapping(value="/posts", method=RequestMethod.GET)
	public String getPostList(Model model) {
		
		//this.getPost(postId, model);
		
		model.addAttribute("commentService",commentService);		
		model.addAttribute("postService",postService);
		model.addAttribute("postList", postService.getPostList());
		model.addAttribute("postIMGList", postIMGService.getPostIMGList());
		return "community/co-main";
	}
	*/
	
	// 리스트 조회(페이징)
	@RequestMapping(value="/posts", method=RequestMethod.GET)
	public String getPostList(int page, String type, String keyword, Model model) {
						
		// 정렬 및 페이징 , 검색 처리
		Page<PostInfoListVO> list = null;
		Pageable pageable = null;
		if(!type.equals("all")) {
			// 정렬
			pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "cre_date"));
			// 검색 x 경우
			if(keyword == null) keyword="";
			
			if(!type.equals("creator")) list = postService.getTypeList(type, (long) session.getAttribute("id"), keyword, pageable);
			else list = postService.getCreatorPostList(keyword, pageable);
		}else {
			// 정렬
			pageable = PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC, "creDate"));
			
			// 검색
			if(keyword != null) {			// 검색 o
				list = postService.getSearchPostList(keyword, pageable);
			}else {							// 검색 x
				keyword = "";
				list = postService.getPostList(pageable);
			}
		}
		
		
		// 포스트 이미지 리스트 조회
		HashMap<Long, List<PostIMGVO>> imgList = new HashMap<>();
		HashMap<Long, List<PostCommentListVO>> commentList = new HashMap<>();
		for(PostInfoListVO p : list.getContent()) {
			List<PostIMGVO> pi = postIMGService.getPImgList(p.getPostId());
			List<PostCommentListVO> ci = commentService.getPostCommentList(p.getPostId());
			
			// 포스트 이미지 리스트
			for(PostIMGVO item : pi) {
				if(imgList.get(item.getPostId()) != null) {
					imgList.get(item.getPostId()).add(item);
				}else {
					ArrayList<PostIMGVO> imgs = new ArrayList<>();
					imgs.add(item);
					imgList.put(item.getPostId(), imgs);
				}
			}
			
			// 댓글 리스트
			for(PostCommentListVO item : ci) {
				if(commentList.get(item.getPostId()) != null) {
					commentList.get(item.getPostId()).add(item);
				}else {
					ArrayList<PostCommentListVO> comments = new ArrayList<>();
					comments.add(item);
					commentList.put(item.getPostId(), comments);
				}
			}
		}		
		
		int nowPage = list.getPageable().getPageNumber()+1;			// 현재 페이지, 0부터 시작하므로 +1
		int startPage = Math.max(nowPage-4, 1);						// 시작 페이지 번호
		int endPage = Math.min(nowPage+5, list.getTotalPages());	// 끝 페이지 번호
		
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("posts", list);
		model.addAttribute("imgs", imgList);
		model.addAttribute("comments", commentList);
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		
		return "community/co-main";
		
	}

}
