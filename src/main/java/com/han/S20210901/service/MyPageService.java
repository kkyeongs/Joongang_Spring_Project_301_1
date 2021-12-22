package com.han.S20210901.service;

import com.han.S20210901.model.Member;


  public interface MyPageService {
  
  Member myInfo(String sessionId, Member member); 
  }
 