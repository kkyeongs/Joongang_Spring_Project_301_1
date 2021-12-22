package com.han.S20210901.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.han.S20210901.model.Clinic;
import com.han.S20210901.model.Emp;
import com.han.S20210901.model.Member;
import com.han.S20210901.model.PunchHg;
import com.han.S20210901.service.ClinicService;
import com.han.S20210901.service.EmpService;
import com.han.S20210901.service.MemberService;
import com.han.S20210901.service.Paging;
import com.han.S20210901.service.PconsultService;
import com.han.S20210901.service.PunchServiceHg;

@Controller
public class EmpOperationControllerHg {
	
	@Autowired
	private ClinicService clinicService;
	@Autowired
	private PunchServiceHg punchService;
	@Autowired
	private PconsultService pconsultService;
	@Autowired
	private EmpService empService;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("empOperation")
	public String empOperation(HttpServletRequest request, Model model) {
		//String sessionId = (String)request.getSession().getAttribute("sessionId");
//		String sessionId = "admin";
//		model.addAttribute("sessionId",sessionId);
		//admin이 쓴 댓글 개수
		int admintotal = pconsultService.adminTotal();
		
		//pconsult 총 개수 
		int totalCnt = pconsultService.pConsultTotal();
		
		int resultTotal = totalCnt - admintotal; //7
		System.out.println("resultTotal 개수 : "+resultTotal);
		
		model.addAttribute("resultTotal", resultTotal);
		
		return "empOperation";
	}
	
