package com.smhrd.boot.controller;

import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.smhrd.boot.model.namdoro;
import com.smhrd.boot.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;



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
	
	//아이디 찾기
	@PostMapping("/user_id")
	public String findId(namdoro member, Model model) {
		
		List<namdoro> res = service.findId(member);

	    // 결과 처리
	    if (res != null) {
	        model.addAttribute("res_id", res);
	        return "findinfo";
	    } else {
	        model.addAttribute("res_id", "사용자를 찾을 수 없습니다.");
	        return "findId";
	    }
//	    return "findinfo";
		
	}
	
	//비밀번호 찾기
	@PostMapping("/user_pw")
	public String findpw(namdoro member, Model model) {
		
		List<namdoro> res = service.findPw(member);
		
		if (res != null) {
	        model.addAttribute("res_pw", res);
	        return "findinfoPw";
	    } else {
	        model.addAttribute("res_pw", "사용자를 찾을 수 없습니다.");
	        return "froinPw";
	    }
		
	}
	
	
	@PostMapping("/plan/call_python_api")
	public String sendToFlask(@RequestParam String gender,HttpSession session, @RequestParam String age, @RequestParam String day, @RequestParam String theme, @RequestParam String region) {
	    String flaskUrl = "http://127.0.0.1:4000/home";  // Flask 서버의 URL

		System.out.println("gender: " + gender);
		System.out.println("age: " + age);
		System.out.println("day: " + day);
		System.out.println("theme: " + theme);
		System.out.println("region: " + region);
	    // UriComponentsBuilder를 사용하여 파라미터를 안전하게 쿼리 스트링으로 추가
	    String urlWithParams = UriComponentsBuilder.fromHttpUrl(flaskUrl)
	        .queryParam("gender", gender)
	        .queryParam("age", age)
		    .queryParam("day", day)
	        .queryParam("theme", theme)
	        .queryParam("region", region)
	        .toUriString();

//	    // RestTemplate 객체 생성
	    RestTemplate restTemplate = new RestTemplate();
//
//	    // Flask 서버에 GET 요청을 보내고, 응답을 String으로 받음
	    ResponseEntity<String> response = restTemplate.getForEntity(urlWithParams, String.class);
        //System.out.println(response.getBody());
        
	    // Json 문자열        
	    String jsonStr = response.getBody();
	    // Gson 객체 생성       
	    Gson gson = new Gson();
	    // Json 문자열 -> Map 
	    Map<String, Object> map = gson.fromJson(jsonStr, Map.class);
	  //  System.out.println(map);
	    session.setAttribute("mapData", map);
	    // 응답 내용 반환
	   // return response.getBody();
	    return "result6";
//		return "redirect:/";
	}
	

	

}
