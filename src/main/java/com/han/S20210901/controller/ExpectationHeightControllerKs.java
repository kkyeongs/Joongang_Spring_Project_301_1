package com.han.S20210901.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExpectationHeightControllerKs {
	
	// 버튼에다가 해당 value 매핑해주세요!!~~
	// <button onclick="window.open('expectationHeight.html','window_name','width=1000,height=700,location=no,status=no,scrollbars=yes');">예상 키 측정</button>
	// 계산은 js에서 알아서 하니까 계산식을 변경하고 싶다면 js로 가세용
	// 예상키 알아보기 팝업, 경성
	@GetMapping(value = "expectationHeight")
	public String expectationHeightForm() {
		System.out.println("expectationHeightControllerKs expectationHeightForm() start...");
		
		return "expectationHeight";
	}
}