	@GetMapping("clinicOperation")
	public String clinicOperation(Clinic clinic, String currentPage, Model model, HttpServletRequest request) {
		
		System.out.println("EmpOperationControllerHg clinicOperation starts...");
		System.out.println("Parameter currentPage-> "+currentPage);
		System.out.println("EmpOperationControllerHg clinicOperation request.getParameter(search)->"+request.getParameter("search"));
		
		String search = (String) request.getParameter("search");
		List<Clinic> clinicList = null;
		int totCnt = clinicService.clinicTotal(search,0);
		Paging pg = new Paging(totCnt, currentPage);
		
		clinic.setStart(pg.getStart());
		clinic.setEnd(pg.getEnd());
		clinic.setClientName(search);

		System.out.println("ClinicControllerImpl clinicAll clinic.getStart()->"+ clinic.getStart());
		System.out.println("ClinicControllerImpl clinicAll clinic.getEnd()->"+ clinic.getEnd());
		System.out.println("ClinicControllerImpl clinic.setClientName->"+ clinic.getClientName());
		System.out.println("ClinicControllerImpl search->"+search);
		
		if(search==null) clinicList = clinicService.clinicAll(clinic);
		else clinicList = clinicService.clinicSearch(clinic,0);
		
		
		model.addAttribute("clinicList",clinicList);
		model.addAttribute("totalCnt", totCnt);
		model.addAttribute("search",search);
		model.addAttribute("pg", pg);
		
		System.out.println("clinicList.size()->"+clinicList.size());
		
	
			return "clinicOperation";
	}
	@GetMapping("clinicSearchByClientName")
	public String clinicSearchByClientName(Clinic clinic, String currentPage, Model model, HttpServletRequest request) {
		
		System.out.println("EmpOperationControllerHg clinicSearchByClientName starts...");
		System.out.println("Parameter clinicSearchByClientName currentPage-> "+currentPage);
		System.out.println("EmpOperationControllerHg clinicSearchByClientName request.getParameter(search)->"+request.getParameter("search"));
		
		String search = (String) request.getParameter("search");
		List<Clinic> clinicList = null;
		int totCnt = clinicService.clinicTotal(search, 2);
		Paging pg = new Paging(totCnt, currentPage);
		
		clinic.setStart(pg.getStart());
		clinic.setEnd(pg.getEnd());
		clinic.setClientName(search);

		System.out.println("ClinicControllerImpl clinicAll clinic.getStart()->"+ clinic.getStart());
		System.out.println("ClinicControllerImpl clinicAll clinic.getEnd()->"+ clinic.getEnd());
		System.out.println("ClinicControllerImpl clinic.setClientName->"+ clinic.getClientName());
		System.out.println("ClinicControllerImpl search->"+search);
		
		if(search==null) clinicList = clinicService.clinicAll(clinic);
		else clinicList = clinicService.clinicSearch(clinic, 2);
		
		
		model.addAttribute("clinicList",clinicList);
		model.addAttribute("totalCnt", totCnt);
		model.addAttribute("search",search);
		model.addAttribute("pg", pg);
		
		System.out.println("clinicList.size()->"+clinicList.size());
		
	
			return "clinicSearchByClientName";
	}
	@GetMapping("clinicSearchByDoctorName")
	public String clinicSearchByDoctorName(Clinic clinic, String currentPage, Model model, HttpServletRequest request) {
		
		System.out.println("EmpOperationControllerHg clinicSearchByDoctorName starts...");
		System.out.println("Parameter clinicSearchByDoctorName currentPage-> "+currentPage);
		System.out.println("EmpOperationControllerHg clinicSearchByDoctorName request.getParameter(search)->"+request.getParameter("search"));
		
		String search = (String) request.getParameter("search");
		List<Clinic> clinicList = null;
		int totCnt = clinicService.clinicTotal(search,1); // search가 null이면 전체 리스트 갯수 반환하고 search 값이 있을 경우 그 검색어의 전체 리스트 갯수 
		Paging pg = new Paging(totCnt, currentPage);
		
		clinic.setStart(pg.getStart());
		clinic.setEnd(pg.getEnd());
		clinic.setDoctorName(search);
		
		if(search==null) clinicList = clinicService.clinicAll(clinic);
		else clinicList = clinicService.clinicSearch(clinic,1);
		
		
		model.addAttribute("clinicList",clinicList);
		model.addAttribute("totalCnt", totCnt);
		model.addAttribute("search",search);
		model.addAttribute("pg", pg);
		
		System.out.println("clinicList.size()->"+clinicList.size());
		
	
			return "clinicSearchByDoctorName";
	}
	@GetMapping("clinicSearchByDate")
	public String clinicSearchByDate(Clinic clinic, String currentPage, Model model, HttpServletRequest request) {
		
		System.out.println("EmpOperationControllerHg clinicSearchByDate starts...");
		System.out.println("Parameter clinicSearchByDate currentPage-> "+currentPage);
		System.out.println("EmpOperationControllerHg clinicSearchByDate request.getParameter(search)->"+request.getParameter("search"));
		
		String search = (String) request.getParameter("search");
		List<Clinic> clinicList = null;
		int totCnt = clinicService.clinicTotal(search,3); // search가 null이면 전체 리스트 갯수 반환하고 search 값이 있을 경우 그 검색어의 전체 리스트 갯수 
		Paging pg = new Paging(totCnt, currentPage);
		
		clinic.setStart(pg.getStart());
		clinic.setEnd(pg.getEnd());
		clinic.setSearchDate(search);
		
		if(search==null) clinicList = clinicService.clinicAll(clinic);
		else clinicList = clinicService.clinicSearch(clinic,3);
		
		
		model.addAttribute("clinicList",clinicList);
		model.addAttribute("totalCnt", totCnt);
		model.addAttribute("search",search);
		model.addAttribute("pg", pg);
		
		System.out.println("clinicList.size()->"+clinicList.size());
		
	
			return "clinicSearchByDate";
	}
	@RequestMapping(value="clinicWriteForm", method = { RequestMethod.POST, RequestMethod.GET })
	public String clinicWriteForm(HttpServletRequest request, Model model) {
		
		System.out.println("clinicWriteForm model result->"+model.getAttribute("result"));
		return "clinicWrite";
	}
	@RequestMapping(value="clinicWritePro", method = { RequestMethod.POST, RequestMethod.GET })
	public String clinicWritePro(HttpServletRequest request, Model model) {
		int result=0;
	
		System.out.println("EmpOperationController clinicWritePro starts...");
		System.out.println("EmpOperationController clinicWritePro request result->"+request.getParameter("result"));
		Clinic newClinic = new Clinic();
		System.out.println("request.getParameter(ccontent)->"+request.getParameter("ccontent"));
		System.out.println("request.getParameter(empno)->"+request.getParameter("empno"));
		System.out.println("request.getParameter(id)->"+request.getParameter("id"));
		System.out.println("request.getParameter(ctime)->"+request.getParameter("ctime"));
		
		newClinic.setCcontent(request.getParameter("ccontent"));
		newClinic.setEmpno(Integer.parseInt(request.getParameter("empno")));
		newClinic.setId(request.getParameter("id"));
		newClinic.setCtime("");
		
		result = clinicService.clinicInsert(newClinic);
		if(result>0) {
			
			model.addAttribute("result",result);
			return "redirect:clinicOperation";
			
		}
		else
			return "main";
	}
	@PostMapping(value="clinicUpdatePro")
	public String clinicUpdatePro(HttpServletRequest request, Model model) {
		int result=0;
	
		System.out.println("EmpOperationController clinicUpdatePro starts...");
		System.out.println("EmpOperationController clinicUpdatePro request result->"+request.getParameter("result"));
		Clinic newClinic = new Clinic();
		System.out.println("request.getParameter(cnum)->"+request.getParameter("cnum"));
		System.out.println("request.getParameter(ccontent)->"+request.getParameter("ccontent"));
		System.out.println("request.getParameter(empno)->"+request.getParameter("empno"));
		System.out.println("request.getParameter(id)->"+request.getParameter("id"));
		System.out.println("request.getParameter(ctime)->"+request.getParameter("ctime"));
		
		newClinic.setCnum(Integer.parseInt(request.getParameter("cnum")));
		newClinic.setCcontent(request.getParameter("ccontent"));
		newClinic.setEmpno(Integer.parseInt(request.getParameter("empno")));
		newClinic.setId(request.getParameter("id"));
		newClinic.setCtime("");
		
		result = clinicService.clinicUpdate(newClinic);
		if(result>0) {
			
			model.addAttribute("result",result);
			return "redirect:clinicOperation";
			
		}
		else
			return "main";
	}
	@GetMapping(value="deletePro")
	public String deletePro(HttpServletRequest request) {
		System.out.println("deletePro starts...");
		int result = 0;
		
		result = clinicService.deleteClinic(Integer.parseInt(request.getParameter("cnum")));
		
		System.out.println("deletePro result=>"+result);
		
		if(result>0) return "redirect:clinicOperation";
		else return "main";
	}
	
