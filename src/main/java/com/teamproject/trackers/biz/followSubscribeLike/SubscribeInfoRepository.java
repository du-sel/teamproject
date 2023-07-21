package com.teamproject.trackers.biz.followSubscribeLike;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface SubscribeInfoRepository extends JpaRepository<SubscribeInfoVO, Long> {
	
	// 구독 정보 조회
	@Query(value = "SELECT * FROM subscribeinfo si WHERE si.id = :id", nativeQuery = true)
	SubscribeInfoVO getSubscribeInfo(@Param("id") long id); 
	
	// 구독 정보 수정
	@Modifying(clearAutomatically = true)
	@Transactional
	@Query(value = "UPDATE subscribeinfo si SET si.file = :file, si.content = :content, si.price = :price WHERE si.id = :id", nativeQuery = true)
	void updateSubscribeInfo(@Param("id")long id, @Param("file")String file, @Param("content")String content, @Param("price")int price);	

	// 구독 비활성화
	@Modifying
	@Query(value = "DELETE FROM subscribeinfo si WHERE si.id = :id", nativeQuery = true)
	void deleteSubscribeInfo(@Param("id")long id);
	
	
	// 구독자 수 세기 
	//SELECT COUNT(*) AS 구독자 	FROM subscribepurchase sp JOIN subscribeinfo si ON sp.subscribe_id = si.subscribe_id JOIN user u ON si.id = u.id WHERE u.id = '1';
	@Query(value = "SELECT COUNT(*) AS 구독자 	FROM subscribepurchase sp JOIN subscribeinfo si ON sp.subscribe_id = si.subscribe_id JOIN user u ON si.id = u.id WHERE u.id = :subid;",nativeQuery = true)
	SubscribeInfoVO countSub(@Param("subid")long id);
	
}