package com.han.S20210901.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.han.S20210901.model.Notice;
import com.han.S20210901.service.NoticeService;
import com.han.S20210901.service.PagingSh;

@Controller
public class NoticeControllerSh {
	
	@Autowired
	private NoticeService ns;
	
	@RequestMapping(value = "noticeList")
	public String noticeList(Notice notice, Model model, String currentPage) {
		System.out.println("NoticeController noticeList start");
		// notice 페이징
		int totalCnt = ns.nTotal();
		PagingSh pg = new PagingSh(totalCnt, currentPage);

		notice.setStart(pg.getStart());
		notice.setEnd(pg.getEnd());
		//공지사항 목록 가져옴
		List<Notice> noticeList = null;
		noticeList = ns.noticeList(notice);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("nTotal", totalCnt);
		model.addAttribute("pg", pg);
		
		return "noticeList";
	}
	
	@RequestMapping(value = "noticeDetail")
	public String noticeDetail(int nnum, Model model) {
		// 공지사항 자세히보기?
		System.out.println("NiticeController noticeDetail start");
		Notice notice = ns.noticeDetail(nnum);
		model.addAttribute("notice", notice);
		return "noticeDetail";
	}
	
	@RequestMapping(value = "noticeUpdate")
	public String noticeUpdate(int nnum, Model model) {
		System.out.println("noticeController noticeUpdate start");
		// 관리자용 공지사항 수정 불러오기
		Notice notice = ns.noticeDetail(nnum);
		model.addAttribute("notice", notice);
		return "noticeUpdateForm";
	}
	
	@RequestMapping(value = "noticeUpdateResult")
	public String noticeUpdateResult(Notice notice, Model model) {
		System.out.println("NoticeController noticeUpdateResult start");
		// 관리자용 공지사항 수정
		System.out.println(notice.getNdate());
		int result = 0;
		result = ns.noticeUpdate(notice);
		System.out.println("noticeController noticeUpdateResult result -> " + result);
		model.addAttribute("result", result);
		return "noticeUpdatePro";
	}
	
	@RequestMapping(value = "noticeDelete")
	public String noticeDelete(int nnum, Model model) {
		// 관리자용 공지사항 삭제
		System.out.println("NoticeController noticeDelete delete");
		int result = 0;
		result = ns.noticeDelete(nnum);
		model.addAttribute("result", result);
		return "noticeDeletePro";
	}
	
	@RequestMapping(value = "noticeInsertForm")
	public String noticeInsert(Model model) {
		// 관리자용 공지사항 추가 폼
		return "noticeInsertForm";
	}
	
	@RequestMapping(value = "noticeInsertResult", method = RequestMethod.POST)
	public String noticeInsertResult(Notice notice, HttpServletRequest request, MultipartFile file, Model model) throws IOException {
		// 관리자용 공지사항 업로드
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println("noticeController noticeInsertResult start");
		String saveName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
		notice.setNimg(saveName);
		int result = 0;
		result = ns.noticeUploadForm(notice);
		
		model.addAttribute("result", result);
		return "noticeInsertPro";
	}
	
	private String uploadFile(String originalFilename, byte[] fileData, String uploadPath) throws IOException {
		//UUID-> universally unique identifier. 세계적으로 유일한 식별 번호를 만들어준다?
		UUID uid = UUID.randomUUID();	
		// requestPath = requestPath + "/resources/image";
		System.out.println("uploadPath-> " + uploadPath);
		// Directory 생성 
		File fileDirectory = new File(uploadPath);
		if(!fileDirectory.exists()) {	// 존재하지 않으면 ?
			fileDirectory.mkdirs();	//mkdirs-> make dir
			System.out.println("업로드용 폴더 생성 : " + uploadPath);
		}
		
		String saveName = uid.toString() + "_" + originalFilename;
		File target = new File(uploadPath, saveName);
		// File target = new File(requestPath, saveName);
		FileCopyUtils.copy(fileData, target);	// 실제로 값 올리는 부분인듯 org.springframework.util.FileCopyUtils
		
		return saveName;
	}
	
}
