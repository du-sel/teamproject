package com.teamproject.trackers.biz.followSubscribeLike;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface SubscribePurchaseRepository extends JpaRepository<SubscribePurchaseVO, SubscribePurchaseId> {
	
	SubscribePurchaseVO findBySubscribeIdAndId(long subscribeId, long id);
	
	@Query(value ="SELECT sp.subscribe_id , sp.id FROM subscribepurchase sp WHERE sp.subscribe_id = (SELECT si.subscribe_id FROM subscribeinfo si WHERE si.id = (SELECT u.id FROM user u WHERE u.url = :url)) AND sp.id = :id" , nativeQuery = true)
	public SubscribePurchaseVO subT(@Param("url") String url, @Param("id") long id);
	
	
}
