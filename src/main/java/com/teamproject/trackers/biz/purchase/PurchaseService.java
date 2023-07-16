package com.teamproject.trackers.biz.purchase;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

@Service
public class PurchaseService {
	
	private PurchaseRepository purchaseRepository; 
	
	@Autowired
	public PurchaseService(PurchaseRepository purchaseRepository) {
		this.purchaseRepository = purchaseRepository;
	}
	
	
	
	// 상품 구매 - purchase 테이블에 INSERT
	public void insertPurchase(PurchaseVO vo) {
		purchaseRepository.save(vo);
	}
	
	
	
	
	
	
	






}
