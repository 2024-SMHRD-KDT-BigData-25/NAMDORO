package com.smhrd.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.boot.model.namdoro;
import com.smhrd.boot.service.UserService;

import jakarta.servlet.http.HttpSession;
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
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(namdoro member, HttpSession session, RedirectAttributes redirectAttributes) {
	    namdoro res = service.login(member);

	    if (res == null) {
	        // 로그인 실패 시 메시지를 flash 속성에 담아서 전달
	        redirectAttributes.addFlashAttribute("loginFailMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
	        return "redirect:/login";
	    } else {
	        // 로그인 성공 시 세션에 사용자 정보 저장
	        session.setAttribute("member", res);
	        return "redirect:/";
	    }
	}



	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/";
	}
	
	
	
	
	

	

}
