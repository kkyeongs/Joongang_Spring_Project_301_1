package com.han.S20210901.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.MemberDao;
import com.han.S20210901.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao md;
	
	@Override
	public int memberJoin(Member member) {
		
		System.out.println("MemberServiceImpl memberJoin() start... ");
		String text1 = member.getText1();
		String text2 = member.getText2();
		String text3 = member.getText3();
		String text4 = member.getText4();
		String addr = text1+""+text2+""+text3+""+text4;
		System.out.println("MemberServiceImpl memberJoin() addr -> " + addr);
		member.setAddr(addr);
		int result = md.memberJoin(member);
		System.out.println("MemberServiceImpl memberJoin() result->" +result);
		
		return result;
	}

	@Override
	public int memberIdChk(Member member) {
		System.out.println("MemberServiceImpl memberIdChk() start... ");
		int result = md.memberIdChk(member);
		System.out.println("MemberServiceImpl memberIdChk() result->" +result);
		return result;
	}

	@Override
	public Member memberUpdateForm(String id) {
		System.out.println("MemberServiceImpl memberUpdateForm() start... ");
		Member member = md.memberUpdateForm(id);
		System.out.println("MemberServiceImpl memberUpdateForm() member->" +member);
		return member;
	}

	@Override
	public int memberUpdatePro(Member member) {
		System.out.println("MemberServiceImpl memberUpdatePro() start... ");
		int result = md.memberUpdatePro(member);
		System.out.println("MemberServiceImpl memberUpdatePro() result->" +result);
		return result;
	}

	@Override
	public int memberDelete(String id) {
		System.out.println("MemberServiceImpl memberDelete() start... ");
		int result = md.memberDelete(id);
		System.out.println("MemberServiceImpl memberDelete() result->" +result);
		return result;
	}

	@Override
	public Member memberSelect(String id) {
		
		return md.memberSelect(id);
	}

}

