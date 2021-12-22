package com.han.S20210901.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.han.S20210901.model.Reservation;
import com.han.S20210901.service.ReservationServiceKs;

@RestController
public class ReservationRestControllerKs {
//	private static final Logger logger = LoggerFactory.getLogger(reservationController.class);
	@Autowired
	private ReservationServiceKs rs;
	
	// 캘린더에 예약 데이터를 보냄 JS에서 사용하기 위해 ajax로 보냄, 경성
	@PostMapping(value = "reservationRestCalendar")
	public List<Reservation> reservationRestCalendar(Reservation reservation) {
		System.out.println("ReservationRestController reservationRestCalendar() start...");
		
		List<Reservation> reservationData = rs.reservationData(reservation);

		return reservationData;
	}
	
	// 예약 폼 데이터만 저장, JS에서 데이터 값 날라옴, 경성
	@PostMapping(value = "makeAReservationSubmit")
	public void makeAReservationSubmit(Reservation reservation) {
		System.out.println("ReservationRestController makeAReservationSubmit() start...");
		
		int result = rs.reservationFormSubmit(reservation);
		System.out.println(result);
	}
	
	// 예약 수정 데이터 날라옴, 수정처리만 진행, 경성
	@GetMapping(value = "updateDoReservationSubmit")
	public void updateDoReservationSubmit(Reservation reservation) {
		System.out.println("ReservationRestController updateDoReservationSubmit() start...");
		
		int result = rs.updateReservationSubmit(reservation);
		System.out.println(result);
	}
	
	// 수정 폼에서 예약 삭제, 삭제처리만 진행, 경성
	@GetMapping(value = "deleteDoReservation")
	public void deleteDoReservation(int resnum) {
		System.out.println("ReservationRestController deleteDoReservation() start...");
		
		int result = rs.deleteDoReservation(resnum);
		System.out.println(result);
	}
}












