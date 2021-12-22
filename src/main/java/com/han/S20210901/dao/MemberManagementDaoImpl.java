package com.han.S20210901.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.han.S20210901.model.MemberManagement;

@Repository
public class MemberManagementDaoImpl implements MemberManagementDao {
	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public int memberManagementTotal(MemberManagement memberManagement) {
		System.out.println("MemberManagementDaoImpl memberManagementTotal() Start...");
		int totalCnt =0 ;
		switch (memberManagement.getSearchType()) {
		case 0:
			totalCnt = session.selectOne("HjMemberManagementCnt");
			break;
		case 1:
			System.out.println("memberManagement searchOption->"+memberManagement.getSearchOption());
			System.out.println("memberManagement search->"+memberManagement.getSearch());
			totalCnt = session.selectOne("HGmemberManagementCntById",memberManagement.getSearch());
			break;
			
		case 2:
			totalCnt = session.selectOne("HGmemberManagementCntByEmail",memberManagement.getSearch());
			break;
		case 3:
			totalCnt = session.selectOne("HGmemberManagementCntByName",memberManagement.getSearch());
			break;
		case 4:
			totalCnt = session.selectOne("HGmemberManagementCntByPhone",memberManagement.getSearch());
			break;
		default:
			break;
		}
		
		return totalCnt;
	}

	@Override
	public List<MemberManagement> MemberManagementALL(MemberManagement memberManagement, int searchType) {
		System.out.println("MemberManagementDaoImpl MemberManagementALL() Start...");
		List<MemberManagement> memberManagementList = null;
		
		switch (searchType) {
		case 0:
			memberManagementList = session.selectList("HjMemberManagementList", memberManagement);
			break;
		case 1:
			System.out.println("memberManagement searchOption"+memberManagement.getSearchOption());
			System.out.println("memberManagement search"+memberManagement.getSearch());
			memberManagementList = session.selectList("HGmemberManagementListById", memberManagement);
			
			break;
		case 2:
			memberManagementList = session.selectList("HGmemberManagementListByEmail", memberManagement);
			break;
		case 3:
			memberManagementList = session.selectList("HGmemberManagementListByName", memberManagement);
			break;
		case 4:
			memberManagementList = session.selectList("HGmemberManagementListByPhone", memberManagement);
			break;
		default:
			break;
		}
		
		return memberManagementList;
	}

	@Override
	public int memberManagementDelete(String id) {
		System.out.println("MemberManagementDaoImpl memberManagementDelete() Start...");
		int result = session.delete("MemberManagementDelete", id);
		return result;
	}

}
