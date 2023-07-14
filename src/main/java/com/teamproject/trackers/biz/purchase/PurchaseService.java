package com.teamproject.trackers.biz.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PurchaseService {
	
	private PurchaseRepository purchaseRepository; 
	
	@Autowired
	public PurchaseService(PurchaseRepository purchaseRepository) {
		this.purchaseRepository = purchaseRepository;
	}
	
	
	
	// 상품 구매 - purchase 테이블에 INSERT
	public void insertPurchase(PurchaseVO vo) {
		purchaseRepository.save(vo);
	}
	
	

}
