package com.han.S20210901.service;

import com.han.S20210901.model.Emp;
import com.han.S20210901.model.Member;

public interface EmpService {
	Emp selectEmp(String id);

	int newEmp(Member member, String parameter);

	Emp selectEmpno(int empno);
}
