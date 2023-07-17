package com.teamproject.trackers.biz.post;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class PostIMGService {
	
	@Autowired
	@Qualifier("postIMGRepository")
	private PostIMGRepository postIMGRepository;
	
	
	//작성
		public void insertPostIMG(PostIMGVO vo) {
			postIMGRepository.save(vo);
		}
	//삭제
		public void deletePostIMG(Long post_id) {
			postIMGRepository.deleteById(post_id);
		}
	//상세 조회
		public Optional<PostIMGVO> getPostIMG(Long post_id) {
			return postIMGRepository.findById(post_id);
		}
	//리스트 조회
		public List<PostIMGVO> getPostIMGList(){
			return postIMGRepository.findAll();
		}
}
