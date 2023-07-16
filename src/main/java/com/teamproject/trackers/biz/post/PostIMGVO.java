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
	private long post_id;
	
	@Column(name = "id")
	private Long postimg;
	
	@Transient
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
	public long getPost_id() {
		return post_id;
	}
	public void setPost_id(long post_id) {
		this.post_id = post_id;
	}
	public Long getPostimg() {
		return postimg;
	}
	public void setPostimg(Long postimg) {
		this.postimg = postimg;
	}	
}
