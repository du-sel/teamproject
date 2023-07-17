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
			postRepository.deleteById(postId);
		}
	//상세 조회
		public Optional<PostVO> getPost(Long postId) {
			return postRepository.findById(postId);
		}
		/*
		public Optional<UserVO> getUser(Long post_id){
			return postRepository.findByUserVO(post_id);
		}
		*/
		//public List<UserVO> getUsers(Long postId){
		//	return postRepository.findByUsers(postId);
		//}
		
	//리스트 조회
		public ArrayList<PostVO> getPostList(){
			return (ArrayList)postRepository.findAll();
		}
}

