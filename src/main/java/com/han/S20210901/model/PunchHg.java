package com.han.S20210901.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PunchHg {
	private int empno;
	private Date pundate;
	private String starttime;
	private String endtime;
	
	//조회용
	private String ename;
	private String dept;
	private int start;
	private int end;
	private int pageNum;
	private String search;
	private String searchType;
}
