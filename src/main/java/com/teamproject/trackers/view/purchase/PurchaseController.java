package com.teamproject.trackers.view.purchase;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.teamproject.trackers.biz.product.ProductService;
import com.teamproject.trackers.biz.product.ProductVO;
import com.teamproject.trackers.biz.purchase.PurchaseService;
import com.teamproject.trackers.biz.purchase.PurchaseVO;
import com.teamproject.trackers.biz.purchase.WebhookVO;
import com.teamproject.trackers.biz.regularPurchase.VerifyService;
import com.teamproject.trackers.view.test.GetTokenVO;


@Controller
@RequestMapping("/store")
public class PurchaseController {

	private PurchaseService purchaseService;
	private ProductService productService;
    private HttpSession session;
	
    
    @Autowired
	public PurchaseController(PurchaseService purchaseService, ProductService productService, HttpSession session) {
		this.purchaseService = purchaseService;
		this.productService = productService;
		this.session = session;
	}
	
    @RequestMapping(value="/purchases", method=RequestMethod.GET)
	public String getPurchaseList(PurchaseVO vo) {
    	//purchaseService
    	return "/my/purchase-history";
    }
    
	@RequestMapping(value="/purchases/{p_id}", method=RequestMethod.POST)
	public String insertPurchase(@PathVariable("p_id") String p_id) {
		System.out.println("insertPurchase() 실행");
		System.out.println("test p_id : "+p_id);
		
		// INSERT 할 VO 객체 준비
		PurchaseVO vo = new PurchaseVO();
		vo.setBak_p_id(Long.parseLong(p_id));
		vo.setId((long)session.getAttribute("id"));
		
		ProductVO product = productService.getProduct(Long.parseLong(p_id));
		
		
		// 일단 테스트로 아무값이나 넣어보겠음
		//vo.setId(1);
		vo.setPrice(product.getPrice()-product.getSale());
		vo.setCre_date(new Date(2023, 3, 3));
		
		// 나중에는 상품테이블 조회해서 데이터 가져와서 INSERT 해야함
		
		purchaseService.insertPurchase(vo);
		
		return "redirect:/store/products/"+p_id;
	}
	
	
	
	// 객체 받아서 넣는 버전
	public String insertPurchase(PurchaseVO vo) {
		System.out.println("객체 받아서 insertPurchase() 실행");		
		
		purchaseService.insertPurchase(vo);
		
		long p_id = vo.getBak_p_id();
		return "redirect:/store/products/"+p_id;
	}
	
	

	
	
	
	
}
