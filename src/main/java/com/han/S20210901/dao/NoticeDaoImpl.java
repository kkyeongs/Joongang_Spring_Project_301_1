package com.han.S20210901.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.han.S20210901.model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int nTotal() {
		int nTotal=0;
		// notice 총 갯수
		try {
			nTotal = session.selectOne("nTotalSh");
			System.out.println("noticeTotal " + nTotal);
		} catch (Exception e) {
			System.out.println("NoticeDaoImpl noticeTotal Exception-> " + e.getMessage());
		}
		return nTotal;
	}

	@Override
	public List<Notice> noticeList(Notice notice) {
		System.out.println("NoticeDaoImpl noticeList start");
		List<Notice> noticeList = null;
		// notice 목록 불러오기
		try {
			noticeList = session.selectList("noticeListSh", notice);
		} catch (Exception e) {
			System.out.println("NoticeDaoImpl noticeList Exception-> " + e.getMessage());
		}
		return noticeList;
	}

	@Override
	public Notice noticeDetail(int nnum) {
		System.out.println("NoticeDaoImpl noticeDetail start");
		Notice notice = null;
		// 공지사항 조회수 업데이트
		session.update("ncountUpdateSh", nnum);
		// 공지사항 자세히보기
		notice = session.selectOne("noticeDetailSh", nnum);
		return notice;
	}

	@Override
	public int noticeUpdate(Notice notice) {
		System.out.println("NoticeDaoImpl noticeUpdate start");
		System.out.println(notice.getNdate());
		int result = 0;
		System.out.println("NoticeDaoImpl noticeUpdate getNcontent->"+notice.getNcontent());
		System.out.println("NoticeDaoImpl noticeUpdate getNtitle->"+notice.getNtitle());
		System.out.println("NoticeDaoImpl noticeUpdate getNimg->"+notice.getNimg());
		System.out.println("NoticeDaoImpl noticeUpdate getNdate->"+notice.getNdate());
		System.out.println("NoticeDaoImpl noticeUpdate getNnum->"+notice.getNnum());
		try {
			result = session.update("noticeUpdateSh", notice); 			
		} catch (Exception e) {
			System.out.println("noticeDao Exception-> " + e.getMessage());
		}
		System.out.println("NoticeDaoImpl noticeUpdate result->"+result);

		return result;
	}

	@Override
	public int noticeDelete(int nnum) {
		int result = 0;
		result = session.delete("noticeDeleteSh", nnum);
		return result;
	}

	@Override
	public int noticeInsert() {
		int result = 0;
		result = session.insert("noticeInsertSh");
		return result;
	}

	@Override
	public int noticeUploadForm(Notice notice) {
		System.out.println("noticedao noticeUploadForm start");
		int result = 0;
		try {
			result = session.insert("noticeUploadFormSh", notice);
		} catch (Exception e) {
			System.out.println("noticeDao noticeUploadForm Exception-> " + e.getMessage());
		}
		return result;
	}

	@Override
	public List<Notice> noticeListMain(Notice notice) {
		// 메인용 공지사항 리스트
		return session.selectList("noticeListMainSh", notice);
	}
}
