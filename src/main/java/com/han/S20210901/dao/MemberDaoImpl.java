package com.han.S20210901.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.han.S20210901.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int memberJoin(Member member) {
		int result = 0;
		System.out.println("MemberDaoImpl memberJoin() start... ");
		try {
			 result= session.insert("ghMemberJoin", member);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl memberJoin() Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public int memberIdChk(Member member) {
		int result = 0; 
		
		System.out.println("MemberDaoImpl memberIdChk() start... ");
		try {
			result = session.selectOne("ghMemberIdChk", member);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl memberIdChk()) Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public Member memberUpdateForm(String id) {
		Member member = null;
		System.out.println("MemberDaoImpl memberUpdateForm() start... ");
		try {
			member = session.selectOne("ghMemberUpdate", id); // 여기서 resulttype-member과 parametertype-member 확인
			System.out.println("dao id-> " + member.getId());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl memberUpdateForm()) Exception->"+e.getMessage());
		}
		return member;
	}

	@Override
	public int memberUpdatePro(Member member) {
		int result = 0;
		System.out.println("MemberDaoImpl memberUpdatePro() start... ");
		try {
			result = session.update("ghMemberUpdatePro", member);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl memberUpdatePro() Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public int memberDelete(String id) {
		int result = 0;
		System.out.println("MemberDaoImpl memberDelete() start... ");
		try {
			result = session.update("ghMemberDelete", id);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl memberDelete() Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public Member memberSelect(String id) {
		return session.selectOne("HGmemberSelect",id);
	}

}
