package com.smhrd.boot.controller;

import java.util.HashMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;


@RestController
public class HomeController {
	
	KakaoAPI kakaoapi = new KakaoAPI();
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam("code") String code, HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		// 1. 인증코드 요청 전달
		String accessToken = kakaoapi.getAccessToken(code);
		
		// 2. 인증코드로 토큰 전달
		HashMap<String, Object> userInfo = kakaoapi.getUserInfo(accessToken);
		String email = (String)userInfo.get("email");
		String nickname = (String)userInfo.get("nickname");
		
		
		System.out.println("login info " + userInfo.toString());
		System.out.println("nickname: " + nickname);
		System.out.println("email: " + email);
		
		if(userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("accessToken", accessToken);
		}		
		mav.addObject("userId", userInfo.get("email"));
			
		return mav;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		kakaoapi.kakaoLogout((String)session.getAttribute("accessToken"));
		session.removeAttribute("accessToken");
		session.removeAttribute("userId");
		mav.setViewName("index");
		return mav;
	}
	
	
	

}
