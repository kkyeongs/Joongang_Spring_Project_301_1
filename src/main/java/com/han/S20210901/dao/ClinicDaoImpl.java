package com.han.S20210901.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.han.S20210901.model.Clinic;

@Repository
public class ClinicDaoImpl implements ClinicDao {
	

	
	@Autowired
	private SqlSession session;
	@Override
	public int clinicTotal(String search,int searchType) {
		System.out.println("ClinicDaoImpl clinicTotal starts...");
		int totCnt = 0 ;
		
		switch (searchType) {
		case 0:
			totCnt = session.selectOne("HGclinicTotCnt");
			
			break;
		case 1:
			if(session.selectOne("HGclinicDoctorNameTotCnt",search)!=null)
			{	
				System.out.println("검색어search=>"+search);
				totCnt = session.selectOne("HGclinicDoctorNameTotCnt",search);
			}
			break;
			
		case 2:
			if(session.selectOne("HGclinicClientNameTotCnt",search)!=null)
			{	
				System.out.println("검색어search=>"+search);
				totCnt = session.selectOne("HGclinicClientNameTotCnt",search);
			}
			break;
			
		case 3:
			if(session.selectOne("HGclinicDateTotCnt",search)!=null)
			{	
				System.out.println("검색어search=>"+search);
				totCnt = session.selectOne("HGclinicDateTotCnt",search);
			}
			break;
		}
			

			return totCnt;
	}

	@Override
	public List<Clinic> clinicAll(Clinic clinic) {
		System.out.println("ClinicDaoImpl clinicAll clinic.getStart()->"+ clinic.getStart());
		System.out.println("ClinicDaoImpl clinicAll clinic.getEnd()->"+ clinic.getEnd());
		List<Clinic> clinicList = session.selectList("HGclinicList",clinic);
		return clinicList;
	}
	@Override
	public List<Clinic> searchDoctorRecord(Clinic clinic) {
		System.out.println("ClinicDaoImpl searchDoctorRecord starts...");
		List<Clinic> clinicList =null;
		if(session.selectList("HGdoctorNameClinicList",clinic)!=null)
			clinicList = session.selectList("HGdoctorNameClinicList",clinic);
		return clinicList;
	}

	
	@Override
	public List<Clinic> searchClientRecord(Clinic clinic) {
		System.out.println("ClinicDaoImpl searchClientRecord starts...");
		
		List<Clinic> clinicList =null;
		
		if(session.selectList("HGclientNameClinicList",clinic)!=null)
			clinicList = session.selectList("HGclientNameClinicList",clinic);
		
		
		return clinicList;
	}
	@Override
	public List<Clinic> searchDateRecord(Clinic clinic) {
		System.out.println("ClinicDaoImpl searchDateRecord starts...");
		List<Clinic> clinicList = null;
		if(session.selectList("HGdateClinicList",clinic)!=null)
			clinicList = session.selectList("HGdateClinicList",clinic);
		return clinicList;
	}
	@Override
	public int clinicInsert(Clinic newClinic) {
		System.out.println("ClinicDaoImpl clinicInsert starts...");
		
		int result = session.insert("HGclinicInsert",newClinic);
		System.out.println("is it works?");
		return result;
	}

	@Override
	public Clinic clinicDetail(int cnum) {
		
		Clinic clinic = session.selectOne("HGclinicSelect",cnum); 
		return clinic;
	}

	@Override
	public int clinicUpdate(Clinic newClinic) {
		int result =0;
		result = session.update("HGclinicUpdate", newClinic);
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1result=====>"+result);
		return  result;
	}

	@Override
	public int deleteClinic(int cnum) {
		int result = 0;
			result = session.delete("HGclinicDelete",cnum);
			System.out.println("DAO deletePro result=>"+result);
		return result;
	}

	

}
