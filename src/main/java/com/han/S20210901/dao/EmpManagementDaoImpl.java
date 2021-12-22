package com.han.S20210901.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.han.S20210901.model.EmpManagement;

@Repository
public class EmpManagementDaoImpl implements EmpManagementDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int empManagementTotal() {
		System.out.println("EmpManagementDaoImpl empManagementTotal() Start...");
		int totalCnt = session.selectOne("HjEmpManagementCnt");
		return totalCnt;
	}

	@Override
	public List<EmpManagement> EmpManagementALL(EmpManagement empManagement) {
		System.out.println("EmpManagementDaoImpl EmpManagementALL() Start...");
		List<EmpManagement> empManagenetList = session.selectList("HjEmpManagementList", empManagement);
		
		return empManagenetList;
	}

}
