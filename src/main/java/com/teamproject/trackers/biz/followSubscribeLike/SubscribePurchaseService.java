package com.teamproject.trackers.biz.followSubscribeLike;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubscribePurchaseService {
	
	@Autowired
	private SubscribePurchaseRepository subscribePurchaseRepository;
	
	public SubscribePurchaseVO getSubscribePurchase(long subscribeId, long id) {
		return subscribePurchaseRepository.findBySubscribeIdAndId(subscribeId, id);
	}

	
	public void insertSubscribePurchase(SubscribePurchaseVO vo) {
		subscribePurchaseRepository.save(vo);		
	}
	
	
	
}
