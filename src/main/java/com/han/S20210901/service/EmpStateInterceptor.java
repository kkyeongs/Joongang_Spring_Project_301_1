package com.han.S20210901.service;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class EmpStateInterceptor implements HandlerInterceptor {
	public List empNeed = Arrays.asList("/punch*", "/empOperation","/Member*","/Emp*", "/makeAReservationOperation", "/reservationOperationCalendar","/clinic*");

	public List empNoNeed = Arrays.asList("/main");
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		System.out.println("EmpStateInterceptor preHandle starts...");
		//Integer state = 0;
		String state = null;
		if(request.getSession().getAttribute("sessionState")!=null) {
			state = (String)request.getSession().getAttribute("sessionState");
		}else {
			response.sendRedirect("main");
			return false;
		}
		
		if(state.equals("2") || state.equals("4"))
			return true;
		else {
			response.sendRedirect("main");
			return false;
		}
	}
}
