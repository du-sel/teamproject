package com.teamproject.trackers.biz.purchase;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;

@Service
public class PurchaseService {
	
	private PurchaseRepository purchaseRepository; 
	private PurchaseListRepository purchaselistRepository; 
	
	@Autowired
	public PurchaseService(PurchaseRepository purchaseRepository, PurchaseListRepository purchaselistRepository) {
		this.purchaseRepository = purchaseRepository;
		this.purchaselistRepository = purchaselistRepository;
	}
	
	
	
	// 상품 구매 - purchase 테이블에 INSERT
	public void insertPurchase(PurchaseVO vo) {
		purchaseRepository.save(vo);
	}
	
	// 구매내역 조회
	public Page<PurchaseListVO> getPurchaseList(PurchaseListVO vo, Pageable pageable) {
		return purchaselistRepository.findAllById(vo.getId(), pageable);
	}
	
	
	
	
	
	
	






}
