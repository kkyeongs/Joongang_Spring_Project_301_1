package com.han.S20210901.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.han.S20210901.model.MyselfTest;
import com.han.S20210901.service.ReplysService;

@Controller
public class MyselfTestControllerJh {
	
	@Autowired
	private ReplysService replyService;
	
	@GetMapping(value = "myselfTest")
	public String myselfTest() {
		
		return "myselfTest";
	}
	
	@PostMapping(value = "TestResult")
	public String TestResult(MyselfTest myTest, Model model) {
		//자가진단 점수 합산
		int testTotal = myTest.getMyTest1()+myTest.getMyTest2()+myTest.getMyTest3()+myTest.getMyTest4()+myTest.getMyTest5()+
						myTest.getMyTest6()+myTest.getMyTest7()+myTest.getMyTest8()+myTest.getMyTest9()+myTest.getMyTest10();
		
		System.out.println("TestResult testTotal ->"+testTotal);
		model.addAttribute("total", testTotal);
		model.addAttribute("myTest", myTest);
		
		return "myselfTestResult";
	}
	
	@RequestMapping(value = "myselfTest2")
	public String myselfTest2(MyselfTest myTest, Model model) {
		System.out.println("PconsultControllerJh myselfTest2() Start...");
			
		return "myselfTest2";
	}
	
	                     
	@GetMapping(value = "myselfTest3")
	public String myselfTest3(MyselfTest myTest, Model model) {
		System.out.println("PconsultControllerJh myselfTest3() Start...");
		
		return "myselfTest3";
	}
	
	
	
	@RequestMapping(value = "myselfTest4", produces = "application/text;charset=UTF-8") // 서버 프로그램
	@ResponseBody // api or ajax쓸때 애 꼭 써줘야돼
	public String myselfTest3(MyselfTest myselfTest) { // ajax에서 호출
		System.out.println("myselfTest2.getMyTest1()->"+myselfTest.getMyTest1());
		System.out.println("myselfTest2.getMyTest5()->"+myselfTest.getMyTest5());
		System.out.println("myselfTest2.getMyTest10()->"+myselfTest.getMyTest10());
		
		int calTotal = replyService.calculatePoint(myselfTest);
		String strCalTotal = String.valueOf(calTotal);
		System.out.println("myselfTest2 strCalTotal->"+strCalTotal);
		return strCalTotal; // 애를 호출한 ajax으로 날아간다. json컨버터
	}

}
