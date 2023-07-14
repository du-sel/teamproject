package com.teamproject.trackers.biz.product;

public class ProductDTO {
    private String name;
    private int price;
    // 필요한 상품 속성들을 추가로 정의합니다.
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

}
