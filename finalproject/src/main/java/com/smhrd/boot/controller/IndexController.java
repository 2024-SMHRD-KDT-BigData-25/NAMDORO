package com.smhrd.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping("/")
	public String loginPage() {
		return "login";
	}
	
	@GetMapping("/join")
	public String joinPage() {
		return "join";
	}

}
