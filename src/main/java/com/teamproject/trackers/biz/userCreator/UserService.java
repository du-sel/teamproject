package com.teamproject.trackers.biz.userCreator;

import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	private UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	// 로그인
	public UserVO isUser(UserVO vo) {		
		return userRepository.findByEmailAndPassword(vo.getEmail(), vo.getPassword());
	}
	
	// 회원 조희
	public Optional<UserVO> getUser(UserVO vo) {
		return userRepository.findById(vo.getId());
	}
	
	// 회원가입(회원 추가)
	public void insertUser(UserVO vo) {
		userRepository.save(vo);
	}
	
	// 회원 정보 수정
	public void updateUser(UserVO vo) {
		userRepository.updateUser(vo.getId(), vo.getName(), vo.getTel(), vo.getUrl(), vo.getInstagram(), vo.getYoutube());
	}
	
	// 비밀번호 수정
	public void updateUserPwd(UserVO vo) {
		userRepository.updateUserPwd(vo.getId(), vo.getPassword());
	}
	
	// 회원 탈퇴(회원 삭제)
	public void deleteUser(UserVO vo) {
		userRepository.deleteById(vo.getId());
	}
	
	/*
	// 유효성
	// 이메일(중복 체크)
	public boolean validateEmail(UserVO vo) {
		return userRepository.findByEmail(vo.getEmail());
	}
	
	// url(중복 체크)
	public boolean validateURL(UserVO vo) {
		return userRepository.findByUrl(vo.getUrl());
	}
	
	// 비밀번호(기존 비밀번호 체크)
	public boolean validateUserPwd(UserVO vo) {
		return false;
		
		//session 에 정보 어디까지 저장? 
	}
	*/
}
