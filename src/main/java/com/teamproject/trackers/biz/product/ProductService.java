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
	
	private ProductRepository productRepository;
	private DesignCategoryRepository designCategoryRepository;
	private PageCategoryRepository pageCategoryRepository;	
	private ProductDetailRepository productDetailRepository;
	private CreatorListRepository creatorlistRepository;
	
	@Autowired
	public ProductService(ProductRepository productRepository,
			DesignCategoryRepository designCategoryRepository,
			PageCategoryRepository pageCategoryRepository,
			ProductDetailRepository productDetailRepository,
			CreatorListRepository creatorlistRepository) {
		
		this.productRepository= productRepository;
		this.designCategoryRepository = designCategoryRepository;
		this.pageCategoryRepository = pageCategoryRepository;
		this.productDetailRepository = productDetailRepository;
		this.creatorlistRepository = creatorlistRepository;
	}
	
	
	
	/* p_id 로 특정 상품 조회 */
	public ProductVO getProduct(long pId) {
		return productRepository.findByPid(pId);
	}
	
	/* 파일 이름으로 특정 상품 조회 */
	public ProductVO getProductByFile(String file) {
		return productRepository.findByFile(file);
	}
	
	
	public void insertProduct(ProductVO vo) {
		productRepository.save(vo);
	}

	/* 상품 카테고리 등록 - 디자인 */
	public void insertDesignCategory(DesignCategoryVO vo) {
		System.out.println("디자인객체 pid"+vo.getPid());
		designCategoryRepository.save(vo);
	}
	/* 상품 카테고리 등록 - 페이지 */
	public void insertPageCategory(PageCategoryVO vo) {
		System.out.println("페이지객체 pid"+vo.getPid());
		pageCategoryRepository.save(vo);
	}
	
	/* 상품 디테일 등록 */
	public void insertProductDetail(ProductDetailVO vo) {
		productDetailRepository.save(vo);
	}
	

	
	// 스토어 조회(검색 x)
	public Page<CreatorListVO> getCreatorList(Pageable pageable) {
		return creatorlistRepository.findAll(pageable);

	}
	
	// 스토어 조회(검색 o)
	public Page<CreatorListVO> getSearchCreatorList(String keyword, Pageable pageable) {
		return creatorlistRepository.findBystoreNameContaining(keyword, pageable);
	}
	
	// 스토어 대표 상품 리스트
	public List<ProductVO> getCreatorSignatureList(){
		return productRepository.getCreatorSignatureList();
	}
}
