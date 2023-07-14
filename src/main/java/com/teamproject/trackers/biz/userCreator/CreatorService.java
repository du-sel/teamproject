package com.teamproject.trackers.biz.userCreator;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CreatorService {
	
	@Autowired
	private CreatorRepository creatorRepository;
	@Autowired
	private CreatorViewRepository creatorViewRepository;
	
	// 스토어 열기(크리에이터 등록)
	public void insertCreator(CreatorVO vo) {
		creatorRepository.save(vo);
	}
	
	// 스토어 조회
	public Optional<CreatorViewVO> getCreator(CreatorViewVO vo) {
		return creatorViewRepository.findById(vo.getId());
	}
	
	// url, 전화번호 수정
	public void updateUrlTel(CreatorViewVO vo) {
		System.out.println(vo.getUrl());
		creatorViewRepository.updateUrlTel(vo.getId(), vo.getTel(), vo.getUrl());
	}
		
	// 스토어 닫기
	public void deleteCreator(CreatorVO vo) {
		creatorRepository.deleteById(vo.getId());
	}
	
	
	// 유효성
	// 스토어명(중복 체크)
	public boolean validateStoreName(CreatorVO vo) {	
		return creatorRepository.existsByStoreName(vo.getStoreName());
	}
}
