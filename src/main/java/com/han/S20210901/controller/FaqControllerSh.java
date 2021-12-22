package com.han.S20210901.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.han.S20210901.model.Faq;
import com.han.S20210901.service.FaqService;

@Controller
public class FaqControllerSh {
	
	@Autowired
	private FaqService fs;
	
	@RequestMapping(value = "faqList")
	public String faq(Faq faq, Model model) {
		System.out.println("FaqControllerSh faq start..");
		// faq 리스트 가져옴, 서현
		List<Faq> faqList = fs.fapList(faq);
		model.addAttribute("faqList", faqList);
		return "faqList";
	}
	
	@RequestMapping(value = "faqUpdateForm")
	public String faqUpdateForm(int fnum, Model model) {
		System.out.println("faqController faqUpdateForm start");
		// 업데이트, fnum 가져가서 해당하는 로우 값 jsp에 뿌려주기
		Faq faq = fs.faqUpdateForm(fnum);
		model.addAttribute("faq", faq);
		return "faqUpdateForm";
	}
	
	@RequestMapping(value = "faqUpdatePro")
	public String faqUpdatePro(Faq faq, Model model) {
		System.out.println("faqController faqUpdatePro start");
		// 업데이트 성공하면 1 실패하면 0 alert창 띄움
		int result = 0;
		result = fs.faqUpdatePro(faq);
		model.addAttribute("result", result);
		return "faqUpdatePro";
	}
	
	@RequestMapping(value = "faqInsertForm")
	public String faqInsertForm(Model model) {
		return "faqInsertForm";
	}
	
	@RequestMapping(value = "faqInsertPro")
	public String faqInsertPro(Faq faq, Model model) {
		System.out.println("faqController insertPro start");
		// insert 성공하면 1, 실패하면 0 Pro로 보내서 alert창 띄움
		int result = 0;
		result = fs.faqInsertPro(faq);
		model.addAttribute("result", result);
		return "faqInsertPro";
	}
	
	@RequestMapping(value = "faqDeletePro")
	public String faqDelete(int fnum, Model model) {
		System.out.println("faqController faqDelete start");
		// delete 성공하면 1, 실패하면 0 Pro로 보내서 alert창 띄움
		int result = 0;
		result = fs.faqDeletePro(fnum);
		model.addAttribute("result", result);
		return "faqDeletePro";
	}
	
	@RequestMapping(value = "introduce")
	public String introduce() {
		return "introduce";
	}

}
