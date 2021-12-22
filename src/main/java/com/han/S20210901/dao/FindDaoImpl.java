package com.han.S20210901.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.han.S20210901.model.Member;

@Repository
public class FindDaoImpl implements FindDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public String findId(Member member) {
		String fid = session.selectOne("findIdSh", member);
		return fid;
	}

	@Override
	public String findPw(Member member) {
		String fpw = session.selectOne("findPwSh", member);
		return fpw;
	}

	@Override
	public int findPwResult(Member member) {
		// 
		System.out.println("fdDaoImpl findPwResult start");
		int result = 0;
		result = session.update("findPwResultSh", member);
		return result;
	}

}
