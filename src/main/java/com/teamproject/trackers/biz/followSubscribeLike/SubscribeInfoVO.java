package com.teamproject.trackers.biz.followSubscribeLike;

import java.sql.Date;

public class SubscribeInfoVO {
	private int subscibe_id;
	private int id;
	private String content;
	private int price;
	
	
	public int getSubscibe_id() {
		return subscibe_id;
	}
	public void setSubscibe_id(int subscibe_id) {
		this.subscibe_id = subscibe_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
