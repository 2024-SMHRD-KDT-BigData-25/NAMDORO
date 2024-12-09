package com.smhrd.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/")
	public String indexPage() {
		return "index";
	}
	
//	@GetMapping("/login")
//	public String loginPage() {
//		return "login";
//	}
	
	@GetMapping("/join")
	public String joinPage() {
		return "join";
	}
	
	//아이디 찾기 페이지
	@GetMapping("/findId")
	public String findIdPage () {
		return "findId";
	}
	
	//비밀번호 찾기 페이지
	@GetMapping("/findPw")
	public String findPwPage () {
		return "findPw";		
	}
	
	@GetMapping("/findinfo")
	public String findinfoPage () {
		return "findinfo";		
	}
	

}
