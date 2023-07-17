
package com.teamproject.trackers.view.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//----------------정희 추가-----------------

import com.teamproject.trackers.biz.product.ProductCreatorVO;
import com.teamproject.trackers.biz.product.ProductService;
import com.teamproject.trackers.biz.product.ProductVO;

import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
//----------------정희 추가-----------------
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;


@Controller
@RequiredArgsConstructor
@RequestMapping("/store")
public class ProductController {

	//---------정희 추가---------
	@Autowired
    private ProductService productService;
	//---------정희 추가---------
	
	
	// 스토어 메인
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String stMain() {
		return "store/st-main";
	}

	// 상품 상세 조회
	@RequestMapping(value="/products/{p_id}", method=RequestMethod.GET)
	public String getProduct(@PathVariable("p_id") String p_id) {
		System.out.println("getProduct() 실행");
		System.out.println("p_id: "+p_id);
	
		return "store/st-product-single";
	}
	
	// 상품 리스트 조회
	@RequestMapping(value="/products", method=RequestMethod.GET)
	public String getProductList() {
		
		
		return "/store/st-products";
	}
/*----------------정희 추가-----------------*/
    /*
	// 상품 등록 페이지
    @GetMapping("/products/new")
    public String showProductForm() {
        return "store/st-products";
    }

    // 상품 등록 처리
    @PostMapping("/products")
    public String insertProduct(
            @RequestParam("name") String name,
            @RequestParam("price") int price,
            @RequestParam("file") MultipartFile file) {

        // 상품 등록 로직
        /*ProductVO product = new ProductVO();
        product.setP_name(name);
        product.setPrice(price);
        productService.insertProduct(product);

        return "redirect:/my-store/product-management";
    }

    // 파일 저장 로직
    private String saveFile(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        // 파일 저장 로직 구현
        // 예를 들어, 파일을 저장하고 저장된 파일명을 반환한다.
        return fileName;
    }

    // 상품 수정 페이지
    @GetMapping("/products/{p_id}/edit")
    public String showEditProductForm(@PathVariable("p_id") String p_id) {
        // 상품 정보 조회 및 수정 페이지로 이동
        return "my-store/product-management";
    }

    // 상품 수정 처리
    @PostMapping("/products/{p_id}")
    public String updateProduct(
            @PathVariable("p_id") String p_id,
            @RequestParam("name") String name,
            @RequestParam("price") int price,
            @RequestParam(value = "file", required = false) MultipartFile file) {
    	*/
/*
        // 상품 수정 로직
        ProductVO product = productService.getProductById(p_id);
        if (product != null) {
            product.setP_name(name);
            product.setPrice(price);
            if (!file.isEmpty()) {
                // 파일 업로드 처리 로직
                String fileName = saveFile(file);
                // 파일명을 이용하여 thumbnail 정보를 처리하는 로직을 구현합니다.
                // product.setThumbnail(fileName);
            }
            productService.updateProduct(product);
        }

        return "redirect:/store/st-products";
    }

    // 상품 삭제
    @PostMapping("/products/{p_id}/delete")
    public String deleteProduct(@PathVariable("p_id") long p_id) {
        // 상품 삭제 로직
        //productService.deleteProduct(p_id);

        return "redirect:/store/st-products";
    }
    
    /*----------------정희 추가-----------------*/
	
	
	// 크리에이터 리스트 조회
	
	// 크리에이터 리스트 정렬
	@RequestMapping(value="/creators", method=RequestMethod.GET)
	public String getCreatorList(int page, String sort, Model model, String keyword) {
		
		List<ProductVO> p = productService.getCreatorSignatureList();
		HashMap<Long, List<ProductVO>> signature = new HashMap<>();
		for(ProductVO item : p) {
			if(signature.get(item.getId()) != null) {
				signature.get(item.getId()).add(item);
			}else {
				ArrayList<ProductVO> list = new ArrayList<>();
				list.add(item);
				signature.put(item.getId(), list);
			}
		}
		
		Page<ProductCreatorVO> list = null;
		Pageable pageable = PageRequest.of(page, 2, Sort.by(Sort.Direction.DESC, sort));	// 시작 페이지, 데이터 개수, 정렬 기준
		if(keyword != null) {
			list = productService.getSearchCreatorList(keyword, pageable);
		}
		else {
			list = productService.getCreatorList(pageable);
		}
		

		int nowPage = list.getPageable().getPageNumber()+1;		// 0부터 시작하므로 +1
		int startPage = Math.max(nowPage-1, 1);
		int endPage = Math.min(nowPage+2, list.getTotalPages());
		
		//int startPage = Math.max(nowPage-4, 1);
		//int endPage = Math.min(nowPage+5, list.getTotalPages());
		

		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("creators", list);
		model.addAttribute("signature", signature);
		model.addAttribute("sort", sort);
		
		
		return "/store/st-creators";
	}	
}


