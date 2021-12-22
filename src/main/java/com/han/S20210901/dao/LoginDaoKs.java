package com.han.S20210901.dao;

import java.util.List;

import com.han.S20210901.model.Member;

public interface LoginDaoKs {
	List<Member> getIdPw(String id);
}
