package com.han.S20210901.dao;

import java.util.List;

import com.han.S20210901.model.Reservation;

public interface ReservationDaoKs {
	List<Reservation> reservationData(Reservation reservation);
	int reservationFormSubmit(Reservation reservation);
	List<Reservation> updateReservation(int resnum);
	int updateReservationSubmit(Reservation reservation);
	List<Reservation> getEmpName();
	int deleteDoReservation(int resnum);
}
