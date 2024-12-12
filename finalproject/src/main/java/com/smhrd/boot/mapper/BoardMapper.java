package com.smhrd.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.boot.model.board;
import com.smhrd.boot.model.namdoro;

@Mapper
public interface BoardMapper {
	
	//게시판 추가
	@Insert("insert into TOUR_BOARD (TB_TITLE, USER_ID, TB_IMG, TB_CONTENT) values (#{TB_TITLE}, #{USER_ID}, #{TB_IMG}, #{TB_CONTENT})")
	public int insertPost(board post);
	
	//게시판 목록
	@Select("SELECT TB.*, UI.USER_NICKNAME FROM TOUR_BOARD TB join USER_INFO UI ON TB.USER_ID = UI.USER_ID;")
	public List<board> getList();
	
	//뷰
	@Select("SELECT TB.*, UI.USER_NICKNAME FROM TOUR_BOARD TB join USER_INFO UI ON TB.USER_ID = UI.USER_ID where TB_NO=#{TB_NO}")
	public board view(int TB_NO);
	

}
