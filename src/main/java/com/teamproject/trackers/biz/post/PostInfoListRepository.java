package com.teamproject.trackers.biz.post;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

public interface PostInfoListRepository extends JpaRepository<PostInfoListVO, Long>{
	
	// 메뉴 분류 x, 검색 o
	Page<PostInfoListVO> findByContentContaining(String keyword, Pageable pageable);
	
	// 메뉴 분류 o, 검색 o/x
	//@Query(value = "SELECT * FROM productlist p WHERE p.whole=1 and p.p_name like %:keyword%", nativeQuery = true)
	//Page<PostInfoVO> getCategoryWhole(@Param("keyword") String keyword, Pageable pageable);
}