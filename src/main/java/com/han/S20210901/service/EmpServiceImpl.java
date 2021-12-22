package com.han.S20210901.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.EmpDao;
import com.han.S20210901.model.Emp;
import com.han.S20210901.model.Member;
@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	EmpDao empDao;
	
	@Override
	public Emp selectEmp(String id) {
		Emp emp = empDao.selectEmp(id);
		return emp;
	}

	@Override
	public int newEmp(Member member, String dept) {
		int result = empDao.insertEmp(member,dept);
		return result;
	}

	@Override
	public Emp selectEmpno(int empno) {
		return empDao.selectEmpno(empno);
	}

}
