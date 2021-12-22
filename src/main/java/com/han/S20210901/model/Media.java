package com.han.S20210901.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Media {
	private int mnum;
	private int mcount;
	private String mtitle;
	private String link;
	private Date mdate;
	private String msumnail;
	
	// 페이징
	private int total;				private int rowPage   = 10;
	private int startPage;			private int pageBlock = 10;
	private int endPage;			private int start;
	private int currentPage = 1;	private int end;
}
