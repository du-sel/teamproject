package com.teamproject.trackers.biz.product;

public class ProductSearchCondition {
    private String name;
    private int minPrice;
    private int maxPrice;
    // 필요한 검색 조건들을 추가로 정의합니다.
	
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

    
}
