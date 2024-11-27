package com.smhrd.boot.model;

import java.util.Date;

import lombok.Data;


@Data
public class namdoro {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_nickname;
	private String user_phone;
	private Date created_at;
	private Date updated_at;

}
