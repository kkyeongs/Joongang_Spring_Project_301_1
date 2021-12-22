package com.han.S20210901.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Oconsult {
	private int			onum;	private String		otitle;
	private int			opw;	private String		owriter;
	private Date		odate;	private int			ocount;
	private int 		ostep;	private int			oindent;
	private int			ogroup;	private String 		ocontent;
	
	//조회용
	private String search;		private String keyword;
	private String pageNum;
	private int start;			private int end;
	private int rn;
	private int rn2;
	
	
}

