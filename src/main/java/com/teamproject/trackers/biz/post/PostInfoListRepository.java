package com.teamproject.trackers.biz.post;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

public interface PostInfoListRepository extends JpaRepository<PostInfoListVO, Long>{
	
	// 포스트 분류 타입 x, 검색 o
	Page<PostInfoListVO> findByContentContaining(String keyword, Pageable pageable);
	
	// 포스트 분류 타입 o, 검색 o/x
	// 팔로우한 사람들 포스트만
	@Query(value = "SELECT p.* FROM postinfolist p, follow f WHERE f.from_id=:id and p.id=f.to_id and p.content like %:keyword%",
			 countQuery = "SELECT p.* FROM postinfolist p, follow f WHERE f.from_id=:id and p.id=f.to_id and p.content like %:keyword%",
			 nativeQuery = true)
	Page<PostInfoListVO> getFollowPost(@Param("id") long id, @Param("keyword") String keyword, Pageable pageable);
	
	// 구독한 사람들 포스트만
	@Query(value = "SELECT p.* FROM postinfolist p, subscribepurchase s, subscribeinfo si WHERE p.id=si.id and s.id=:id and s.subscribe_id=si.subscribe_id and p.content like %:keyword%",
			 countQuery = "SELECT p.* FROM postinfolist p, subscribepurchase s, subscribeinfo si WHERE p.id=si.id and s.id=:id and s.subscribe_id=si.subscribe_id and p.content like %:keyword%",
			 nativeQuery = true)
	Page<PostInfoListVO> getSubscribePost(@Param("id") long id, @Param("keyword") String keyword, Pageable pageable);
	
	// 종아요 누른 포스트만
	@Query(value = "SELECT P.* FROM postinfolist p, thumbsup t WHERE t.id=:id and p.post_id=t.post_id and p.content like %:keyword%",
			 countQuery = "SELECT P.* FROM postinfolist p, thumbsup t WHERE t.id=:id and p.post_id=t.post_id and p.content like %:keyword%",
			 nativeQuery = true)
	Page<PostInfoListVO> getLikePost(@Param("id") long id, @Param("keyword") String keyword, Pageable pageable);
	
	// 댓글 단 포스트만
	@Query(value = "SELECT DISTINCT p.* FROM postinfolist p, comment c WHERE p.post_id=c.post_id and c.id=:id and p.content like %:keyword%",
			 countQuery = "SELECT DISTINCT p.* FROM postinfolist p, comment c WHERE p.post_id=c.post_id and c.id=:id and p.content like %:keyword%",
			 nativeQuery = true)
	Page<PostInfoListVO> getCommontPost(@Param("id") long id, @Param("keyword") String keyword, Pageable pageable);
}