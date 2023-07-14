package com.teamproject.trackers.biz.purchase;

import java.sql.Date;

public class PurchaseVO {
	private long id;
	private long bak_p_id;
	private Date cre_date;
	private int price;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getBak_p_id() {
		return bak_p_id;
	}
	public void setBak_p_id(long bak_p_id) {
		this.bak_p_id = bak_p_id;
	}
	public Date getCre_date() {
		return cre_date;
	}
	public void setCre_date(Date cre_date) {
		this.cre_date = cre_date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
