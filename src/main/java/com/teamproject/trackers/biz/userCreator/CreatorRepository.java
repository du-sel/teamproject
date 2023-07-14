package com.teamproject.trackers.biz.userCreator;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CreatorRepository extends JpaRepository<CreatorVO, Long> {
	
	// 유효성 검사
	// 스토어명 중복 확인
	boolean existsByStoreName(String storeName);
	
}