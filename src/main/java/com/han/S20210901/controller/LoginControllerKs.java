package com.han.S20210901.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.han.S20210901.model.Emp;
import com.han.S20210901.model.Member;
import com.han.S20210901.service.EmpService;
import com.han.S20210901.service.LoginServiceKs;

@Controller
public class LoginControllerKs {

	@Autowired
	private LoginServiceKs ls;
    
	@Autowired
	private EmpService empService;
	
	// login 페이지 실행, 경성
	@GetMapping(value = "login")
	public String loginPage() {
		System.out.println("LoginController loginPage() start...");

		return "login";
	}

	// 로그인페이지에서 id, pw 날라옴, id pw 맞는지 확인용, 경성
	@PostMapping(value = "loginDo")
	@ResponseBody
	public List<Member> loginDo(String id) {
		System.out.println("LoginController loginDo() start...");

		List<Member> data = ls.getIdPw(id);
		System.out.println("!!!!!!!!!->"+data.get(0).getName());
		System.out.println("!!!!!!!!!->"+data.get(0).getId());
		System.out.println("확인하는 state->"+data.get(0).getState());
		if(data.get(0).getState()==2 || data.get(0).getState()==4 ) {
			Emp emp = empService.selectEmp(id);
			System.out.println("emp.getEmpno()->"+emp.getEmpno());
			System.out.println("emp.getDept()->"+emp.getDept());
			data.get(0).setEmpno(emp.getEmpno());
			data.get(0).setDept(emp.getDept());
		}
			
		return data;
	}

	// 로그아웃, 경성
	@GetMapping(value = "logout")
	public String logout(HttpServletRequest request) {
		System.out.println("LoginControllerKs logout() start...");
		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:main";
	}

}
