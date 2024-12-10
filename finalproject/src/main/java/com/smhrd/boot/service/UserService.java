package com.smhrd.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.boot.mapper.UserMapper;
import com.smhrd.boot.model.namdoro;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {
	
	private final UserMapper mapper;
	
	public int signup(namdoro user) {
		return mapper.signup(user);
	}
	
	public namdoro login(namdoro member) {
		return mapper.login(member);
	}
	
	//아이디 찾기
	public List<namdoro> findId(namdoro member) {
		return mapper.findId(member);
	}
	
	//비밀번호 찾기
	public List<namdoro> findPw(namdoro member) {
		return mapper.findPw(member);
	
	}
	
	//수정하기(업데이트)
	public int myPageInfo(namdoro member) {
		return mapper.update(member);
	}
	
	// 회원탈퇴(삭제)
	public int delete(String id) {
		return mapper.delete(id);
		}
	
	//로그아웃
	
	
}
