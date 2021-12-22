package com.han.S20210901.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.han.S20210901.model.Media;
import com.han.S20210901.model.Notice;
import com.han.S20210901.service.MediaService;
import com.han.S20210901.service.NoticeService;

@Controller
public class MainControllerHg {
	
	@Autowired
	private NoticeService ns;
	@Autowired
	private MediaService ms;
	
	@RequestMapping(value="main",method = { RequestMethod.POST, RequestMethod.GET })
	public String main(HttpServletRequest request, Model model, Media media, Notice notice) {
		//HttpSession session = request.getSession();
	//	String sessionId = (String)request.getSession().getAttribute("sessionId");
//		String sessionId = "admin";
			System.out.println("MainController starts....");
		//model.addAttribute("sessionId", sessionId);
		  
		  HttpSession session = null;
		  
		  session = request.getSession();
		  System.out.println("request.getParameter(id)->"+request.getParameter("id"));
		  System.out.println("request.getParameter(state)->"+request.getParameter("state"));
		  System.out.println("request.getParameter(name)->"+request.getParameter("name"));
		  
		  if(request.getParameter("id")!=null) {
			  session.setAttribute("sessionId", request.getParameter("id"));
			  session.setAttribute("sessionState", request.getParameter("state"));
			  session.setAttribute("sessionName", request.getParameter("name"));
			  session.setAttribute("sessionEmpno", request.getParameter("empno"));
			  session.setAttribute("sessionDept", request.getParameter("dept"));
			  
		  }
		  System.out.println("request.getParameter(state)->"+request.getParameter("state"));
		  
	      System.out.println("id ->>>>>>>>>>>>>> " + request.getParameter("id"));
	      System.out.println("sessionId->"+session.getAttribute("sessionId"));
	      System.out.println("sessionState->"+session.getAttribute("sessionState"));
	      System.out.println("sessionName->"+session.getAttribute("sessionName"));
	      System.out.println("sessionEmpno->"+session.getAttribute("sessionEmpno"));
	      System.out.println("sessionDept->"+session.getAttribute("sessionDept"));
	      
	      model.addAttribute("sessionId", session.getAttribute("sessionId"));
	      model.addAttribute("sessionState",session.getAttribute("sessionState"));

	      model.addAttribute("sessionName",session.getAttribute("sessionName"));
	      model.addAttribute("sessionEmpno",session.getAttribute("sessionEmpno"));
	      model.addAttribute("sesssionDept",session.getAttribute("sessionDept"));
	    

	      
	      // media 리스트 가져옴, 서현
	      List<Media> mediaList = ms.mediaListMain(media);
	      model.addAttribute("mediaList", mediaList);
	      System.out.println("mediaList.size-> " + mediaList.size());

	      
	      //공지사항 목록 가져옴
	      List<Notice> noticeList = ns.noticeListMain(notice);
	      System.out.println("noticeList.size-> " + noticeList.size());
	      model.addAttribute("noticeList", noticeList);
		
		return "main";
	}
}
