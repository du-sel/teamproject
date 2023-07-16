package com.teamproject.trackers.biz.comment;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
 
@Repository("commentRepository")
public interface CommentRepository extends JpaRepository<CommentVO, Long>{
	
	// 작성
	public CommentVO save(CommentVO vo);
	
	// 삭제
	public void deleteById(Long comment_id);
	
	// 리스트 조회
	public List<CommentVO> findAll();

}
