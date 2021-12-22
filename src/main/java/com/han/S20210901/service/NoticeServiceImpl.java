package com.han.S20210901.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.NoticeDao;
import com.han.S20210901.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao nd;
	
	@Override
	public int nTotal() {
		// notice 총 갯수
		int nTotal = 0;
		nTotal = nd.nTotal();
		return nTotal;
	}

	@Override
	public List<Notice> noticeList(Notice notice) {
		System.out.println("NoticeServiceImpl noticeList start");
		// notice 목록
		List<Notice> noticeList = null;
		noticeList = nd.noticeList(notice);
		return noticeList;
	}

	@Override
	public Notice noticeDetail(int nnum) {
		// 공지사항 자세히보기
		System.out.println("NoticeServiceImpl noticeDetail start");
		Notice notice = null;
		notice = nd.noticeDetail(nnum);
		return notice;
	}

	@Override
	public int noticeUpdate(Notice notice) {
		System.out.println("NoticeServiceImpl noticeUpdate start");
		System.out.println(notice.getNdate());
		int result = 0;
		result = nd.noticeUpdate(notice);
		return result;
	}

	@Override
	public int noticeDelete(int nnum) {
		int result = 0;
		result = nd.noticeDelete(nnum);
		return result;
	}

	@Override
	public int noticeInsert() {
		int result = 0;
		result = nd.noticeInsert();
		return result;
	}

	@Override
	public int noticeUploadForm(Notice notice) {
		System.out.println("noticeServiceImpl noticeUploadForm start");
		// 공지사항 업로드
		int result = 0;
		result = nd.noticeUploadForm(notice);
		return result;
	}

	@Override
	public List<Notice> noticeListMain(Notice notice) {
		// 공지사항 리스트 메인용
		return nd.noticeListMain(notice);
	}


}
