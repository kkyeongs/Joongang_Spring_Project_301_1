package com.han.S20210901.dao;

import java.util.List;

import org.springframework.ui.Model;
import com.han.S20210901.model.MemberManagement;

public interface MemberManagementDao {
	
	int memberManagementTotal(MemberManagement memberManagement);
	
	List<MemberManagement> MemberManagementALL(MemberManagement memberManagement, int searchType);

	int memberManagementDelete(String id);


	
}
