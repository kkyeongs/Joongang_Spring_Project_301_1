package com.han.S20210901.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.han.S20210901.model.Reservation;

@Repository
public class ReservationDaoImplKs implements ReservationDaoKs {
	// JDBC = DataSource, JPA = EntityManager, MyBatis = SqlSession
	@Autowired
	private SqlSession session;

	public List<Reservation> reservationData(Reservation reservation) {
		System.out.println("ReservationDaoImpl reservationData() start...");
		
		// reservationCalendar js에서 년, 월, 일을 받아 여기서 날짜의 값을 하나의 문자열로 만들어준다
		// 첫 날짜는 무조건 1일이기 때문에 1을 넣어주고
		// 두번째 날짜는 js에서 마지막 일을 받아오기 때문에 받아온 일을 넣어준다
		// a 날짜 부터 b 날짜 까지
		// firstYMD : a				secondYMD : b
		reservation.setFirstYMD(reservation.getYear()+"-"+reservation.getMonth()+"-1");
		reservation.setSecondYMD(reservation.getYear()+"-"+reservation.getMonth()+"-"+reservation.getDate());
		System.out.println("reservation.getFirstYMD -------------> " + reservation.getFirstYMD());
		System.out.println("reservation.getSecondYMD -------------> " + reservation.getSecondYMD());
		
		List<Reservation> reservationData = null;
		try {
			reservationData = session.selectList("ksListReservationDataSelect", reservation);
		} catch (Exception e) {
			System.out.println("ReservationDaoImpl reservationData() Error ->>>>> " + e.getMessage());
		}
		return reservationData;
	}

	public int reservationFormSubmit(Reservation reservation) {
		System.out.println("ReservationDaoImpl reservationFormSubmit() start...");
		
		int success = 0;
		try {
			success = session.insert("ksReservationFormInsert", reservation);
		} catch (Exception e) {
			System.out.println("ReservationDaoImpl reservationFormSubmit() Error ->>>>> " + e.getMessage());
		}
		return success;
	}

	
	public List<Reservation> updateReservation(int resnum) {
		System.out.println("ReservationDaoImpl updateReservation() start...");
		
		List<Reservation> updateReservation = null;
		try {
			updateReservation = session.selectList("ksUpdateReservationSelect", resnum);
		} catch (Exception e) {
			System.out.println("ReservationDaoImpl updateReservation() Error ->>>>> " + e.getMessage());
		}
		return updateReservation;
	}

	public int updateReservationSubmit(Reservation reservation) {
		System.out.println("ReservationDaoImpl updateReservationSubmit() start...");
		
		int success = 0;
		try {
			success = session.update("ksReservationUpdate", reservation);
		} catch (Exception e) {
			System.out.println("ReservationDaoImpl updateReservationSubmit() Error ->>>>> " + e.getMessage());
		}
		return success;
	}

	public List<Reservation> getEmpName() {
		System.out.println("ReservationDaoImpl getEmpName() start...");
		
		List<Reservation> EmpName = null;
		try {
			EmpName = session.selectList("ksGetEmpName");
		} catch (Exception e) {
			System.out.println("ReservationDaoImpl getEmpName() Error ->>>>> " + e.getMessage());
		}
		return EmpName;
	}

  	public int deleteDoReservation(int resnum) {
		System.out.println("ReservationDaoImpl getIdPw() start...");
		
		int result = 0;
		try {
			result = session.delete("deleteDoReservation", resnum);
		} catch (Exception e) {
			System.out.println("ReservationDaoImpl deleteDoReservation() Error ->>>>> " + e.getMessage());
		}
		
		return result;
	}


	
	
	
	
}

	













