package com.han.S20210901.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.FindDao;
import com.han.S20210901.model.Member;

@Service
public class FindServiceImpl implements FindService {

	@Autowired
	private FindDao fd;
	
	@Override
	public String findId(Member member) {
		String fid = fd.findId(member);
		return fid;
	}

	@Override
	public String findPw(Member member) {
		String fpw = fd.findPw(member);
		return fpw;
	}

	@Override
	public int findPwResult(Member member) {
		// 임시비밀번호 전송
		int result = 0;
		result = fd.findPwResult(member);
		return result;
	}

}
