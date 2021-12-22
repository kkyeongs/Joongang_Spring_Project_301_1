package com.han.S20210901.service;

import java.util.List;

import com.han.S20210901.model.Member;

public interface LoginServiceKs {
	List<Member> getIdPw(String id);
}
