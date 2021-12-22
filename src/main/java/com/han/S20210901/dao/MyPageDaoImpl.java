package com.han.S20210901.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.han.S20210901.model.Member;

@Repository
public class MyPageDaoImpl implements MyPageDao {

	@Autowired
	private SqlSession session;

	@Override
	public Member myInfo(String sessionId, Member member) {
		System.out.println("MyPageDaoImpl myInfo start...");
		try {
			member = session.selectOne("ghMemberMyInfo", sessionId);
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl myInfo Exception->"+e.getMessage());
		}
		
		
		return member;
	}
	
	
}
