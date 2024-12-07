package com.smhrd.boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.smhrd.boot.mapper.TourlistMapper;
import com.smhrd.boot.model.Tour;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TourlistService {
	
	private final TourlistMapper mapper;
	
	public List<Tour> GetTourlist() {
		return mapper.GetTourlist();
	}

	public List<Tour> searchTour(String tour_nm) {
		return mapper.searchTour(tour_nm);
	}
}