	@GetMapping(value="punchList")
	public String punchList(PunchHg punch, String currentPage, HttpServletRequest request, Model model) {
		System.out.println("EmpOperationController punchList starts..");
		System.out.println("Parameter currentPage-> "+currentPage);
		System.out.println("EmpOperationControllerHg punchList request.getParameter(search)->"+request.getParameter("search"));
		
		String search = (String) request.getParameter("search");
		String searchType = (String) request.getParameter("searchType");
		List<PunchHg> punchList = null;

		int totCnt = 0;
		if(searchType==null) searchType = "0" ;
		
		totCnt = punchService.punchTotal(search,Integer.parseInt(searchType));
		Paging pg = new Paging(totCnt, currentPage);
		
		punch.setStart(pg.getStart());
		punch.setEnd(pg.getEnd());
		punch.setSearch(search);
		punch.setSearchType(searchType);
		


		System.out.println("EmpControllerImpl clinicAll clinic.getStart()->"+ punch.getStart());
		System.out.println("EmpControllerImpl clinicAll clinic.getEnd()->"+ punch.getEnd());
		//System.out.println("EmpControllerImpl clinic.setClientName->"+ punch.getClientName());
		System.out.println("EmpControllerImpl search->"+search);
		
		punchList = punchService.punchList(punch,Integer.parseInt(searchType));
		
		
		
		model.addAttribute("punchList",punchList);
		model.addAttribute("totalCnt", totCnt);
		model.addAttribute("search",search);
		model.addAttribute("searchType", searchType);
		model.addAttribute("pg", pg);
		
		System.out.println("punchList.size()->"+punchList.size());
		
		
		
		return "punchList";
	}
	@GetMapping(value="clinicDetail")
	public String clinicDetail(HttpServletRequest request, int cnum, Model model) {
		Clinic clinic = clinicService.clinicDetail(cnum);
		
		Member member1 = memberService.memberSelect(clinic.getId());
		Emp emp = empService.selectEmpno(clinic.getEmpno());
		Member member2 = memberService.memberSelect(emp.getId());
		
		model.addAttribute("clinic",clinic);
		model.addAttribute("name",member1.getName());
		model.addAttribute("ename",member2.getName());
		return "clinicDetail";
	}
}
