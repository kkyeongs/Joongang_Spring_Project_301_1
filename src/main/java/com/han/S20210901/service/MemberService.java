package com.han.S20210901.service;

import com.han.S20210901.model.Member;

public interface MemberService {
	
	int memberJoin(Member member);

	int memberIdChk(Member member);

	Member memberUpdateForm(String id);

	int memberUpdatePro(Member member);

	int memberDelete(String id);

	Member memberSelect(String id);

}
