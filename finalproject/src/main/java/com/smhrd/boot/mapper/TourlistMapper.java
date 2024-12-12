package com.smhrd.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.smhrd.boot.model.Tour;
import com.smhrd.boot.model.TourlistReview;

@Mapper
public interface TourlistMapper {
	
	@Select("select * from TOURIST_INFO")
	public List<Tour> GetTourlist();
	
	@Select("select * from TOURIST_INFO where TL_NO=#{TL_NO}")
	public Tour getTourDetail(int TL_NO);
	
	@Insert("insert into TOURIST_REVIEWS (tl_no, user_id, tr_com) values (#{tl_no}, #{user_id}, #{tr_com})")
	public int submitReview(TourlistReview review);
	
	@Select("SELECT TR.*, UI.USER_NICKNAME FROM TOURIST_REVIEWS TR JOIN USER_INFO UI ON TR.USER_ID = UI.USER_ID WHERE  TR.TL_NO = #{TL_NO};")
	public List<TourlistReview> tourReviewList(int TL_NO);
	
	@Select("SELECT * FROM TOURIST_INFO WHERE TL_NAME LIKE CONCAT('%', #{query}, '%')")
	public List<Tour> findToursByQuery(@Param("query") String query);
}
