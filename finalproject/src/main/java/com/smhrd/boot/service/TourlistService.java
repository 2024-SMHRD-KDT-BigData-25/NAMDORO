package com.smhrd.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.smhrd.boot.mapper.TourlistMapper;
import com.smhrd.boot.model.Tour;
import com.smhrd.boot.model.TourlistReview;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TourlistService {
	
	private final TourlistMapper mapper;
	
	public List<Tour> GetTourlist() {
		return mapper.GetTourlist();
	}
	
	public Tour getTourDetail(int TL_NO) {
		return mapper.getTourDetail(TL_NO);
	}
	
	public int submitReview(TourlistReview review) {
		return mapper.submitReview(review);
	}
	
	public List<TourlistReview> tourReviewList(int TL_NO) {
		return mapper.tourReviewList(TL_NO);
	}
	
	//메인에서 검색하기
	public List<Tour> getTourList(String query) {
        if (query == null || query.isEmpty()) {
            return mapper.GetTourlist(); // 전체 투어 목록을 반환
        } else {
            return mapper.findToursByQuery(query); // 검색어에 맞는 투어 목록을 반환
        }
    }

}
