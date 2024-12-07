package com.smhrd.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.boot.model.Tour;

@Mapper
public interface TourlistMapper {
	
	@Select("select * from TOURIST_INFO")
	public List<Tour> GetTourlist();
	
	@Select("select * from TOURIST_INFO where TL_NAME like '%#{tour_nm}%'")
	public List<Tour> searchTour(String tour_nm);

}
