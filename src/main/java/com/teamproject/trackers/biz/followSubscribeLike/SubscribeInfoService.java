package com.teamproject.trackers.biz.followSubscribeLike;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubscribeInfoService {
	
	@Autowired
	private SubscribeInfoRepository subscribeInfoRepository;
	
	// 구독 정보 조회
	public SubscribeInfoVO getSubscribeInfo(SubscribeInfoVO vo) {
		return subscribeInfoRepository.getSubscribeInfo(vo.getId());
	}
	
	// 구독 활성화(등록)
	public void insertSubscribeInfo(SubscribeInfoVO vo) {
		subscribeInfoRepository.save(vo);
	}
	
	// 구독 수정
	public void updateSubscribeInfo(SubscribeInfoVO vo) {
		subscribeInfoRepository.updateSubscribeInfo(vo.getId(), vo.getFile(), vo.getContent(), vo.getPrice());
	}
	// 구독 비활성화(삭제)
	public void deleteSubscribeInfo(SubscribeInfoVO vo) {
		subscribeInfoRepository.deleteSubscribeInfo(vo.getId());
	}
}
