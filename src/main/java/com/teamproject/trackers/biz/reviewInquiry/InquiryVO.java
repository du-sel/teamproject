package com.teamproject.trackers.biz.reviewInquiry;

import java.sql.Date;

public class InquiryVO {
	private long inquiry_id;
	private long p_id;
	private long id;
	private Date cre_date;
	private String title;
	private String content;
	private String answer;
	
	
	public long getInquiry_id() {
		return inquiry_id;
	}
	public void setInquiry_id(long inquiry_id) {
		this.inquiry_id = inquiry_id;
	}
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
	public Date getCre_date() {
		return cre_date;
	}
	public void setCre_date(Date cre_date) {
		this.cre_date = cre_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
