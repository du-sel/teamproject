package com.teamproject.trackers.view.regularPurchase;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.siot.IamportRestClient.IamportClient;
import com.teamproject.trackers.biz.regularPurchase.TokenVO;
import com.teamproject.trackers.biz.regularPurchase.VerifyService;

@RestController
public class RegularPurchaseController {
	
	private VerifyService verifyService;
	
	
	@Autowired
	public RegularPurchaseController(VerifyService verifyService) {
		this.verifyService = verifyService;
	}

	
	// 테스트용 URL / 테스트용 메소드명
	@RequestMapping(value="/purchaseAgain", method=RequestMethod.POST)
    public String purchaseAgain() {
    	String token = verifyService.getToken();
		token = token.substring(token.indexOf("response") + 10);
		token = token.substring(0, token.length() - 1);
		
		Gson str = new Gson();
		TokenVO vo = str.fromJson(token, TokenVO.class);
		String access_token = vo.getAccess_token();
		
		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", access_token);

		Map<String, Object> map = new HashMap<>();
		map.put("customer_uid", "2");
		map.put("merchant_uid", "order_monthly_00022");
		map.put("amount", 120);
		map.put("name", "최초인증결제");

		Gson var = new Gson();
		String json = var.toJson(map);
		System.out.println(json);
		HttpEntity<String> entity = new HttpEntity<>(json, headers);
		System.out.println(entity);
		
		
		return restTemplate.postForObject("https://api.iamport.kr/subscribe/payments/again", entity, String.class);

    }
	
	
}
