package com.teamproject.trackers.biz.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service 
public class CommentService {

	@Autowired
	@Qualifier("commentRepository")
	private CommentRepository commentRepository;
	
	// 작성
	public void insertComment(CommentVO vo) {
		commentRepository.save(vo);
	}
	
	// 삭제
	public void deleteComment(Long comment_id) {
		commentRepository.deleteById(comment_id);
	}
	
	// 리스트 조회
	public List<CommentVO> getCommentList(){
		return commentRepository.findAll();
	}
}
