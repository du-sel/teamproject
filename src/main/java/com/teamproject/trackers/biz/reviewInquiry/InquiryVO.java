package com.teamproject.trackers.biz.reviewInquiry;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="inquiry")
public class InquiryVO {
	
	@Id
	private long inquiry_id;
	
	@Column(name="p_id")
	private long pid;
	private long id;
	private String name;
	@Temporal(TemporalType.DATE)
	@Column(name = "cre_date")
	private Date creDate;
	private String title;
	private String content;
	private String answer;
	@Temporal(TemporalType.DATE)
	private Date answer_date;
	
	
	public long getInquiry_id() {
		return inquiry_id;
	}
	public void setInquiry_id(long inquiry_id) {
		this.inquiry_id = inquiry_id;
	}
	public long getPid() {
		return pid;
	}
	public void setPid(long pid) {
		this.pid = pid;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
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
	public Date getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
	}	
}
