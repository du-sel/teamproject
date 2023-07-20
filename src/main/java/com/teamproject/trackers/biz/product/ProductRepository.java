package com.teamproject.trackers.biz.product;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.teamproject.trackers.biz.purchase.PurchaseVO;

public interface ProductRepository extends JpaRepository<ProductVO, Long> {
	
	
	// p_id로 특정 상품 조회
	ProductVO findByPid(long pid);
	
	// 파일이름으로 특정 상품 조회
	ProductVO findByFile(String file);
	
	// 크리에이터별 대표상품 조회
	@Query(value = "SELECT * FROM products p WHERE p.id=:id and p.signature=1 ORDER BY p.cre_date", nativeQuery = true)
	List<ProductVO> getCreatorSignatureList(@Param("id") long id);	
	
	// 인기 크리에이터 대표 상품 조회
	ProductVO findTopByIdAndSignatureOrderByRatingDescCreDateDesc(long id, boolean signature);	
}