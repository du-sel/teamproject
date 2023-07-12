package com.teamproject.trackers.biz.followSubscribeLike;

import java.sql.Date;

public class SubscribeInfoVO {
	private long subscibe_id;
	private long id;
	private String content;
	private int price;
	
	
	public long getSubscibe_id() {
		return subscibe_id;
	}
	public void setSubscibe_id(long subscibe_id) {
		this.subscibe_id = subscibe_id;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
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
