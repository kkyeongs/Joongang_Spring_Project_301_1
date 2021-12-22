package com.han.S20210901.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import com.han.S20210901.model.EmpManagement;
import com.han.S20210901.service.EmpManagementService;

@Controller
public class EmpManagementHj {

	@Autowired
	private EmpManagementService empmanagementService;
	
	@RequestMapping(value = "EmpManagementMain")
	public String index(Model model, EmpManagement empManagement) {
		
		//리스트 모두 가져오기
		List<EmpManagement> empManagementList = empmanagementService.EmpManagementAll(empManagement);
		
		model.addAttribute("empList", empManagementList);
		
		//empmanagementinside
		return "empmanagementlist";
	}
	
	
}
