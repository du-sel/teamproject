package com.teamproject.trackers.biz.followSubscribeLike;

import java.sql.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.teamproject.trackers.biz.purchase.PurchaseId;
import com.teamproject.trackers.biz.purchase.PurchaseVO;


public interface SubscribePurchaseRepository extends JpaRepository<SubscribePurchaseVO, SubscribePurchaseId> {
	
	SubscribePurchaseVO findBySubscribeIdAndId(long subscribeId, long id);
	

}
