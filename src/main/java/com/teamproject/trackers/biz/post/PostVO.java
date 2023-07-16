package com.teamproject.trackers.biz.post;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedDate;

import com.teamproject.trackers.biz.userCreator.UserVO;

@Entity
@Table(name = "post")
public class PostVO {

	@Id
	private long post_id;

	@JoinColumn(name = "user_id")
	private long id;

	@JoinColumn(columnDefinition="integer", name = "products_p_id") //외래키
	@Column(nullable = true) //null허용
	private Long p_id; // wrapper타입일 때 null로 insert됨

	//@CreatedDate
	@Temporal(TemporalType.DATE)
	private Date cre_date = new Date();	

	private String content;

	
	public long getPost_id() {
		return post_id;
	}
	public void setPost_id(long post_id) {
		this.post_id = post_id;
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
	public Date getCre_date() {
		return cre_date;
	}
	public void setCre_date(Date cre_date) {
		this.cre_date = cre_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
