package com.smhrd.boot.controller;

import java.lang.ProcessHandle.Info;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

                                      
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.smhrd.boot.mapper.UserMapper;
import com.smhrd.boot.model.namdoro;
import com.smhrd.boot.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpServerErrorException;
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
   public String signup(namdoro user, HttpSession session, RedirectAttributes redirectAttributes) {
	   
    try{
    	int res = service.signup(user);
    	
      if(res==0) {
         return "redirect:/users/signup";
      }else {
         return "redirect:/";
      }   
    } catch (DuplicateKeyException e) {
    	redirectAttributes.addFlashAttribute("userMessage", e.getMessage());
    	session.setAttribute("user", user);
        return "redirect:/join";  
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
   public String findId(namdoro member, Model model, RedirectAttributes redirectAttributes) {
      
      List<namdoro> res = service.findId(member);
      System.out.println(res);
       // 결과 처리
       if (res != null && !res.isEmpty()) {
           model.addAttribute("res_id", res);
          return "findinfo";
       } else {
           redirectAttributes.addFlashAttribute("findIdFailMessage", "아이디와 핸드폰번호가 맞지 않습니다.");
           return "redirect:/findId";
       }
      
   }
   
   //비밀번호 찾기
   @PostMapping("/user_pw")
   public String findpw(namdoro member, Model model, RedirectAttributes redirectAttributes) {
      
      List<namdoro> res = service.findPw(member);
      
      if (res != null && !res.isEmpty()) {
         model.addAttribute("res_pw", res);
           return "findinfoPw";
       } else {
          redirectAttributes.addFlashAttribute("findPwFailMessage", "아이디와 이름 핸드폰번호가 맞지 않습니다.");
          return "redirect:/findPw";
       }
      
   }
   
   //유저회원정보가져오기 
   @GetMapping("/myPageInfo")
   public String myPageInfo(HttpSession session){// 값 넘어오는지 확인 ->void 임시로 하기
      
      namdoro so = (namdoro)session.getAttribute("member");
      
      return "myPageInfo";
      
   }
   
   //회원정보 수정
   @GetMapping("/myPageInfo/update")
   public String myPageInfo2(namdoro member, HttpSession session, RedirectAttributes redirectAttributes){
         
      try {//회원수정 업데이트 시도
          int result = service.myPageInfo(member);
          session.setAttribute("member", member);
          return "redirect:/mypage";
          
      	} catch (DuplicateKeyException e) {//중복값있을시   
            session.setAttribute("member", member);
            redirectAttributes.addFlashAttribute("nicknameMessage", e.getMessage());
            return "redirect:/myPageInfo";
            
      	} catch (Exception e) { // 기타 오류가 발생한 경우
      		redirectAttributes.addFlashAttribute("nicknameMessage", "회원정보 수정에 실패했습니다.");
      		return "redirect:/myPageInfo";
      }
    }

	// {} : 경로변수
      @GetMapping("users/{user_id}/edit")
      public String updateForm() {
         return "update";
         
      }

      @GetMapping("/users/{id}/delete")
      public String delete(@PathVariable String id, HttpSession session) {  // PathVariable : 경로변수에 포함된 id값 가져옴
         
         System.out.println(id);
         int res = service.delete(id);
         
         if (res > 0) {
            session.removeAttribute("member");
         }
         return "redirect:/";
      }
      
      @PostMapping("/plan/call_python_api")
      public String sendToFlask(@RequestParam String gender, @RequestParam String user_id, 
                                HttpSession session, @RequestParam String age, 
                                @RequestParam String day, @RequestParam String theme, 
                                @RequestParam String region, Model model, RedirectAttributes redirectAttributes) {
          String flaskUrl = "http://127.0.0.1:4000/home";  // Flask 서버의 URL

          try {
              // Flask URL에 파라미터 추가
              String urlWithParams = UriComponentsBuilder.fromHttpUrl(flaskUrl)
                      .queryParam("gender", gender)
                      .queryParam("age", age)
                      .queryParam("day", day)
                      .queryParam("theme", theme)
                      .queryParam("region", region)
                      .queryParam("user_id", user_id)
                      .toUriString();

              RestTemplate restTemplate = new RestTemplate();
              ResponseEntity<String> response = restTemplate.getForEntity(urlWithParams, String.class);

              // JSON 파싱 (필요 시)
              String jsonStr = response.getBody();
              Gson gson = new Gson();
              Map<String, Object> map = gson.fromJson(jsonStr, Map.class);

              // 성공 데이터 처리
              session.setAttribute("mapData", map);
              model.addAttribute("successMessage", "Data fetched successfully!");

              // 성공 시 특정 페이지로 이동
              return "result";
          } catch (HttpServerErrorException e) {
              // 서버 오류 발생
        	  redirectAttributes.addFlashAttribute("planFailMessage", "해당 테마와 관련된 관광지가 없습니다.");
              return "redirect:/plan";
          } catch (Exception e) {
              // 기타 예외 처리
        	  redirectAttributes.addFlashAttribute("planFailMessage", "해당 테마와 관련된 관광지가 없습니다.");
              return "redirect:/plan";
          }
      }

   

}
