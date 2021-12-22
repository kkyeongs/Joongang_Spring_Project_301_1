package com.han.S20210901.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.PunchDaoHg;
import com.han.S20210901.model.PunchHg;


@Service
public class PunchServiceImplHg implements PunchServiceHg {
	
	@Autowired
	private PunchDaoHg punchDaoHg;
	

	@Override
	public int punchOn(HttpServletRequest request) {
		System.out.println("PunchServiceImplHg punchOn() Starts...");
		int result = punchDaoHg.punchOn(request);
		return result;
	}


	@Override
	public int punchOff(HttpServletRequest request) {
		System.out.println("PunchServiceImplHg punchOff() Starts...");
		int result = punchDaoHg.punchOff(request);
		
		return result;
	}


	@Override
	public int punchTotal(String search, int searchType) {
		System.out.println("PunchServiceImpl punchTotal starts...");
		
		
		int totalPunch= punchDaoHg.punchTotal(search, searchType);
		
		
		
		return totalPunch;
	}



	@Override
	public List<PunchHg> punchList(PunchHg punch,  int searchType) {
		System.out.println("PunchServiceImpl punchListAll starts...");
		
		List<PunchHg> punchList = punchDaoHg.punchList(punch, searchType);
		
		return punchList;
	}

}
