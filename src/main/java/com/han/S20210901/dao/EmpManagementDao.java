package com.han.S20210901.dao;

import java.util.List;

import com.han.S20210901.model.EmpManagement;

public interface EmpManagementDao {

	int empManagementTotal();
	List<EmpManagement> EmpManagementALL(EmpManagement empManagement);
}
