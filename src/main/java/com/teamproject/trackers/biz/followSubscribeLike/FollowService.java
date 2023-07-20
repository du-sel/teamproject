package com.teamproject.trackers.biz.followSubscribeLike;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FollowService {

	@Autowired
	private FollowRepository followRepository;

	
	public FollowVO getFollow(long id, String url) {
		return followRepository.getFollow(id, url);
	}

	public Object getFollower(long id) {
		return followRepository.countbyId(id);
	}
	
	
}
