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

	// 회원가입
	public int signup(namdoro user) {
		// 이메일 중복 체크
		int emailCount = mapper.checkEmailDuplication(user.getUser_id());
		if (emailCount > 0) {
			return -1; // 이메일 중복 시 -1 리턴
		}

		// 닉네임 중복 체크
		int nicknameCount = mapper.checkNicknameDuplication(user.getUser_nickname());
		if (nicknameCount > 0) {
			return -2; // 닉네임 중복 시 -2 리턴
		}

		// 중복이 없으면 회원가입
		return mapper.signup(user);
	}

	// 로그인
	public namdoro login(namdoro member) {
		return mapper.login(member);
	}

	// 아이디 찾기
	public List<namdoro> findId(namdoro member) {
		return mapper.findId(member);
	}

	// 비밀번호 찾기
	public List<namdoro> findPw(namdoro member) {
		return mapper.findPw(member);

	}

	// 수정하기(업데이트)
	public int myPageInfo(namdoro member) {
		return mapper.update(member);
	}

	// 회원탈퇴(삭제)
	public int delete(String id) {
		return mapper.delete(id);
	}
}
