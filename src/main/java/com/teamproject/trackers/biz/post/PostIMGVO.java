package com.teamproject.trackers.biz.post;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
<<<<<<< HEAD
     
=======
  
>>>>>>> refs/heads/main
@Entity
@Table(name = "postimg")
public class PostIMGVO { 	
	@Id
	@Column(name = "post_id")
	private long postId;
	
	@Column(name = "img")
	private String postimg;
	
	@Column(name = "id")
	private Long id;
	
	@Transient
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	
	public long getPostId() {
		return postId;
	}
<<<<<<< HEAD
	public void setPost_id(long postId) {
=======
	public void setPostId(long postId) {
>>>>>>> refs/heads/main
		this.postId = postId;
	}
	public String getPostimg() {
		return postimg;
	}
	public void setPostimg(String postimg) {
		this.postimg = postimg;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}	
}
