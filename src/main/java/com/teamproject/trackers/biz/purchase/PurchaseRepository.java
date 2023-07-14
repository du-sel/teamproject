package com.teamproject.trackers.biz.purchase;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PurchaseRepository extends JpaRepository<PurchaseVO, PurchaseId> {
	
	
	// 특정 회원의 구매내역 조회
	PurchaseVO findById(long id);
	
	
}