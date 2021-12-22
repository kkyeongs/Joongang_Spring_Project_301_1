package com.han.S20210901.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.han.S20210901.model.Media;

@Repository
public class MediaDaoImpl implements MediaDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int mTotal() {
		return session.selectOne("mTotalSh");
	}

	@Override
	public List<Media> mediaList(Media media) {
		System.out.println("dao mediaList start");
		return session.selectList("mediaListSh", media);
	}

	@Override
	public Media mediaDetail(int mnum) {
		System.out.println("mediaDao mediaDetail start");
		// 강연방송 조회수 + 1
		session.update("mediaCountSh", mnum);
		// 강연방송 상세페이지 불러오기
		Media media = session.selectOne("mediaDetailSh", mnum);
		return media;
	}

	@Override
	public int mediaInsertPro(Media media) {
		System.out.println("mediaDao mediaInsertPro start");
		return session.insert("mediaInsertProSh", media);
	}

	@Override
	public int mediaDeletePro(int mnum) {
		// 강연방송 삭제
		return session.delete("mediaDeleteProSh", mnum);
	}

	@Override
	public int mediaUpdatePro(Media media) {
		// 강연방송 업데이트
		return session.update("mediaUpdateProSh", media);
	}

	@Override
	public List<Media> mediaListMain(Media media) {
		// 강연방송 메인용 페이징x
		return session.selectList("mediaListMainSh", media);
	}
}
