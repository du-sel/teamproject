package com.teamproject.trackers.biz.followSubscribeLike;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FollowService {

	@Autowired
	private FollowRepository followRepository;

	
	public FollowVO getFollower(long id, String url) {
		return followRepository.getFollower(id, url);
		//return null;
	}
	
	
}
