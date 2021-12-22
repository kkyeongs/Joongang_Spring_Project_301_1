package com.han.S20210901.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmpManagement {
	
	//Member table
	private String id;
	private String email;
	private String name;
	private String addr;
	private String phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd" )
	private Date regdate;
	private int state;
	
	//Emp table
	private int empno;
	private String dept;
	
	//조회용
	private String pageNum;  
	private int start; 		 
	private int end;
}
