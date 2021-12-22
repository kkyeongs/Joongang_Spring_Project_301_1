package com.han.S20210901.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.han.S20210901.service.PunchServiceHg;

@Controller
public class PunchControllerHg {
	@Autowired
	private PunchServiceHg punchService;
	
	
	@GetMapping(value="punch")
	public String punch(HttpServletRequest request) {
		System.out.println("PunchControllerHg punch() Starts...");
	
		return "punch";
		
	}
	
	@GetMapping(value="punchOn")
	public String punchOn(HttpServletRequest request, Model model ) {
		int result=0;
		System.out.println("PunchControllerHg punchOn() Starts...");
		System.out.println("PunchControllerHg qrID"+request.getParameter("qrId"));
		
		String qrId = (String) request.getParameter("qrId");
		if(qrId.equals(request.getSession().getAttribute("sessionId"))) {
			result = punchService.punchOn(request);
		}
		
		
		model.addAttribute("result",result);
		return "punchOn";
	}
	
	
	
	@GetMapping(value="punchOnQR")
	public String punchOnQR() {
		System.out.println("PunchControllerHg punchOnQR() Starts...");
		
		return "punchOnQR";
	}
	
	@GetMapping(value="punchOff")
	public String punchOff(HttpServletRequest request, Model model) {
		int result=0;
		System.out.println("PunchControllerHg punchOff() Starts...");
		System.out.println("PunchControllerHg qrID"+request.getParameter("qrId"));
		
		String qrId = (String) request.getParameter("qrId");
		if(qrId.equals(request.getSession().getAttribute("sessionId"))) {
			result = punchService.punchOff(request);
		}
		
		
		model.addAttribute("result",result);
		return "punchOff";
	}
	
	@GetMapping(value="punchOffQR")
	public String punchOffQR() {
		System.out.println("PunchControllerHg punchOffQR() Starts...");
		
		return "punchOffQR";
	}
	@GetMapping(value="qrMaker")
	public String qrMaker() {
		System.out.println("PunchControllerHg qrMaker() Starts...");
		
		return "qrMaker";
	}
	
	@PostMapping(value="qrcode")
	public String qrcode(HttpServletRequest request, Model model) {
		System.out.println("PunchControllerHg qrcode() Starts...");
		
		model.addAttribute("empId",request.getParameter("empId"));
		return "qrcode";
	}
}
