package com.han.S20210901.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.han.S20210901.model.Reservation;
import com.han.S20210901.service.ReservationServiceKs;

// port 8528
@Controller
public class ReservationControllerKs {
//	private static final Logger logger = LoggerFactory.getLogger(reservationController.class);
	@Autowired
	private ReservationServiceKs rs;
	
	// 캘린더 페이지 이동, 경성
	@GetMapping(value = "reservationCalendar")
	public String reservationCalendar(HttpServletRequest request, Model model) {
		System.out.println("ReservationController reservationCalendar() start...");
		
		String sessionId = (String)request.getSession().getAttribute("sessionId");
		// sessionId가 null일때 공백을 준 이유는 js에서 sessionId를 사용하기 때문에 
		// null이면 캘린더 오류가 생김, 그래서 공백을 줌
		if(sessionId == null) {
			sessionId = "";
		}
		System.out.println("sessionId->"+sessionId);
		
		model.addAttribute("sessionId", sessionId);
		
		return "reservationCalendar";
	}
	
	// 예약 폼 페이지 띄워줌, 경성
	@GetMapping(value = "makeAReservation")
	public String makeAReservation(HttpServletRequest request, Model model) {
		System.out.println("ReservationController makeAReservation() start...");
		
		String sessionId = (String)request.getSession().getAttribute("sessionId");
		System.out.println("sessionId->"+sessionId);
		List<Reservation> EmpName = rs.getEmpName();
		// EmpName 의사 이름 <select>로 띄워줘야 하기 때문에 따로 받아옴..
		model.addAttribute("EmpName", EmpName);
		model.addAttribute("sessionId", sessionId);
		
		return "makeAReservation";
	}
	
	// 수정 폼 페이지 띄워줌, 경성
	@GetMapping(value ="updateReservation")
	public String updateReservation(int resnum, Model model) {
		System.out.println("ReservationController updateReservation() start...");
		
		List<Reservation> updateFormList = rs.updateReservation(resnum);
		List<Reservation> EmpName = rs.getEmpName();
		
		model.addAttribute("updateFormList", updateFormList);
		model.addAttribute("EmpName", EmpName);
		
		return "updateReservation";
	}
}












