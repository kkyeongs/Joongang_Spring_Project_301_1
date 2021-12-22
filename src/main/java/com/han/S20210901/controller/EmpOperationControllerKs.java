package com.han.S20210901.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.han.S20210901.model.Reservation;
import com.han.S20210901.service.ReservationServiceKs;

@Controller
public class EmpOperationControllerKs {
	
	@Autowired
	private ReservationServiceKs rs;
	
	// 관리자 예약관리 캘린더 경성
	@GetMapping("reservationOperationCalendar")
	public String empOperation(HttpServletRequest request, Model model) {
		System.out.println("EmpOperationControllerKs makeAReservationOperation() start...");
		
		return "reservationOperationCalendar";
	}
	
	// 관리자 예약관리에서 예약등록, 의사들이 다음일정 잡을 때 쓰는.. 경성
	@GetMapping("makeAReservationOperation")
	public String makeAReservationOperation(Model model) {
		System.out.println("EmpOperationControllerKs makeAReservationOperation() start...");
		
		List<Reservation> EmpName = rs.getEmpName();
		model.addAttribute("EmpName", EmpName);
		
		return "makeAReservationOperation";
	}
}
