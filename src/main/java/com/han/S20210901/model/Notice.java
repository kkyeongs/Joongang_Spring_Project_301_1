package com.han.S20210901.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Notice {
	private int nnum;
	private Date ndate;
	private int ncount;
	private String ncontent;
	private String ntitle;
	private String nimg;
	
	// 페이징
	private int total;				private int rowPage   = 10;
	private int startPage;			private int pageBlock = 10;
	private int endPage;			private int start;
	private int currentPage = 1;	private int end;
}
