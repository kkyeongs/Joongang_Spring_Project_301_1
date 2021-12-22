package com.han.S20210901.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Reservation {
	// db용
	private int resnum;
	private int empno;
	private String id;
	private Date resdate;
	private String restime;
	private String rescontent;
	
	// 조회용
	private String name;
	private String empname;
	private String year;
	private String month;
	private String date;
	private String firstYMD;
	private String secondYMD;
	}
