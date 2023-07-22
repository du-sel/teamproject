package com.teamproject.trackers.biz.followSubscribeLike;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FollowService {

	@Autowired
	private FollowRepository followRepository;

	
	public FollowVO getFollow(long id) {
		return null;
		/* return followRepository.getFollow(id); */
	}
	
	public Object Follower(String url) {
		return (long) followRepository.Follower(url);
	}
	
	public void deleteFollower(FollowVO vo) {
		/* followRepository.deleteFollow(vo.getFrom_id(), vo.getTo_id()); */
	}

	
		
	
	
	
}
