package com.teamproject.trackers.biz.cart;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;


@Entity
@Table(name="cartInfo")
@IdClass(CartId.class)
public class CartInfoVO {
	
	@Id
	private long id;
	@Id
	private long p_id;
	
	private String p_name;
	private String store_name;
	private int price;
	private int sale;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getP_id() {
		return p_id;
	}
	public void setP_id(long p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}

}
