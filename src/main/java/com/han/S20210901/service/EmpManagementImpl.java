package com.han.S20210901.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.EmpManagementDao;
import com.han.S20210901.model.EmpManagement;

@Service
public class EmpManagementImpl implements EmpManagementService {

	@Autowired
	private EmpManagementDao empManagementDao;
	
	@Override
	public int EmpManagementTotal() {
		System.out.println("EmpManagementServiceImpl EmpManagementTotal() Start...");
		int totalCnt = empManagementDao.empManagementTotal();
		return totalCnt;
	}

	@Override
	public List<EmpManagement> EmpManagementAll(EmpManagement empManagement) {
		System.out.println("EmpManagemanetServiceImpl EmpManagementAll() Start...");
		List<EmpManagement> empManagementList = empManagementDao.EmpManagementALL(empManagement);
		return empManagementList;
	}

}
