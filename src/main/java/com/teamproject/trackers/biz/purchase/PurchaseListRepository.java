package com.teamproject.trackers.biz.purchase;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PurchaseListRepository extends JpaRepository<PurchaseListVO, PurchaseId> {
	
	
	// 특정 회원의 구매내역 조회
	Page<PurchaseListVO> findAllById(long id, Pageable pageable);
	
}