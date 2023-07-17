package com.teamproject.trackers.biz.product;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private ProductCreatorRepository productcreatorRepository;
	
	
	
	public ProductVO getProduct(long pId) {
		return productRepository.findByPid(pId);
	} 
	
	
	// 스토어 조회(정렬)

  // 스토어 조회(검색 x)

	public Page<ProductCreatorVO> getCreatorList(Pageable pageable) {
		return productcreatorRepository.findAll(pageable);
	}
	
	// 스토어 조회(검색 o)
	public Page<ProductCreatorVO> getSearchCreatorList(String keyword, Pageable pageable) {
		return productcreatorRepository.findBystoreNameContaining(keyword, pageable);
	}
	
	// 스토어 대표 상품 리스트
	public List<ProductVO> getCreatorSignatureList(){
		return productRepository.getCreatorSignatureList();
	}
}
