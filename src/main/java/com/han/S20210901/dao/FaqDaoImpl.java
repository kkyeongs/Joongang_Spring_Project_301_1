package com.han.S20210901.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.han.S20210901.model.Faq;

@Repository
public class FaqDaoImpl implements FaqDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Faq> faqList(Faq faq) {
		List<Faq> faqList = null;
		try {
			System.out.println("FaqDaoImplSh faqList start..");
			// faq리스트 가져옴, 서현
			faqList = session.selectList("faqListSh", faq);
		} catch (Exception e) {
			System.out.println("faqList DaoImpl Exception-> " + e.getMessage());
		}
		return faqList;
	}

	@Override
	public Faq faqUpdateForm(int fnum) {
		// faq 업데이트 폼
		System.out.println("faqDaoImpl faqUpdateForm start");
		Faq faq = session.selectOne("faqUpdateFormSh", fnum);
		return faq;
	}

	@Override
	public int faqUpdatePro(Faq faq) {
		System.out.println("faqDaoImpl faqUpdatePro start");
		int result = 0;
		result = session.update("faqUpdateProSh", faq);
		return result;
	}

	@Override
	public int faqInsertPro(Faq faq) {
		System.out.println("faqDaoImpl faqInsertPro start");
		int result = 0;
		result = session.insert("faqInsertProSh", faq);
		return result;
	}

	@Override
	public int faqDeletePro(int fnum) {
		int result = 0;
		result = session.delete("faqDeleteProSh", fnum);
		return result;
	}

}
