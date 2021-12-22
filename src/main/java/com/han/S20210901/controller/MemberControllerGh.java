package com.han.S20210901.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.han.S20210901.model.Member;
import com.han.S20210901.service.EmpService;
import com.han.S20210901.service.MemberService;

@Controller
public class MemberControllerGh {

	@Autowired
	private MemberService ms;
	@Autowired
	private EmpService empService;
	
	@RequestMapping(value = "memberJoinForm")
	public String memberJoinForm(Model model) {
		System.out.println("MemberControllerGh memberJoinForm() Start... ");
		return "memberJoinForm";
	}
	
	//회원가입(daum 주소 api)- 금희
	@RequestMapping(value = "memberJoin") 
	public String memberJoin(Model model, Member member, HttpServletRequest request) {
		System.out.println("MemberControllerGh memberJoin() Start... "); 
		System.out.println("!!!!!! request dept->"+request.getParameter("dept"));
		int result =0 ;
		
		
		result = ms.memberJoin(member); 
		if(request.getParameter("dept")!=null) {
			result = empService.newEmp(member,request.getParameter("dept"));
		}
		model.addAttribute("result", result); 
		return "memberJoinPro"; 
	}
	
	// 회원가입 > ID중복체크 - 금희
	@ResponseBody
	@RequestMapping(value = "memberIdChk", method = RequestMethod.POST)
	public int memberIdChk(Member member) {
		System.out.println("MemberControllerGh memberIdChk() Start...");
		System.out.println("id->"+member.getId());
		int result = ms.memberIdChk(member);
		/* System.out.println(result); */
		
		return result ;
	}
	
	// 회원정보 수정 폼 - 금희
	@RequestMapping(value = "memberUpdateForm")
	public String memberUpdateForm(String id, Model model) {
		System.out.println("MemberControllerGh memberUpdateForm() start...");
		System.out.println("member-> " + id);
		Member member = ms.memberUpdateForm(id);
		model.addAttribute("member", member);
		return "memberUpdateForm";
	}
	
	// 회원정보 수정 - 금희
	@RequestMapping(value = "memberUpdatePro")
	public String memberUpdatePro(Member member, Model model) {
		System.out.println("MemberControllerGh memberUpdatePro() start...");
		int result = ms.memberUpdatePro(member);
		model.addAttribute("result", result);
		return "forward:myInfo";
	}
	
	// 회원정보 탈퇴 - 금희
	@RequestMapping(value = "memberDelete")
	public String memberDelete(String id, Model model) {
		System.out.println("MemberControllerGh memberDelete() start...");
		int result = ms.memberDelete(id);
		model.addAttribute("result", result);
		return "memberDelete";
	}
	

}
