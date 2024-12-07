package com.smhrd.boot.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.boot.model.namdoro;

@Mapper
public interface UserMapper {
	
	@Insert("insert into USER_INFO(USER_ID, USER_PW, USER_NICKNAME, USER_NAME, USER_PHONE) values (#{user_id}, #{user_pw}, #{user_nickname}, #{user_name}, #{user_phone})")
	public int signup(namdoro user);
	
	@Select("select * from USER_INFO where USER_ID=#{user_id} and USER_PW=#{user_pw}")
	public namdoro login(namdoro member);

}
