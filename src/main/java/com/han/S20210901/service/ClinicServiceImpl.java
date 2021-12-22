package com.han.S20210901.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.ClinicDao;
import com.han.S20210901.model.Clinic;

@Service
public class ClinicServiceImpl implements ClinicService {
	
	
	@Autowired
	private ClinicDao clinicDao;
	
	@Override
	public int clinicTotal(String search, int searchType) {
		System.out.println("ClinicServiceImpl clinicTotal(search) Start...");
		int totalCnt = 0;
			 totalCnt = clinicDao.clinicTotal(search, searchType); 
		return totalCnt;
	}

	@Override
	public List<Clinic> clinicAll(Clinic clinic) {
		System.out.println("ClinicServiceImpl clinicAll clinic.getStart()->"+ clinic.getStart());
		System.out.println("ClinicServiceImpl clinicAll clinic.getEnd()->"+ clinic.getEnd());

		List<Clinic> clinicList = clinicDao.clinicAll(clinic);
		
		return clinicList;
	}

	@Override
	public List<Clinic> clinicSearch(Clinic clinic, int searchType) { //searchType 1: 담당의 검색  2: 환자 검색  3: 진료일 검색
		System.out.println("ClinicServiceImpl clinicSearch starts...");
		List<Clinic> clinicList=null;
		switch (searchType) {
		case 1:
			 clinicList = clinicDao.searchDoctorRecord(clinic);	
			break;
		case 2:
			clinicList = clinicDao.searchClientRecord(clinic);
			break;
		case 3:
			clinicList = clinicDao.searchDateRecord(clinic);
			break;
		
		}
		
		
		return clinicList;
	}

	@Override
	public int clinicInsert(Clinic newClinic) {
		System.out.println("ClinicServiceImpl clinicInsert starts...");
		
		int result = clinicDao.clinicInsert(newClinic);
		
		return result;
	}

	@Override
	public Clinic clinicDetail(int cnum) {
		Clinic clinic = null;
		
		clinic = clinicDao.clinicDetail(cnum);
		return clinic;
	}

	@Override
	public int clinicUpdate(Clinic newClinic) {
		int result = 0;
		result =clinicDao.clinicUpdate(newClinic); 
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1result=====>"+result);
		return result;
	}

	@Override
	public int deleteClinic(int cnum) {
		int result =0 ;
		
			result = clinicDao.deleteClinic(cnum);
			System.out.println("SERVICE deletePro result=>"+result);
		return result;
	}

	


}
