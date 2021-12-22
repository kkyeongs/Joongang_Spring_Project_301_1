package com.han.S20210901.dao;

import com.han.S20210901.model.Member;

public interface FindDao {
	String findId(Member member);
	String findPw(Member member);
	int findPwResult(Member member);

}
