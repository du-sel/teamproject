package com.teamproject.trackers.view.product;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/store")
public class ProductController {

	
	// 상품 상세 조회
	@RequestMapping(value="/products/{p_id}", method=RequestMethod.GET)
	public String getProduct(@PathVariable("p_id") String p_id) {
		System.out.println("getProduct() 실행");
		System.out.println("p_id: "+p_id);
	
		return "store/st-product-single";
	}
	
}
