package com.han.S20210901.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.OconsultDao;
import com.han.S20210901.model.Oconsult;

@Service
public class OconsultServiceImpl implements OconsultService {
	@Autowired
	private OconsultDao od;

	// 상속 관계인 부모 클래스와 자식 클래스 사이에서 부모 클래스의 메소드를 똑같이 가져와 사용
	@Override
	// 공개상담 게시물 개수 
	public int total() {
		System.out.println("OconsultServiceImpl Start total..." );
		int totCnt = od.total();
		System.out.println("OconsultServiceImpl total totCnt->"+totCnt);
		return totCnt;
	}

	@Override
	public List<Oconsult> listOconsult(Oconsult oconsult) {
		List<Oconsult> oconsultList = null;
		System.out.println("OconsultServiceImpl listOconsult Start...");
		oconsultList = od.listOconsult(oconsult);
		System.out.println("OconsultServiceImpl listOconsult listOconsult.size()->" + oconsultList.size());
		
		return oconsultList;
	}

	@Override
	public Oconsult oconsultDetail(int onum) {
		System.out.println("OconsultServiceImpl oconsultDetail ...");
		Oconsult oconsult = null;
		oconsult = od.oconsultDetail(onum);
		return oconsult;
	}

	@Override
	public int oconsultUpdate(Oconsult oconsult) {
		System.out.println("oconsultServiceImpl oconsultUpdate ...");
		int k = 0;
		k = od.oconsultUpdate(oconsult);
		return k;
	}

	@Override
	public int oconsultCount(int onum) {
		System.out.println("oconsultServiceImpl oconsultCount ...");
		int count = od.oconsultCount(onum);
		return count;
	}

	@Override
	public int oconsultInsert(Oconsult oconsult) {
		int result = 0;
		System.out.println("oconsultServiceImpl oconsultInsert ...");
		result = od.oconsultInsert(oconsult);
		return result;
	}

	@Override
	public int oconsultDelete(int onum) {
		int result = 0;
		System.out.println("oconsultServiceImpl oconsultDelete ...");
		result = od.oconsultDelete(onum);
		return result;
	}

	@Override
	public Oconsult oconsultReplyForm(int onum) {
		System.out.println("oconsultServiceImpl oconsultReplyForm ...");
		Oconsult oconsult  = null;
		oconsult = od.oconsultReplyForm(onum);
		return oconsult;
	}

	@Override
	public int oconsultReplyshape(Oconsult oconsult) {
		System.out.println("oconsultServiceImpl oconsultReplyshape ...");
		int k = 0;
		k = od.oconsultReplyshape(oconsult);
		return k;
	}

	@Override
	public int oconsultReplyPro(Oconsult oconsult) {
		System.out.println("oconsultServiceImpl oconsultReplyPro ...");
		int result = 0;
		result = od.oconsultReplyPro(oconsult);
		return result;
	}

	

}
