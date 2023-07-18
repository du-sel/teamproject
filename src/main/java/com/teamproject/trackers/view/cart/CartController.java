package com.teamproject.trackers.view.cart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.trackers.biz.cart.CartService;
import com.teamproject.trackers.biz.cart.CartVO;
import com.teamproject.trackers.biz.drive.DriveController;
import com.teamproject.trackers.biz.product.ProductService;

@Controller
@RequestMapping("/store")
public class CartController {
	
	
    private CartService cartService;
    private HttpSession session;
    
    @Autowired
	public CartController(CartService cartService, HttpSession session, DriveController drive) {
		this.cartService = cartService;
		this.session = session;
	}
	
	
	
    @RequestMapping(value="/carts/{p_id}", method=RequestMethod.POST)
	public void insertCart(@PathVariable("p_id") String p_id) {
		
    	CartVO cart = new CartVO();
    	cart.setP_id(Long.parseLong(p_id));
    	cart.setId((long)session.getAttribute("id"));
    	cartService.insertCart(cart);
    	
	}
	

}
