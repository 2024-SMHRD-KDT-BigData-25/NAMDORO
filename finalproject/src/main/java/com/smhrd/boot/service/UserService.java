package com.smhrd.boot.service;

import java.util.List;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.boot.mapper.UserMapper;
import com.smhrd.boot.model.Tour;
import com.smhrd.boot.model.namdoro;
import com.smhrd.boot.model.plan;
import com.smhrd.boot.model.region;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {

	
	private final UserMapper mapper;
	
	public int signup(namdoro user) throws DuplicateKeyException {
		try {
		return mapper.signup(user);
	}catch (DuplicateKeyException e) {// DB에 id랑 닉네임중복 오류시 예외 처리
		throw new DuplicateKeyException("아이디 또는 닉네임이 중복됩니다 다시 작성하세요");
		}
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
	public int myPageInfo(namdoro member) throws DuplicateKeyException {
		try {
		return mapper.update(member);
	} catch (DuplicateKeyException e) { 
		throw new DuplicateKeyException("닉네임이 중복됩니다. 기존 닉네임으로 복원됩니다.");
		}
	}
	
	// 회원탈퇴(삭제)
	public int delete(String id) {
		return mapper.delete(id);
		}
	
	public List<plan> getPlan(){
		return mapper.getPlan();
	}

	public List<Tour> getTourist() {
		return mapper.getTourist();
		
	}

	public plan getPlanDetail(int CP_NO) {
		return mapper.getPlanDetail(CP_NO);
		
	}

	public List<region> getRegionList() {
		return mapper.getRegionList();
		
	}

	public region getRegionDetail(String name) {
		return mapper.getRegionDetail(name);
		
	}
}
