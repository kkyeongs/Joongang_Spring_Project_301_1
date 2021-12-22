package com.han.S20210901.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.han.S20210901.model.Member;
import com.han.S20210901.service.MyPageService;

@Controller
public class MyPageControllerGh {

	@Autowired
	private MyPageService ms;
	
	@RequestMapping(value = "myPage")
	public String myPage() {
		System.out.println("MyPageControllerGh myPage start...");
		return "myPage";
	}

	// 마이페이지 > '내 정보' :금희
	@RequestMapping(value = "myInfo")
	public String myInfo(HttpServletRequest request, Model model, Member member) {
		System.out.println("MyPageControllerGh myInfo start...");
		String sessionId = (String)request.getSession().getAttribute("sessionId");
		System.out.println("sessionId->" +sessionId);
		member = ms.myInfo(sessionId, member);
		model.addAttribute("member", member);
		return "myInfo";
	}

	
	
	
}
