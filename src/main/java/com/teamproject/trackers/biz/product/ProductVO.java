package com.teamproject.trackers.biz.product;

public class ProductVO {
	private long p_id;
	private long id;
	private String p_name;
	private int price;
	private int sale;
	private String thumbnail;
	private String file;
	private boolean signature;
	
	
	public long getP_id() {
		return p_id;
	}
	public void setP_id(long p_id) {
		this.p_id = p_id;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public boolean isSignature() {
		return signature;
	}
	public void setSignature(boolean signature) {
		this.signature = signature;
	}
}
