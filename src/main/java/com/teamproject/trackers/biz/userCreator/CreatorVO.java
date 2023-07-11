package com.teamproject.trackers.biz.userCreator;

public class CreatorVO {
	private int id;
	private String store_name;
	private String bank;
	private String account;
	private boolean subscribe;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public boolean isSubscribe() {
		return subscribe;
	}
	public void setSubscribe(boolean subscribe) {
		this.subscribe = subscribe;
	}
}
