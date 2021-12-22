package com.han.S20210901.service;

import java.util.List;

import com.han.S20210901.model.Reservation;

public interface ReservationServiceKs {
	List<Reservation> reservationData(Reservation reservation);
	int reservationFormSubmit(Reservation reservation);
	List<Reservation> updateReservation(int resnum);
	int updateReservationSubmit(Reservation reservation);
	List<Reservation> getEmpName();
	int deleteDoReservation(int resnum);
}