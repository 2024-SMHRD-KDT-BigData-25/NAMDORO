package com.smhrd.boot.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class TourlistReview {

	private int tr_no;
	private int tl_no;
	private String user_id;
	private String tr_com;
	private String created_at;
	private String updated_at;
	private String user_nickname;
	
}
