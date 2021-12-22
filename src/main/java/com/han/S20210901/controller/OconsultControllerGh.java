package com.han.S20210901.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.han.S20210901.model.Oconsult;
import com.han.S20210901.service.OconsultService;
import com.han.S20210901.service.Paging;

//해당 클래스가 Controller임을 나타내기 위한 어노테이션
@Controller
public class OconsultControllerGh {
	private static final Logger logger = LoggerFactory.getLogger(OconsultControllerGh.class);
	
	// /IoC 컨테이너 안에 존재하는 Bean을 자동으로 주입해 줌
	@Autowired
	private OconsultService os;
	
	//요청에 대해 어떤 Conrollter, 어떤 메소드가 처리할지를 맵핑하기 위한 어노테이션
	@RequestMapping(value = "oconsultList")
	public String oconsultList(Oconsult oconsult, String currentPage, Model model) {
		System.out.println("OconsultController Start list...");
		//공개상담 게시물 개수 
		int total = os.total();   
		System.out.println("OconsultController total=>" + total);
		// Paging
		Paging pg = new Paging(total, currentPage);
		oconsult.setStart(pg.getStart());
		oconsult.setEnd(pg.getEnd());
		System.out.println("!!!!->"+oconsult.getStart());
		System.out.println("!!!!->"+oconsult.getEnd());
		System.out.println("OconsultController oconsultList start......");
		//리스트 모두 가져오기
		List<Oconsult> listOconsult = os.listOconsult(oconsult);
		model.addAttribute("total", 		total);
		model.addAttribute("listOconsult", 	listOconsult);
		model.addAttribute("pg", 			pg);
		
		
		return "oconsultList";
	}
	
	// 제목 누르면 나타나는 상세페이지
	@GetMapping(value = "oconsultDetail")
	public String oconsultDetail(int onum, Model model) {
		System.out.println("OconsultController Start oconsultDetail...");
		// 조회수 +1
		int count = os.oconsultCount(onum);
		System.out.println("OconsultController oconsultDetail count->" +count);
		Oconsult oconsult = os.oconsultDetail(onum);
		model.addAttribute("oconsult", oconsult);
		return "oconsultDetail";
	}
	
	// 수정 폼
	@RequestMapping(value = "oconsultUpdateForm")
	public String oconsultUpdateForm(int onum, Model model) {
		System.out.println("OconsultController Start oconsultUpdateForm...");
		Oconsult oconsult = os.oconsultDetail(onum);
		model.addAttribute("oconsult", oconsult);
		return "oconsultUpdateForm";
	}
	
	// 수정
	@PostMapping(value = "oconsultUpdate")
	public String oconsultUpdate(Oconsult oconsult, Model model) {
		int k = os.oconsultUpdate(oconsult);
		System.out.println("os.update(oconsult) k-->"+k);
		return "forward:oconsultList"; //똑같은 컨트롤러로 가서 메소드실행/ redirect-model은 안가져감 ,forward-model같이 가져감
	}
	
	
	// 글쓰기 폼
	@RequestMapping(value = "oconsultWriteForm" )
	public String oconsultWriteForm(Model model) {
		System.out.println("OconsultController oconsultWriteForm Start...");
		return "oconsultWriteForm";
	}
	
	// 글쓰기
	@RequestMapping(value = "oconsultWrite") 
	public String oconsultWrite(Oconsult oconsult, Model model) {
		System.out.println("OconsultController oconsultWrite Start...");
		int result = os.oconsultInsert(oconsult);
		model.addAttribute("result", result);
		return "oconsultWritePro";
	}
	
	
	// 삭제  onum
	@RequestMapping(value = "oconsultDelete" )
	public String oconsultDelete(int onum, Model model) {
		System.out.println("OconsultController oconsultDelete Start...");
		int result = os.oconsultDelete(onum);
		model.addAttribute("result", result);
		return "redirect:oconsultList";
	}
	
	// 답변 view
	@RequestMapping(value = "oconsultReplyForm")
	public String oconsultReply(int onum, Model model) {
		System.out.println("OconsultController oconsultReplyForm Start...");
		Oconsult oconsult = os.oconsultReplyForm(onum);
		model.addAttribute("oconsult", oconsult);
		return "oconsultReplyForm";
	}
	
	// 답변
	  @RequestMapping(value = "oconsultReplyPro") 
	  public String oconsultReplyPro(Oconsult oconsult, Model model ) {
		  System.out.println("OconsultController oconsultReplyPro Start...");
		  //답변
		  System.out.println("otitle "+oconsult.getOtitle());
			System.out.println("owriter "+oconsult.getOwriter());
			System.out.println("ocontent "+oconsult.getOcontent());
			System.out.println("onum "+oconsult.getOnum());
			System.out.println("opw "+oconsult.getOpw());
			System.out.println("odate "+oconsult.getOdate());
			System.out.println("ocount "+oconsult.getOcount());
			System.out.println("ogroup "+oconsult.getOgroup());
			System.out.println("ostep "+oconsult.getOstep());
			System.out.println("oindent "+oconsult.getOindent());
		  int k = os.oconsultReplyshape(oconsult);
		  System.out.println("OconsultController oconsultReplyPro k->" +k);
		  int result = os.oconsultReplyPro(oconsult);
		  System.out.println(result);
		  model.addAttribute("result", result);
		  return "oconsultReplyPro";
	  }
	 
	
	
	// 목록
	
	// 나중에 만들기 empcontrolller 에서 96번째 줄
//	@GetMapping(value = "oconsultWriteForm")
//	public String oconsultDetail( )
//	
	

	
}
	
	
	
	
	
	

