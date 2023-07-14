package com.teamproject.trackers.biz.followSubscribeLike;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubscribeInfoService {
	
	@Autowired
	private SubscribeInfoRepository SubscribeInfoRepository;
	
	// 구독 활성화(등록 및 수정)
	public void insertSubscribeInfo(SubscribeInfoVO vo) {
		SubscribeInfoRepository.save(vo);
	}
	
	// 구독 비활성화(삭제)
	public void deleteSubscribeInfo(SubscribeInfoVO vo) {
		SubscribeInfoRepository.delete(vo);
	}
}
