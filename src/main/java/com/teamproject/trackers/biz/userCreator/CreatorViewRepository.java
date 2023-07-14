package com.teamproject.trackers.biz.userCreator;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface CreatorViewRepository extends JpaRepository<CreatorViewVO, Long> {
	
	// url, 전화번호 수정 - 크리에이터 등록
	@Modifying(clearAutomatically = true)
	@Transactional
	@Query(value = "UPDATE creatorview cv SET cv.tel = :tel, cv.url = :url WHERE cv.id = :id", nativeQuery = true)
	void updateUrlTel(@Param("id")long id, @Param("tel")String tel, @Param("url")String url);	
}