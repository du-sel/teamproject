package com.teamproject.trackers.view.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamproject.trackers.biz.cart.CartInfoVO;
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
	
	
    
    
    /* 장바구니 목록 페이지 */
    @RequestMapping(value="/carts", method=RequestMethod.GET)
    public String getCartList(Model model) {
    	List<CartInfoVO> list = cartService.getCartList((long)session.getAttribute("id"));
    	
    	model.addAttribute("cartlist", list);
    	
    	return "my/cart";
    }
    
    
	
    /* 장바구니에 상품 추가 */
    @RequestMapping(value="/carts/{p_id}", method=RequestMethod.POST)
	public String insertCart(@PathVariable("p_id") String p_id, CartVO vo) {
		
    	CartVO cart = new CartVO();
    	cart.setP_id(Long.parseLong(p_id));
    	cart.setId((long)session.getAttribute("id"));
    	cartService.insertCart(cart);
    	
    	return "redirect:/store/carts";
	}
	

}
