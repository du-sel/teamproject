package com.teamproject.trackers.view.purchase;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/store")
public class PurchaseController {
	
	

	@RequestMapping(value="/purchases/{p_id}", method=RequestMethod.POST)
	public String insertPurchase(@PathVariable("p_id") String p_id) {
		System.out.println("insertPurchase() 실행");
		System.out.println("test p_id : "+p_id);
		
		
		return "redirect:/store/products/"+p_id;
	}
	
	
	
	
}
