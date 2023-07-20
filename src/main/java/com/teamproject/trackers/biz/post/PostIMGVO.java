package com.teamproject.trackers.biz.post;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
  
@Entity
@Table(name = "postimg")
public class PostIMGVO { 	
	@Id
	@Column(name = "img_id")
	private long id;
	
	@Column(name = "post_id")
	private long postId;
	
	@Column(name = "img")
	private String postimg;
	
	
	@Transient
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getPostId() {
		return postId;
	}
	public void setPostId(long postId) {
		this.postId = postId;
	}
	public String getPostimg() {
		return postimg;
	}
	public void setPostimg(String postimg) {
		this.postimg = postimg;
	}
	
	
}
