package com.smhrd.boot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.smhrd.boot.model.Tour;
import com.smhrd.boot.service.TourlistService;

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
	
	
}
