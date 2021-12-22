package com.han.S20210901.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.MemberManagementDao;
import com.han.S20210901.model.MemberManagement;

@Service
public class MemberManagementImpl implements MemberManagementService {

	@Autowired
	private MemberManagementDao memberManagementDao;
	
	@Override
	public int MemberManagementTotal(MemberManagement memberManagement) {
		System.out.println("MemberManagementServiceImpl MemberManagementTotal() Strat...");
		System.out.println("memberManagement searchOption->"+memberManagement.getSearchOption());
		System.out.println("memberManagement search->"+memberManagement.getSearch());
		int totalCnt = memberManagementDao.memberManagementTotal(memberManagement);
		return totalCnt;
	}

	@Override
	public List<MemberManagement> MemberManagementAll(MemberManagement memberManagement, int searchType) {
		System.out.println("MemberManagementServiceImpl MemberManagementAll() Start...");
		List<MemberManagement> memberManagementList = memberManagementDao.MemberManagementALL(memberManagement, searchType);
		return memberManagementList;
	}

	@Override
	public int memberManagementDelete(String id) {
		System.out.println("MemberManagementServiceImpl memberManagementDelete() Start...");
		int result = memberManagementDao.memberManagementDelete(id);
		return result;
	}
}
