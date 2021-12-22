package com.han.S20210901.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
//차후 회원아이디로 예약 및 문의 접수 링크 연결
@Getter
@Setter
public class MemberManagement {
	private String id;
	private String email;
	private String name;
	private String addr;
	private String phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd" )
	private Date regdate;
	private int state;
	
	//조회용
	private String pageNum;  
	private int start; 		 
	private int end;
	
	//search 조회용 -- 추가 by 한글 2021.12.14.
	private String search;
	private int searchType;
	private String searchOption;
}
