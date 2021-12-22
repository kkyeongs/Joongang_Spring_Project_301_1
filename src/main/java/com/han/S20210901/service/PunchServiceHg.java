package com.han.S20210901.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.han.S20210901.model.PunchHg;

public interface PunchServiceHg {

	int punchOn(HttpServletRequest request);
	
	int punchOff(HttpServletRequest request);

	int punchTotal(String search, int searchType);

	List<PunchHg> punchList(PunchHg punch, int searchType);

}
