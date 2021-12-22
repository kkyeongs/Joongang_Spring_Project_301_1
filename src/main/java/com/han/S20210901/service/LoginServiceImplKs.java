package com.han.S20210901.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.LoginDaoKs;
import com.han.S20210901.model.Member;

@Service
public class LoginServiceImplKs implements LoginServiceKs {
	
	@Autowired
	private LoginDaoKs ld;

	public List<Member> getIdPw(String id) {
		System.out.println("LoginServiceImplKs getIdPw() start");
		
		return ld.getIdPw(id);
	}
}
