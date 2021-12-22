package com.han.S20210901.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.han.S20210901.dao.ReplysDao;
import com.han.S20210901.model.MyselfTest;
import com.han.S20210901.model.Replys;

@Service
public class ReplysServiceImpl implements ReplysService {
	
	@Autowired
	private ReplysDao replysDao;

	@Override
	public List<Replys> replysOfPnum(int pnum) {
		System.out.println("ReplysServiceImpl replysOfPnum Start...");
		List<Replys> replys = replysDao.replyOfPnum(pnum);
		return replys;
	}

	@Override
	public void insertReply(Replys reply) {
		System.out.println("ReplysServiceImpl insertReply Start...");
		replysDao.insertReply(reply);
	}

	@Override
	public void deleteReply(int replynum) {
		System.out.println("ReplysServiceImpl deleteReply() Start...");
		replysDao.deleteReply(replynum);
		
	}

	@Override
	public int replyupdate(Replys reply) {
		System.out.println("ReplysServiceImpl replyupdate() Start..");
		int result = replysDao.replyUpdate(reply);
		return result;
	}

	@Override
	public int deleteReplyAll(int pnum) {
		System.out.println("ReplysServiceImpl deleteReplyAll() start...");
		int result2 = replysDao.deleteReplyAll(pnum);
		
		return result2;
		
	}

	@Override
	public int calculatePoint(MyselfTest myselfTest) {
		// 계산 구현 
		int total = myselfTest.getMyTest1()+myselfTest.getMyTest2()+myselfTest.getMyTest3()+myselfTest.getMyTest4()+myselfTest.getMyTest5()+
					myselfTest.getMyTest6()+myselfTest.getMyTest7()+myselfTest.getMyTest8()+myselfTest.getMyTest9()+myselfTest.getMyTest10()+
					myselfTest.getMyTest11()+myselfTest.getMyTest12()+myselfTest.getMyTest13()+myselfTest.getMyTest14()+myselfTest.getMyTest15();
		return total;
	}
}
