package com.han.S20210901.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.han.S20210901.model.Media;
import com.han.S20210901.service.MediaService;
import com.han.S20210901.service.PagingSh;

@Controller
public class MediaControllerSh {
	
	@Autowired
	private MediaService ms;
	
	@RequestMapping(value = "mediaList")
	public String mediaList(Media media, Model model, String currentPage) {
		// 강연방송 목록 가져옴
		System.out.println("MediaController mediaList start");
		// media 페이징
		int totalCnt = ms.mTotal();
		PagingSh pg = new PagingSh(totalCnt, currentPage);

		media.setStart(pg.getStart());
		media.setEnd(pg.getEnd());
		
		List<Media> mediaList = null;
		mediaList = ms.mediaList(media);
		model.addAttribute("mediaList", mediaList);
		model.addAttribute("mTotal", totalCnt);
		model.addAttribute("pg", pg);
		
		System.out.println("mediaList.size-> " + mediaList.size());
		
		return "mediaList";
	}
	
	@RequestMapping(value = "mediaDetail")
	public String mediaDetail(int mnum, Model model) {
		// 강연방송 상세페이지 불러오기
		System.out.println("mediaController mediaDetail start");
		Media media = ms.mediaDetail(mnum);
		model.addAttribute("media", media);
		return "mediaDetail";
	}
	
	@RequestMapping(value = "mediaInsertForm")
	public String mediaInsertForm() {
		return "mediaInsertForm";
	}
	
	@RequestMapping(value = "mediaInsertPro", method = RequestMethod.POST)
	public String mediaInsertPro(Media media, Model model) {
		System.out.println("mediaController mediaInsertPro start");
		int result = 0;
		result = ms.mediaInsertPro(media);
		model.addAttribute("result", result);
		return "mediaInsertPro";
	}
	
	@RequestMapping(value = "mediaDeletePro")
	public String mediaDelete(int mnum, Model model) {
		System.out.println("mediaController mediaDelete start");
		int result = 0;
		result = ms.mediaDeletePro(mnum);
		model.addAttribute("result", result);
		return "mediaDeletePro";
	}
	
	@RequestMapping(value = "mediaUpdate")
	public String mediaUpdate(int mnum, Model model) {
		System.out.println("mediaController mediaUpdate start");
		Media media = ms.mediaDetail(mnum);
		model.addAttribute("media", media);
		return "mediaUpdate";
	}
	
	@RequestMapping(value = "mediaUpdatePro")
	public String mediaUpdatePro(Media media, Model model) {
		System.out.println("mediaController mediaUpdatePro start");
		int result = 0;
		result = ms.mediaUpdatePro(media);
		model.addAttribute("result", result);
		return "mediaUpdatePro";
	}

	
//	@RequestMapping(value = "mediaInsertPro", method = RequestMethod.POST)
//	public String mediaInsertPro(Media media, Model model, HttpServletRequest request, MultipartFile file) throws IOException {
//		System.out.println("mediaController mediaInsertPro start");
//		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
//		String saveName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
//		media.setMsumnail(saveName);
//		int result = 0;
//		result = ms.mediaInsertPro(media);
//		model.addAttribute("result", result);
//		return "mediaInsertPro";
//	}
//	
//	private String uploadFile(String originalFilename, byte[] fileData, String uploadPath) throws IOException {
//		//UUID-> universally unique identifier. 세계적으로 유일한 식별 번호를 만들어준다?
//		UUID uid = UUID.randomUUID();	
//		// requestPath = requestPath + "/resources/image";
//		System.out.println("uploadPath-> " + uploadPath);
//		// Directory 생성 
//		File fileDirectory = new File(uploadPath);
//		if(!fileDirectory.exists()) {	// 존재하지 않으면 ?
//			fileDirectory.mkdirs();	//mkdirs-> make dir
//			System.out.println("업로드용 폴더 생성 : " + uploadPath);
//		}
//		
//		String saveName = uid.toString() + "_" + originalFilename;
//		File target = new File(uploadPath, saveName);
//		// File target = new File(requestPath, saveName);
//		FileCopyUtils.copy(fileData, target);	// 실제로 값 올리는 부분인듯 org.springframework.util.FileCopyUtils
//		
//		return saveName;
//	}
	
}
