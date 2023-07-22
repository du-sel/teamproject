package com.teamproject.trackers.biz.followSubscribeLike;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface FollowRepository extends JpaRepository<FollowVO, FollowId> {

	// 팔로우 정보 조회 -구독한 사람의 정보를 찾는거
	//@Query(value = "SELECT * FROM follow f WHERE f.from_id IN (SELECT id FROM user WHERE id = :id))", nativeQuery = true)
	//FollowVO getFollow(@Param("id") long id);
	
	// 팔로우 한 사람 수 가져오기 (수정)
	@Query(value = "SELECT COUNT(f.from_id) FROM follow f WHERE f.to_id = (SELECT id FROM user WHERE url = :url)",
			countQuery = "SELECT COUNT(f.from_id) FROM follow f WHERE f.to_id = (SELECT id FROM user WHERE url = :url)",
			nativeQuery = true)
	long Follower(@Param("url") String url);
	
	//@Query(value = "SELECT u2.name, f.from_id, f.to_id, u.name\r\n" + 
	//		"FROM user u\r\n" + 
	//		"JOIN follow f ON f.to_id = u.id\r\n" + 
	//		"JOIN user u2 ON f.from_id = :id\r\n" + 
	//		"WHERE f.from_id = 3 AND u.id IN (SELECT id FROM user WHERE url = :url)", nativeQuery = true)
	//FollowVO getFollower(@Param("id") long id ,@Param("url") String url);
	
	
	// 팔로우 정보 수정 -구독한 사람의 정보를 제거하는거(팔로우 취소)
	//@Query(value="DELETE FROM follow WHERE from_id = :fromid  and to_id = :toid", nativeQuery = true)
	//void deleteFollow(@Param("fromid") long fromid, @Param("toid") long toid);
	
	
}
