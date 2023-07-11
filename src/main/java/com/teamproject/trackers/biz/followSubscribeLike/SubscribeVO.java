package com.teamproject.trackers.biz.followSubscribeLike;

import java.sql.Date;

public class SubscribeVO {
	private int subscibe_id;
	private int id;
	private int cid;
	private Date subscibe_date;
	
	
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
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public Date getSubscibe_date() {
		return subscibe_date;
	}
	public void setSubscibe_date(Date subscibe_date) {
		this.subscibe_date = subscibe_date;
	}

	
}
