package com.teamproject.trackers.biz.post;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
  
@Repository("postIMGRepository")
public interface PostIMGRepository extends JpaRepository<PostIMGVO, Long>{
	
	// 작성
		public PostIMGVO save(PostIMGVO vo); 
	// 삭제
		public void deleteByPostimg(Long postId);
	// 상세 조회
		public Optional<PostIMGVO> findByPostimg(Long postId);
	// 리스트 조회
		public List<PostIMGVO> findAll();

}