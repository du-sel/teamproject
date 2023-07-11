package com.teamproject.trackers.biz.product;

public class DesignCatetoryVO {
	private int p_id;
	private boolean minimal;
	private boolean illustration;
	private boolean photo;
	
	
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public boolean isMinimal() {
		return minimal;
	}
	public void setMinimal(boolean minimal) {
		this.minimal = minimal;
	}
	public boolean isIllustration() {
		return illustration;
	}
	public void setIllustration(boolean illustration) {
		this.illustration = illustration;
	}
	public boolean isPhoto() {
		return photo;
	}
	public void setPhoto(boolean photo) {
		this.photo = photo;
	}
	
}
