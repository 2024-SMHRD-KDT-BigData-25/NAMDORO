package com.smhrd.boot.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
//@ToString
public class board {
	
	private int TB_NO;
	private String TB_TITLE;
	private String USER_ID;
	private String TB_IMG;
	private String TB_CONTENT;
	private Date CREATED_AT;
	private Date UPDATED_AT;
	private int TB_VIEWS;
	private String USER_NICKNAME;
	
}
