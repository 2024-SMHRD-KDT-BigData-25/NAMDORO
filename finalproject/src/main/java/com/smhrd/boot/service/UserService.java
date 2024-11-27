package com.smhrd.boot.service;

import org.springframework.stereotype.Service;

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

	
}
