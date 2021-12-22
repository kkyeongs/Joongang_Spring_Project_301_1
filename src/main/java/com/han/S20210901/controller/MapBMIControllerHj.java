package com.han.S20210901.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

// 카카오 맵 및 BMI 컨트롤더
@Controller
public class MapBMIControllerHj {
	
	@RequestMapping(value = "map")
	public String MapHj() {
		return "kakaomap";
	}
	
	@RequestMapping(value = "bmi")
	public String BMI() {
		return "BMI";
	}
	
    @RequestMapping(value = "getBmiCal", produces = "application/text;charset=UTF-8")
    @ResponseBody
 	public String getBmiCal(int weight, int height) {
		System.out.println("MapBMIControllerHj getBmiCal weight->"+weight);
		System.out.println("MapBMIControllerHj getBmiCal height->"+height);
		/*
		 * double rheight = height/100; System.out.println("rheight -> " + rheight);
		 */
		double bmiLong = 0;
		String strBmi = "";
		bmiLong = weight * 10000/(height*height);
		System.out.println("bmiLong -> " + bmiLong);
  		strBmi=String.format("%.2f", bmiLong);
		System.out.println("MapBMIControllerHj getBmiCal strBmi->"+strBmi);
		
 		return strBmi;
    
     }

	
}
