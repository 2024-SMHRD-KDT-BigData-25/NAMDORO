package com.smhrd.boot.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.smhrd.boot.model.Tour;
import com.smhrd.boot.service.TourlistService;
import com.smhrd.boot.service.UserService;

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
	
	
}
