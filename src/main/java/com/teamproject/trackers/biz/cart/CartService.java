package com.teamproject.trackers.biz.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {
	
	private CartRepository cartRepository;
	
	@Autowired
	public CartService(CartRepository cartRepository) {
		this.cartRepository = cartRepository;
	}
	
	
	
	public void insertCart(CartVO vo) {
		cartRepository.save(vo);
	}
	

}
