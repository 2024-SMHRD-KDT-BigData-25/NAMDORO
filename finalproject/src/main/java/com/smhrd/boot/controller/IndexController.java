package com.smhrd.boot.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.smhrd.boot.service.UserService;
import com.smhrd.boot.model.Tour;
import com.smhrd.boot.model.plan;
import com.smhrd.boot.model.region;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class IndexController {
	
	private final UserService service;
	
	
	
	@GetMapping("/")
	public String indexPage(Model model) {
		List<region> regionList = service.getRegionList();
		model.addAttribute("region", regionList);
		return "index";
	}
	
	
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
	
	@GetMapping("/mypage")
	public String myPage(Model model) {
		List<plan> list = service.getPlan();
		model.addAttribute("list", list);
		List<Tour> tourlist = service.getTourist();
		model.addAttribute("tourlist", tourlist);
		return "myPage";
	}
	
	@GetMapping("/plan")
	public String plan() {
		return "plan";
	}
	
	
	@GetMapping("/mypage/{CP_NO}")
	public String detailForm(@PathVariable int CP_NO, Model model) {
		
		plan res = service.getPlanDetail(CP_NO);
		// Board res = service.getBoardDetail(id);
		 model.addAttribute("res", res);
		 List<Tour> tourlist = service.getTourist();
		model.addAttribute("tourlist", tourlist);
		return "myPageCourse";
	}
	
	@GetMapping("/region/{name}")
	public String region(@PathVariable String name, Model model) {
		region res = service.getRegionDetail(name);
		model.addAttribute("regionDetail", res);
		return "regionInfo";
	}
	
	
}
