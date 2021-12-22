package com.han.S20210901.service;

import java.util.List;

import com.han.S20210901.model.EmpManagement;

public interface EmpManagementService {

		int EmpManagementTotal();
		
		List<EmpManagement> EmpManagementAll(EmpManagement empManagement);
}
