package com.teamproject.trackers.view.purchase;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.trackers.biz.purchase.PurchaseService;
import com.teamproject.trackers.biz.purchase.PurchaseVO;


@Controller
@RequestMapping("/store")
public class PurchaseController {

	private PurchaseService purchaseService;
    private HttpSession session;
	
    @Autowired
	public PurchaseController(PurchaseService purchaseService, HttpSession session) {
		this.purchaseService = purchaseService;
		this.session = session;
	}
	

	@RequestMapping(value="/purchases/{p_id}", method=RequestMethod.POST)
	public String insertPurchase(@PathVariable("p_id") String p_id) {
		System.out.println("insertPurchase() 실행");
		System.out.println("test p_id : "+p_id);
		
		// INSERT 할 VO 객체 준비
		PurchaseVO vo = new PurchaseVO();
		vo.setBak_p_id(Long.parseLong(p_id));
		//vo.setId((long)session.getAttribute("id"));
		
		// 일단 테스트로 아무값이나 넣어보겠음
		vo.setId(110);
		vo.setPrice(1000);
		vo.setCre_date(new Date(2023, 3, 3));
		
		purchaseService.insertPurchase(vo);
		
		return "redirect:/store/products/"+p_id;
	}
	
	
	
	
}
