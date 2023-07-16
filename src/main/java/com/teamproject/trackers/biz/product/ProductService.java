package com.teamproject.trackers.biz.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private ProductCreatorRepository productcreatorRepository;
	
	
	// 스토어 조회(정렬)
	public List<ProductCreatorVO> getCreatorList(String sort) {		
		if(sort.equals("newest")) sort="creDate";
		return productcreatorRepository.findAll(Sort.by(Sort.Direction.DESC, sort));
	}
	// 스토어 대표 상품 리스트
	public List<ProductVO> getCreatorSignatureList(){
		return productRepository.getCreatorSignatureList();
	}
}
