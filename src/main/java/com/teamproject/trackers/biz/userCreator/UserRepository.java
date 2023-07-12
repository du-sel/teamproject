package com.teamproject.trackers.biz.userCreator;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

public interface UserRepository extends JpaRepository<UserVO, Long> {
	
	
	// 회원 정보 조회(이메일, 비밀번호 이용)
	UserVO findByEmailAndPassword(String email, String password);
	/*
	// 이메일 중복 확인
	boolean findByEmail(String email);
	
	// url 중복 확인
	boolean findByUrl(String url);
	
	// 이름, 전화번호, url, sns url 수정
	@Query("UPDATE USER u SET u.name = :name, u.tel = :tel, u.url = :url, u.instagram = :instagram, u.youtube = :youtube")
	void updateUser(@Param("name")String name, @Param("tel")String tel, @Param("url")String url, @Param("instagram")String instagram, @Param("youtube")String youtube);
	
	// 비밀번호 수정
	@Query("UPDATE USER u SET u.password = :password")
	void updatePwd(@Param("password")String pwd);
	
	*/
	
	
}