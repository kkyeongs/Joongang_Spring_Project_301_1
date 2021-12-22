package com.han.S20210901.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.han.S20210901.model.PunchHg;

@Repository
public class PunchDaoImplHg implements PunchDaoHg {
	
	@Autowired
	SqlSession session;
	
	@Override
	public int punchOn(HttpServletRequest request) {
		System.out.println("PunchDaoImplHg punchOn() starts...");
		String sessionId = (String)request.getSession().getAttribute("sessionId");
		int result = session.insert("hgPunchOn", sessionId);
		return result;
	}

	@Override
	public int punchOff(HttpServletRequest request) {
		System.out.println("PunchDaoImplHg punchOff() starts...");
		String sessionId = (String)request.getSession().getAttribute("sessionId");
		int result = session.insert("hgPunchOff", sessionId);
		return result;
	}

	@Override
	public int punchTotal(String search, int searchType) {
		System.out.println("PunchDaoImpl punchTotal() starts...");
		int result = 0;
		switch (searchType) {
		case 0:
			result = session.selectOne("HGpunchTotalFull");
			break;
		case 1:
			result = session.selectOne("HgpunchTotalEmpno",search);
			break;
		case 2:
			result = session.selectOne("HgpunchTotalDate",search);
		//	result = session.selectOne("HgpunchTotalEmpno",search);
			break;
		}
		
		
		return result;
	}

	

	@Override
	public List<PunchHg> punchList(PunchHg punch,  int searchType) {
		System.out.println("PunchDaoImpl punchList starts...");
		List<PunchHg> punchList = null;
		
		switch (searchType) {
		case 0:
			punchList = session.selectList("HGpunchListAll",punch); // case 0 은 전체 리스트 조회.
			break;
		case 1:
			punchList = session.selectList("HGpunchListByEmpno",punch); // case 1은 직원 번호 조회.
			break;
		case 2:
			punchList = session.selectList("HGpunchListByDate",punch); // case2 는 날짜 조회.
			break;
		}
		
		
			
		return punchList;
	}

}
