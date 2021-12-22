package com.han.S20210901.dao;

import java.util.List;

import com.han.S20210901.model.Notice;

public interface NoticeDao {
	int nTotal();
	List<Notice> noticeList(Notice notice);
	Notice noticeDetail(int nnum);
	int noticeUpdate(Notice notice);
	int noticeDelete(int nnum);
	int noticeInsert();
	int noticeUploadForm(Notice notice);
	List<Notice> noticeListMain(Notice notice);

}
