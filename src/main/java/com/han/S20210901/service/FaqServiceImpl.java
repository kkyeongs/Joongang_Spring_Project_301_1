package com.han.S20210901.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.FaqDao;
import com.han.S20210901.model.Faq;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDao fd;
	
	@Override
	public List<Faq> fapList(Faq faq) {
		System.out.println("FaqServie faqList start..");
		// faq리스트 가져옴, 서현
		List<Faq> faqList = null;
		faqList = fd.faqList(faq);
		return faqList;
	}

	@Override
	public Faq faqUpdateForm(int fnum) {
		// faq 업데이트 폼
		System.out.println("faqServiceImpl faqUpdateForm start");
		Faq faq = fd.faqUpdateForm(fnum);
		return faq;
	}

	@Override
	public int faqUpdatePro(Faq faq) {
		System.out.println("faqServiceImpl faqUpdatePro start");
		int result = 0;
		result = fd.faqUpdatePro(faq);
		return result;
	}

	@Override
	public int faqInsertPro(Faq faq) {
		System.out.println("faqServiceImpl insertPro start");
		int result = 0;
		result = fd.faqInsertPro(faq);
		return result;
	}

	@Override
	public int faqDeletePro(int fnum) {
		int result = 0;
		result = fd.faqDeletePro(fnum);
		return result;
	}

}
