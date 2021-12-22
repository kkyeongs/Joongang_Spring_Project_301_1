package com.han.S20210901.dao;

import com.han.S20210901.model.Emp;
import com.han.S20210901.model.Member;

public interface EmpDao {
	Emp selectEmp(String id);

	int insertEmp(Member member, String dept);

	Emp selectEmpno(int empno);
}
