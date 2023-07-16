package com.teamproject.trackers.biz.post;

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
		public void insertPost(PostVO vo) {
			postRepository.save(vo);
		}
	//삭제
		public void deletePost(Long post_id) {
			postRepository.deleteById(post_id);
		}
	//상세 조회
		public Optional<PostVO> getPost(Long post_id) {
			return postRepository.findById(post_id);
		}	

		
	//리스트 조회
		public List<PostVO> getPostList(){
			return postRepository.findAll();
		}
}
