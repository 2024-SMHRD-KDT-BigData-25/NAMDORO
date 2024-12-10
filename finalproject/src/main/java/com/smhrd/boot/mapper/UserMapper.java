package com.smhrd.boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.boot.model.namdoro;

@Mapper
public interface UserMapper {
	
	@Insert("insert into USER_INFO(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_PHONE) values (#{user_id}, #{user_pw}, #{user_nickname}, #{user_name}, #{user_phone})")
	public int signup(namdoro user);
	
	@Select("select * from USER_INFO where USER_ID=#{user_id} and USER_PW=#{user_pw}")
	public namdoro login(namdoro member);
	
	//아이디 찾기
	@Select("select * from USER_INFO where USER_NAME=#{user_name} and USER_PHONE=#{user_phone}")
	public List<namdoro> findId(namdoro member);
	
	//비밀번호 찾기
	@Select("select * from USER_INFO where USER_ID=#{user_id} and USER_NAME=#{user_name} and USER_PHONE=#{user_phone}")
	public List<namdoro> findPw(namdoro member);
	
	@Update("UPDATE USER_INFO SET USER_PW=#{user_pw}, USER_PHONE=#{user_phone} where USER_id=#{user_id}")
	public int update(namdoro member);

	@Delete("delete from USER_INFO where USER_ID=#{id}")
	public int delete(String id);

}
