package com.teamproject.trackers.biz.post;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.data.annotation.Immutable;

@Entity
@Immutable 
@Table(name = "postinfolist")
public class PostInfoListVO {
 
	@Id
	@Column(name = "post_id")
	private long postId;
	
	private long id; 
	private Long p_id;
	
	@Temporal(TemporalType.DATE)
	@Column(name="cre_date")
	private Date creDate = new Date();	

	private String content;
	private String name;
	private String url;
	private String profile_img;
	private int c_count;
	private int t_count;
	
	
	public long getPostId() {
		return postId;
	}
	public void setPostId(long postId) {
		this.postId = postId;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Long getP_id() {
		return p_id;
	}
	public void setP_id(Long p_id) {
		this.p_id = p_id;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	public int getT_count() {
		return t_count;
	}
	public void setT_count(int t_count) {
		this.t_count = t_count;
	}
	
}
