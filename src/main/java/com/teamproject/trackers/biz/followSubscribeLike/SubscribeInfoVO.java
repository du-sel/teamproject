package com.teamproject.trackers.biz.followSubscribeLike;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="subscribeinfo")
public class SubscribeInfoVO {

	@Id
	@Column(name = "subscribe_id")
	private long subscribeId;
	private long id;
	private String content;
	private int price;
	
	
	public long getSubscribeId() {
		return subscribeId;
	}
	public void setSubscribeId(long subscribeId) {
		this.subscribeId = subscribeId;
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
