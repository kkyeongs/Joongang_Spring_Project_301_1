package com.han.S20210901.service;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginInterceptor implements HandlerInterceptor {
		
		public List loginNeed
			= Arrays.asList("/punch*","/empOperation", "/reservationCalendar", "/makeAReservation", "/Member*", "/Emp*", "/updateReservation","/clinic*");
		
		public List loginNoNeed
			= Arrays.asList("main");
		
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
			System.out.println("preHandle starts...");
			if(request.getSession().getAttribute("sessionId")==null) {
				String destUri = request.getRequestURI();
				String destQuery = request.getQueryString();
				String dest = (destQuery == null) ? destUri : destUri+"?"+destQuery;
				request.getSession().setAttribute("dest", dest);
				response.sendRedirect("login");
				
				return false;
			}
			else {
				return true;
			}
			
		}
}
