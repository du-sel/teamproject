package com.teamproject.trackers.biz.product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepository extends JpaRepository<ProductVO, Long> {
	
	@Query(value = "SELECT p.id, p.p_id, p.thumbnail FROM products p WHERE p.signature=1", nativeQuery = true)
	List<ProductVO> getCreatorSignatureList();	
	
}