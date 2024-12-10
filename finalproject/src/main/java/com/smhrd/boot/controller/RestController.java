package com.smhrd.boot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.smhrd.boot.model.TourlistReview;
import com.smhrd.boot.service.TourlistService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	private final TourlistService service;
	
	@PostMapping("/tours/{tl_no}/submitReview")
	public ResponseEntity<Map<String, Object>> submitReview(@PathVariable("tl_no") int tlNo, @RequestBody TourlistReview review) {
		System.out.println("Review Data Received: " + review);
		System.out.println("관광지 번호 Received: " + tlNo);
		
		int res = service.submitReview(review);
		
        // 응답 데이터 생성
        Map<String, Object> response = new HashMap<>();
        if (res > 0) {
            response.put("success", true);
            response.put("message", "리뷰가 성공적으로 저장되었습니다.");
            response.put("tr_com", review.getTr_com());
            response.put("user_id", review.getUser_id()); 
            response.put("review", review); // 전체 리뷰 데이터도 함께 반환
        } else {
            response.put("success", false);
            response.put("message", "리뷰 저장에 실패했습니다.");
        }
        System.out.println(response);
        return ResponseEntity.ok(response);
	}
	
    @GetMapping("/tours/{tl_no}/reviews")
    public ResponseEntity<Map<String, Object>> getReviews(@PathVariable("tl_no") int tl_no) {
        List<TourlistReview> reviews = service.tourReviewList(tl_no);
        Map<String, Object> response = new HashMap<>();
        
        if(reviews != null && !reviews.isEmpty()) {
            response.put("success", true);
            response.put("reviews", reviews);
            System.out.println(reviews);
            return ResponseEntity.ok(response);
        } else {
            response.put("success", false);
            response.put("message", "리뷰가 없습니다.");
            return ResponseEntity.ok(response);
        }
    }
	
}
