package com.han.S20210901.service;

import com.han.S20210901.model.Member;

public interface FindService {
	String findId(Member member);
	String findPw(Member member);
	int findPwResult(Member member);

}
