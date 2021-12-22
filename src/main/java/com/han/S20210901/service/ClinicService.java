package com.han.S20210901.service;

import java.util.List;

import com.han.S20210901.model.Clinic;

public interface ClinicService {
	//진료내역 전체 개수
	int clinicTotal(String search, int searchType);
	
	//진료내역 전체 불러오기
	List<Clinic> clinicAll(Clinic clinic);
	// 진료내역 검색
	List<Clinic> clinicSearch(Clinic clinic, int searchType);
	// 진료내역 추가
	int clinicInsert(Clinic newClinic);

	Clinic clinicDetail(int cnum);

	int clinicUpdate(Clinic newClinic);

	int deleteClinic(int cnum);
	
	
	
}
