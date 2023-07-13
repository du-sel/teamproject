package com.teamproject.trackers.biz.purchase;

import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository("purchaseRepository")
@Primary
public interface PurchaseRepository extends JpaRepository<PurchaseVO, Long> {
	
	
	

}
