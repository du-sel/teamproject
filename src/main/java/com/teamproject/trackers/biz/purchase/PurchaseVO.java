package com.teamproject.trackers.biz.purchase;

import java.sql.Date;

public class PurchaseVO {
	private int id;
	private int bak_p_id;
	private Date cre_date;
	private int price;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBak_p_id() {
		return bak_p_id;
	}
	public void setBak_p_id(int bak_p_id) {
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
