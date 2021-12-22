package com.han.S20210901.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.ReservationDaoKs;
import com.han.S20210901.model.Reservation;

@Service
public class ReservationServiceImplKs implements ReservationServiceKs {
	@Autowired
	private ReservationDaoKs rd;

	public List<Reservation> reservationData(Reservation reservation) {
		System.out.println("ReservationServiceImpl reservationData() start");
		
		return rd.reservationData(reservation);
	}

	public int reservationFormSubmit(Reservation reservation) {
		System.out.println("ReservationServiceImpl reservationFormSubmit() start");
		
		return rd.reservationFormSubmit(reservation);
	}

	public List<Reservation> updateReservation(int resnum) {
		System.out.println("ReservationServiceImpl updateReservation() start");
		
		return rd.updateReservation(resnum);
	}

	public int updateReservationSubmit(Reservation reservation) {
		System.out.println("ReservationServiceImpl updateReservationSubmit() start");
		
		return rd.updateReservationSubmit(reservation);
	}

	public List<Reservation> getEmpName() {
		System.out.println("ReservationServiceImpl getEmpName() start");
		
		return rd.getEmpName();
	}

	public int deleteDoReservation(int resnum) {
		System.out.println("ReservationServiceImpl deleteDoReservation() start");
		
		return rd.deleteDoReservation(resnum);
	}
}
