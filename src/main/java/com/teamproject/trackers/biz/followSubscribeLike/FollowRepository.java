package com.teamproject.trackers.biz.followSubscribeLike;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface FollowRepository extends JpaRepository<FollowVO, FollowId> {

	// 팔로우 정보 조회 -구독한 사람의 정보를 찾는거
	@Query(value = "SELECT f.from_id, f.to_id FROM follow f WHERE f.from_id = :id AND f.to_id IN (SELECT id FROM user WHERE url = :url)", nativeQuery = true)
	FollowVO getFollower(@Param("id") long id ,@Param("url") String url);
	
	
	// 팔로우 정보 수정 -구독한 사람의 정보를 제거하는거(팔로우 취소)
	//@Query(value="DELETE FROM follow WHERE from_id IN (SELECT id FROM user WHERE id = :id)", nativeQuery = true)
	//void deleteFollow(long id);
	
	
}
