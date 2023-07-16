package com.teamproject.trackers.view.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siot.IamportRestClient.IamportClient;
import com.teamproject.trackers.biz.regularPurchase.VerifyService;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	private VerifyService verifyService;
	
	@Autowired
	public PayController(VerifyService verifyService) {
		this.verifyService = verifyService;
	}
	
	
	
	
	
	

}
