package com.smhrd.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.boot.model.board;
import com.smhrd.boot.model.namdoro;

@Mapper
public interface BoardMapper {
	
	//게시판 추가
	@Insert("insert into TOUR_BOARD (TB_TITLE, USER_ID, TB_IMG, TB_CONTENT) values (#{TB_TITLE}, #{USER_ID}, #{TB_IMG}, #{TB_CONTENT})")
	public int insertPost(board post);
	
	//게시판 목록
	@Select("SELECT TB.*, UI.USER_NICKNAME FROM TOUR_BOARD TB JOIN USER_INFO UI ON TB.USER_ID = UI.USER_ID ORDER BY TB.CREATED_AT DESC;")
	public List<board> getList();
	
	//뷰
	@Select("SELECT TB.*, UI.USER_NICKNAME FROM TOUR_BOARD TB join USER_INFO UI ON TB.USER_ID = UI.USER_ID where TB_NO=#{TB_NO}")
	public board view(int TB_NO);
	
	//게시판 삭제
	@Delete("delete from TOUR_BOARD where TB_NO = #{TB_NO}")
	public int delete(int TB_NO);
	
	// 게시글 수정
	@Update("UPDATE TOUR_BOARD SET TB_TITLE = #{TB_TITLE}, TB_CONTENT = #{TB_CONTENT} WHERE TB_NO = #{TB_NO}")
	public int updatePost(board post);
	

}
