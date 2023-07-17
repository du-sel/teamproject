package com.teamproject.trackers.view.test;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.teamproject.trackers.biz.product.ProductService;
import com.teamproject.trackers.biz.product.ProductVO;
import com.teamproject.trackers.biz.purchase.PurchaseService;
import com.teamproject.trackers.biz.purchase.PurchaseVO;
import com.teamproject.trackers.biz.purchase.WebhookVO;
import com.teamproject.trackers.biz.regularPurchase.VerifyService;

@RestController
public class WebhookController {
	
	
	private VerifyService verifyService;
	private ProductService productService;
	private PurchaseService purchaseService;
	
	@Autowired
	public WebhookController(VerifyService verifyService, ProductService productService, PurchaseService purchaseService) {
		this.verifyService = verifyService;
		this.productService = productService;
		this.purchaseService = purchaseService;
	}
	
	
	public ResponseEntity<?> getPurchaseInfo(String imp_uid, String access_token) {
		//System.out.println("getPurchaseInfo() 실행");
		// 결제 정보 받아오기
		RestTemplate restTemplate = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    headers.add("Authorization", access_token);
	    
	    //Map<String, Object> map = new HashMap<>();
	    //map.put("imp_key", "");
	    //map.put("imp_secret", "");

	    //Gson var = new Gson();
	    //String json = var.toJson(map);
		//서버로 요청할 Body
	   
	    String url = "https://api.iamport.kr/payments/"+imp_uid;
	    //System.out.println("url: "+url);
	    HttpEntity<String> entity = new HttpEntity<>(headers);
	    
		return restTemplate.exchange(url, HttpMethod.GET, entity, Object.class);
	}
	
	
	
	@RequestMapping(value="/purchase/webhook", method=RequestMethod.POST)
	public String verifyPurchase(@RequestBody WebhookVO webhook, HttpServletRequest request, HttpServletResponse resp) throws IOException {
		//System.out.println("WebhookController 도착");
		//System.out.println(webhook.toString());
		
		// 웹훅에서 imp_uid 받아놓기
		String imp_uid = webhook.getImp_uid();
		
		
		// 토큰 발급
		
		String token = verifyService.getToken();
		Gson str = new Gson();
		token = token.substring(token.indexOf("response") + 10);
		token = token.substring(0, token.length() - 1);

		GetTokenVO vo = str.fromJson(token, GetTokenVO.class);

		String access_token = vo.getAccess_token();
		//System.out.println(access_token);
		
		
		
		//결제 정보 받아오기
		ResponseEntity<?> purchaseInfo = getPurchaseInfo(imp_uid, access_token);
		//System.out.println("purchaseInfo: "+purchaseInfo);
		
		ObjectMapper mapper = new ObjectMapper();
        String info = mapper.writeValueAsString(purchaseInfo.getBody());
        System.out.println(info);
        
        
        // 실제 결제된 금액 구하기 
        String amount = info.substring(info.indexOf("amount")+8);
        amount = amount.substring(0, amount.indexOf(","));
        int paid_price = Integer.parseInt(amount);
        //System.out.println("AMOUNT");
        System.out.println(paid_price);
        
        
        
        // DB에서 상품 금액 조회
        // 결제 정보에서 p_id 구하기
        String p_id = info.substring(info.indexOf("merchant_uid")+15);
        p_id = p_id.substring(0, p_id.indexOf("-"));
        System.out.println(p_id);
        
        ProductVO product = productService.getProduct(Long.parseLong(p_id));
        int price = product.getPrice();
        System.out.println("price: "+price);
        int sale = product.getSale();
        System.out.println("sale: "+sale);
        int fin_price = price - sale;
        System.out.println("fin_price: "+fin_price);
        
        
        // 두 금액 비교
        if(fin_price == paid_price) {
        	// 일치할 시 DB에 purchase 저장
        	System.out.println("일치합니다!");
        	
        	// 결제 정보에서 구매자 id 구하기
            String id = info.substring(info.indexOf("merchant_uid")+15);
            id = id.substring(id.indexOf("-")+1);
            id = id.substring(0, id.indexOf("-"));
            System.out.println("final id: "+id);
        	
        	// VO 만들어서 보내주기
        	PurchaseVO purchase = new PurchaseVO();
        	purchase.setBak_p_id(Long.parseLong(p_id));
        	purchase.setId(Long.parseLong(id));
        	purchase.setC_id(product.getId());
        	purchase.setPrice(fin_price);
        	
        	purchaseService.insertPurchase(purchase);
        } else {
        	// 잘못된 결제건 
        	System.out.println("일치하지 않습니다!");
        }
		
		return "";
	}
	

}
