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
	private String filePath;
	
	public PostIMGVO() {	}
	
	@Builder
	public PostIMGVO(String img, String filePath) {
		this.img = img;
		this.filePath = filePath;
	}
	
	
	public Long getImgid() {
		return imgid;
	}
	public void setImgid(Long imgid) {
		this.imgid = imgid;
	}
	public long getPostId() {
		return postId;
	}
	public void setPostId(long postId) {
		this.postId = postId;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
}
