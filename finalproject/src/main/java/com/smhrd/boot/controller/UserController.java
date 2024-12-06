package com.smhrd.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.smhrd.boot.model.namdoro;
import com.smhrd.boot.service.UserService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class UserController {
	
	private final UserService service;
	
	
	@GetMapping("/users/signup")
	public String signupForm() {
		return "signup";
	}
	
	
	@PostMapping("/users")
	public String signup(namdoro user) {
		int res = service.signup(user);
		
		if(res==0) {
			return "redirect:/users/signup";
		}else {
			return "redirect:/";
		}
		
	}
	
	@GetMapping("/users")
	public String login() {
		return "login";
	}
	
	

	

}
