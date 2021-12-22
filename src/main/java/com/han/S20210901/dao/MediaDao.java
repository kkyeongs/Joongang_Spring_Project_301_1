package com.han.S20210901.dao;

import java.util.List;

import com.han.S20210901.model.Media;

public interface MediaDao {
	int mTotal();
	List<Media> mediaList(Media media);
	Media mediaDetail(int mnum);
	int mediaInsertPro(Media media);
	int mediaDeletePro(int mnum);
	int mediaUpdatePro(Media media);
	List<Media> mediaListMain(Media media);

}
