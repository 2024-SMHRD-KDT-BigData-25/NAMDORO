package com.smhrd.boot.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.swing.text.html.HTML;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.boot.model.Tour;
import com.smhrd.boot.service.TourlistService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class TourlistController {
	
	private final TourlistService service;

	@GetMapping("/tours")
	public String GetTourlist(Model model) {
		List<Tour> tourlist = service.GetTourlist();
		
		model.addAttribute("tourlist", tourlist);
		
		return "tourList";
		
	}
	
	@GetMapping("/tours/{TL_NO}")
	public String detailForm(@PathVariable int TL_NO, Model model) {
		Tour res = service.getTourDetail(TL_NO);
		
		model.addAttribute("tourDetail", res);
		
		return "tourInfo";
	}

	
	@GetMapping("/plan/popup/{TL_NO}")
	public String popup(@PathVariable int TL_NO, Model model) {
		Tour res = service.getTourDetail(TL_NO);
		
		model.addAttribute("tourDetail", res);
		
		return "popup";
	}
	
	//검색하기
	@PostMapping("/TL_search")
    public String search(Model model, @RequestParam(value = "query", required = false) String query, HttpSession session) {
        List<Tour> tourlist = service.getTourList(query); // 검색어를 넘겨서 투어 목록을 가져옵니다.
        if (query != null && !query.trim().isEmpty()) {
            // 검색어가 있을 경우
            List<Tour> filteredTours = tourlist.stream()
                .filter(tour -> tour.getTL_NAME().toLowerCase().contains(query.toLowerCase()))
                .collect(Collectors.toList());
            model.addAttribute("tourlist", filteredTours); // 필터링된 목록을 전달
            session.setAttribute("query", query); // 검색어를 세션에 저장
        } else {
            // 검색어가 없을 경우 전체 목록을 그대로 전달
            model.addAttribute("tourlist", tourlist);
        }

        return "tourList"; // 결과를 `tourList.jsp`로 전달
    }
}
	
