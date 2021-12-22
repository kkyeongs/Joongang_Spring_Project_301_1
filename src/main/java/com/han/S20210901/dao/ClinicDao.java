package com.han.S20210901.dao;

import java.util.List;

import com.han.S20210901.model.Clinic;

public interface ClinicDao {
	
	
	//진료내역 전체 개수 
		int clinicTotal(String search,int searchType);
		//환자이름 체크해보기
		
		//진료내역 전체 불러오기
		List<Clinic> clinicAll(Clinic clinic);
		//진료내역 검색
		List<Clinic> searchDoctorRecord(Clinic clinic);
		List<Clinic> searchClientRecord(Clinic clinic);
		List<Clinic> searchDateRecord(Clinic clinic);
		
		//진료내역 등록
		int clinicInsert(Clinic newClinic);

		Clinic clinicDetail(int cnum);

		int clinicUpdate(Clinic newClinic);

		int deleteClinic(int cnum);
}
