package com.teamproject.trackers.biz.product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.teamproject.trackers.biz.purchase.PurchaseVO;

public interface ProductRepository extends JpaRepository<ProductVO, Long> {
	
	
	// p_id로 특정 상품 조회
	ProductVO findByPid(long pid);
	
	
	@Query(value = "SELECT * FROM products p WHERE p.signature=1", nativeQuery = true)
	List<ProductVO> getCreatorSignatureList();	
	
	
	
	
}