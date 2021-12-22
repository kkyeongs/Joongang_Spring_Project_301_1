package com.han.S20210901.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.MyPageDao;
import com.han.S20210901.model.Member;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDao md;
	
	@Override
	public Member myInfo(String sessionId , Member member) {
		System.out.println("MyPageServiceImpl myInfo start... ");
		member = md.myInfo(sessionId, member);
		System.out.println("MyPageServiceImpl myInfo member->" + member);
		return member;
	}



 }
