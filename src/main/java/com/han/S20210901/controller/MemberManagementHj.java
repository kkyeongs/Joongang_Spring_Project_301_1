package com.han.S20210901.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.han.S20210901.model.MemberManagement;
import com.han.S20210901.service.MemberManagementService;
import com.han.S20210901.service.Paging;

@Controller
public class MemberManagementHj {
	
	@Autowired
	private MemberManagementService membermanagementService;
	
	@RequestMapping(value =  "MemberManagementMain")    
	public String index(String currentPage, Model model, String id, MemberManagement memberManagement, HttpServletRequest request) {
		System.out.println("MemberManagementHj MemberManagement() start...");
		System.out.println("request.getParameter(search)->"+request.getParameter("search"));
		System.out.println("request.getParameter(searchType)->"+request.getParameter("searchType"));
		String search = null;
		int searchType= 0;
		if(request.getParameter("search")!=null && !request.getParameter("search").equals("")) {
		 search = (String) request.getParameter("search");
		 searchType = Integer.parseInt(request.getParameter("searchType"));
		}
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!->"+request.getParameter("searchOption"));
		//멤버테이블 회원수 구하기
		memberManagement.setSearch(search);
		memberManagement.setSearchType(searchType);
		memberManagement.setSearchOption(request.getParameter("searchOption"));
		

		 int totalCnt = membermanagementService.MemberManagementTotal(memberManagement);
		 System.out.println("memberManagementList() totalCnt -> " + totalCnt);

	
		 
		//페이징 totalCnt = 12,1
		Paging pg = new Paging(totalCnt, currentPage);
		
		memberManagement.setStart(pg.getStart());
		memberManagement.setEnd(pg.getEnd());
		
		//리스트 모두 가져오기
		List<MemberManagement> memberManagementList = membermanagementService.MemberManagementAll(memberManagement,searchType);

		
		/* model.addAttribute("totalCnt", totalCnt); */
		model.addAttribute("memberList", memberManagementList);
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("id", id);
		model.addAttribute("pg", pg);
		
		return "membermanagementlist";
			
	}
		@GetMapping(value = "memberManagementDelete")
		public String memberManagementDelete(String id, Model model) {
			System.out.println("Controller MemberManagementHJ memberManagementDelete Start...");
			System.out.println("Controller MemberManagementHJ memberManagementDelete id -> "+ id);
			int result = membermanagementService.memberManagementDelete(id);
			System.out.println("Controller memberManagementDelete result->" + result);
			model.addAttribute("result", result);
			
			return "memberManagementDeletePro";

		}

}
