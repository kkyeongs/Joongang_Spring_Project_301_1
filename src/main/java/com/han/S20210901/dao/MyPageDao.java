package com.han.S20210901.dao;

import com.han.S20210901.model.Member;

public interface MyPageDao {

	Member myInfo(String sessionId, Member member);

}
