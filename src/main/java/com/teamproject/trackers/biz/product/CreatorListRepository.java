package com.teamproject.trackers.biz.product;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CreatorListRepository extends JpaRepository<CreatorListVO, Long> {
	
	Page<CreatorListVO> findBystoreNameContaining(String keyword, Pageable pageable);
	
}