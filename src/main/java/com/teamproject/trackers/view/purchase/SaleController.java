package com.teamproject.trackers.view.purchase;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.trackers.biz.purchase.PurchaseService;

@Controller
public class SaleController {
	private PurchaseService purchaseService;
    private HttpSession session;
	
    
    @Autowired
	public SaleController(PurchaseService purchaseService, 
			HttpSession session) {
		this.purchaseService = purchaseService;
		this.session = session;
	}

	
	/* 판매 현황 */
	@RequestMapping(value="/store/sales", method=RequestMethod.GET)
	public String getSalesStatus(Model model) {
		long id = (long) session.getAttribute("id");
		String months = "", p_cnt = "";
		int price = 0, m_sum = 0, p_sum = 0;
		java.util.Date now = new java.util.Date();
		List<Object[]> products = purchaseService.getBest5Sales(id);
		
		for(int i=1; i<13; i++) {
			price = purchaseService.getMonthSales(id, i);
			m_sum += price;
			months += price+" ";
		}
		
		for(Object[] p : products) {
			p_cnt += (p[1])+" ";
			p_sum += Integer.parseInt(p[2].toString());
		}
		
		// 월별&이번 달 판매 수익
		model.addAttribute("now", now);
		model.addAttribute("months", months);
		model.addAttribute("m_sum", m_sum);
		model.addAttribute("oneMonth", purchaseService.getMonthSales(id, now.getMonth()+1));
		
		// 베스트5 상품
		model.addAttribute("products", products);
		model.addAttribute("p_sum", p_sum);
		model.addAttribute("p_cnt", p_cnt);
		
		return "/my-store/sales-status";
	}
	
}
