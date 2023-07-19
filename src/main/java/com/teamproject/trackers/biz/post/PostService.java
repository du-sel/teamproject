package com.teamproject.trackers.biz.post;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.teamproject.trackers.biz.userCreator.UserRepository;
import com.teamproject.trackers.biz.userCreator.UserService;
import com.teamproject.trackers.biz.userCreator.UserVO;

@Service
public class PostService {
	
	@Autowired
	@Qualifier("postRepository")
	private PostRepository postRepository;

	   
	//작성  
		public PostVO insertPost(PostVO vo) {
			return postRepository.save(vo);
		}
	//삭제
		public void deletePost(Long postId) {
			postRepository.deleteByPostId(postId);
		}
		
		
	//상세 조회
		public PostVO getPost(Long postId) {
			Optional<PostVO> postOptional = postRepository.findById(postId);
			if (postOptional.isPresent()) {
	            return postOptional.get();
	        }
	        return new PostVO(); //?

		}
		
		public Optional<UserVO> getUser(Long postId) {
			Optional<PostVO> postOptional = postRepository.findById(postId);
	        if (postOptional.isPresent()) {
	            PostVO postVO = postOptional.get();
	            return postRepository.findUserByUserId(postVO.getId());
	        }
	        return Optional.empty();
	    }
		
	//리스트 조회
		public ArrayList<PostVO> getPostList(){
			return (ArrayList)postRepository.findAll();
		}
}

